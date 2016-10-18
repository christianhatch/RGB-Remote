//
//  WifiController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/14/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

typealias Packet = [UInt8]

class WifiController: NSObject {
    fileprivate var socket = GCDAsyncSocket()

    
    static let sharedController = WifiController()
    
    override init() {
        super.init()
        socket.synchronouslySetDelegate(self, delegateQueue: DispatchQueue(label: "WifiController"))
    }
    
    func sendCommand(command: Command) {
        print(#function, command)
        
        if !socket.isConnected {
            connect()
        }
        send(packet: command.packet())
    }
}

fileprivate extension WifiController {

    func connect() {
        do {
            try socket.connect(toHost: "10.0.0.56", onPort: 5577, withTimeout: 5)
        } catch {
            print(#function, error)
        }
    }
    
    func send(packet: Packet) {
        let data = Data(bytes: checkSum(data: packet))
        socket.write(data, withTimeout: 5, tag: 1)
    }
    
    func checkSum(data: Packet) -> Packet {
        var data = data
        
        let theSum: UInt8 = data.reduce(0, &+)
        data.append(theSum)
        return data
    }
}


extension WifiController: GCDAsyncSocketDelegate {
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        print(#function, err)
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
    
//    func socket(_ sock: GCDAsyncSocket, shouldTimeoutWriteWithTag tag: Int, elapsed: TimeInterval, bytesDone length: UInt) -> TimeInterval {
//        print(#function, tag, elapsed, length)
//    }
}



fileprivate extension Command {
    func packet() -> Packet {
        switch self {
        case .on:
            return [0x71, 0x23, 0x0f]
        case .off:
            return [0x71, 0x24, 0x0f]
        
        case .blue:
            return [0x31, 0x00, 0x00, 0xff, 0x00, 0xf0, 0x0f]
            
        default:
            return [0x71, 0x23, 0x0f]
        }
    }
}





