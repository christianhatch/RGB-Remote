//
//  WifiDeviceDiscoverer.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/19/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

enum WifiDeviceDiscoveryResult {
    case devices([WifiDevice])
    case error(Error)
}

typealias WifiDeviceDiscoveryCompletion = (WifiDeviceDiscoveryResult) -> Void


/// This class will scan the local network for WifiDevices. 
class WifiDeviceDiscoverer: NSObject {
    fileprivate static let discoveryString = "HF-A11ASSISTHREAD"
    fileprivate static let port: UInt16 = 48899
    
    fileprivate let socket = GCDAsyncUdpSocket()
    fileprivate let timeout: TimeInterval
    
    fileprivate var discoveredDevices: [WifiDevice] = []
    fileprivate var completion: WifiDeviceDiscoveryCompletion?
    
    init(timeout: TimeInterval) {
        self.timeout = timeout
        
        super.init()
        
        self.socket.synchronouslySetDelegate(self, delegateQueue: DispatchQueue(label: "WifiControllerUDP"))
        
        do {
            try socket.bind(toPort: WifiDeviceDiscoverer.port)
        } catch {
            print(#function, error)
        }
    }
}


//MARK: - Public API

extension WifiDeviceDiscoverer  {
    
    func discover(completion: @escaping WifiDeviceDiscoveryCompletion) {
        self.completion = completion
        startDiscovery()
        Timer.scheduledTimer(timeInterval: timeout, target: self, selector: #selector(self.callCompletion), userInfo: nil, repeats: false)
    }
    
    private func startDiscovery() {
        let broadcastHost = "255.255.255.255"
        
        do {
            try socket.beginReceiving()
            try socket.enableBroadcast(true)
        } catch {
//            print(#function, error)
            self.completion?(.error(error))
            return
        }
        
        let data = WifiDeviceDiscoverer.discoveryString.data(using: .utf8)!
        socket.send(data, toHost: broadcastHost, port: WifiDeviceDiscoverer.port, withTimeout: timeout, tag: 2)
    }
    
    @objc fileprivate func callCompletion() {
        completion?(.devices(discoveredDevices))
        socket.close()
    }
}


//MARK: - UDP Delegate

extension WifiDeviceDiscoverer: GCDAsyncUdpSocketDelegate {
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didSendDataWithTag tag: Int) {
//        print(#function, tag)
    }
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didNotSendDataWithTag tag: Int, dueToError error: Error) {
//        print(#function, tag, error)
        completion?(.error(error))
    }
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didReceive data: Data, fromAddress address: Data, withFilterContext filterContext: Any?) {
//        print(#function, data, address, filterContext)
        
        guard let string = String(data: data, encoding: .utf8),
            string != WifiDeviceDiscoverer.discoveryString
            else { return }
        
        let device = WifiDevice(discoveredString: string)
        discoveredDevices.append(device)
    }

    
    func udpSocketDidClose(_ sock: GCDAsyncUdpSocket, withError error: Error) {
//        print(#function, error)
    }
    
}








