//
//  Command.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/21/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation

protocol CommandConvertible {
    func humanReadableName() -> String
    func apiKey() -> String
    func color() -> XColor
}









