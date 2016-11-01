//
//  WifiController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/14/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import CocoaAsyncSocket



class WifiController: NSObject {
    fileprivate static let port: UInt16 = 5577
    
    fileprivate let socket = GCDAsyncSocket()
    fileprivate let ipAddress: String
    
    
    //MARK: - Public API

    init(ipAddress: String) {
        self.ipAddress = ipAddress
        super.init()
        socket.synchronouslySetDelegate(self, delegateQueue: DispatchQueue(label: "WifiControllerTCP"))
    }
    
    func send(command: WifiCommand) {
        send(packet: command.packet())
    }
}




//MARK: - Private Implementation

fileprivate extension WifiController {

    private func connect() {
        do {
            try socket.connect(toHost: ipAddress, onPort: WifiController.port, withTimeout: 5)
        } catch {
            print(#function, error)
        }
    }
    
    func send(packet: Packet) {
        if !socket.isConnected {
            connect()
        }

        //something like this, but make sure to also always execute the last request;
        //this way when you lift your finger from the slider, the final position of the slider is always updated to the lights
//        RateLimit.execute(name: "SendPacket", limit: 0.5) {
            let data = Data(bytes: packet)
            self.write(data: data)
//        }
    }
    
    @objc func write(data: Data) {
        print(Date(), #function, data)
        socket.write(data, withTimeout: 0.5, tag: 1)
    }
}

//MARK: - TCP Delegate

extension WifiController: GCDAsyncSocketDelegate {
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
//        print(#function, err)
    }
    
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        print(#function, host, port)
    }
    
    func socket(_ sock: GCDAsyncSocket, didWritePartialDataOfLength partialLength: UInt, tag: Int) {
        print(#function, partialLength, tag)
    }
    
    func socket(_ sock: GCDAsyncSocket, didWriteDataWithTag tag: Int) {
        print(#function, tag)
    }
}




//open class RateLimit: NSObject {
//    
//    @discardableResult open class func execute(name: String, limit: TimeInterval, block: (Void) -> ()) -> Bool {
//        var executed = false
//        
//        queue.sync {
//            let now = Date()
//            
//            // Lookup last executed
//            let timeInterval = now.timeIntervalSince(dictionary[name] ?? .distantPast)
//            
//            // If the time since last execution is greater than the limit, execute
//            if timeInterval > limit {
//                // Record execution
//                dictionary[name] = now
//                
//                // Execute
//                block()
//                executed = true
//            }
//        }
//        
//        return executed
//    }
//    
//    open class func resetLimitForName(_ name: String) {
//        queue.sync {
//            let _ = dictionary.removeValue(forKey: name)
//        }
//    }
//    
//    open class func resetAllLimits() {
//        queue.sync {
//            dictionary.removeAll()
//        }
//    }
//    
//    
//    // MARK: - Internal
//    
//    static let queue = DispatchQueue(label: "com.samsoffes.ratelimit", attributes: [])
//    
//    static var dictionary = [String: Date]() {
//        didSet {
//            didChangeDictionary()
//        }
//    }
//    
//    class func didChangeDictionary() {
//        // Do nothing
//    }
//}
//











