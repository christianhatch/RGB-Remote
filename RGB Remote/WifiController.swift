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
    
    func getStatus(completion: ((String) -> Void)?) {
        
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

        let data = Data(bytes: packet)
        self.write(data: data)
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








extension WifiCommand {
    
    func packet() -> Packet {
        switch self {
        case .on:
            return PacketFactory.on()
        case .off:
            return PacketFactory.off()
        case .color(let color, let persist):
            return PacketFactory.color(color: color, persist: persist)
        }
    }
}








typealias Byte = UInt8
typealias Packet = [Byte]

fileprivate struct PacketFactory {
    
    static let local: UInt8 = 0x0f
    static let power: UInt8 = 0x71
    static let colorPersisted: UInt8 = 0x31
    static let colorTemporary: UInt8 = 0x41
    
}

fileprivate extension PacketFactory {
    
    static func on() -> Packet {
        return checkSum([power, 0x23, local])
    }
    
    static func off() -> Packet {
        return checkSum([power, 0x24, local])
    }
    
    static func color(color aColor: UIColor, persist: Bool) -> Packet {
        var redFloat: CGFloat = 0
        var greenFloat: CGFloat = 0
        var blueFloat: CGFloat = 0
        
        aColor.getRed(&redFloat, green: &greenFloat, blue: &blueFloat, alpha: nil)
        
        let red = toByte(float: redFloat)
        let green = toByte(float: greenFloat)
        let blue = toByte(float: blueFloat)
        let warmWhite: UInt8 = 0x00
        let coolWhite: UInt8 = 0x00
        let setRGB: UInt8 = 0xf0
        
        return checkSum([persist ? colorPersisted : colorTemporary, red, green, blue, warmWhite, coolWhite, setRGB, local])
    }
}


//MARK: - Helpers

fileprivate extension PacketFactory {
    
    static func toByte(float: CGFloat) -> Byte {
        let f2 = max(0.0, min(1.0, float))
        let byte = floor(f2 == 1.0 ? 255 : f2 * 256.0)
        return Byte(byte)
    }
    
    static func checkSum(_ packet: Packet) -> Packet {
        var packet = packet
        
        let theSum: UInt8 = packet.reduce(0, &+)
        packet.append(theSum)
        return packet
    }
}

















