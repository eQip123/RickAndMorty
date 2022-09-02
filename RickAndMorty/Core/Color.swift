//
//  Color.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 1/9/22.
//

import Foundation
import UIKit

extension UIColor {
        convenience init(hex: String, alpha: CGFloat? = 1.0) {
            var hexInt: UInt32 = 0
            let scanner: Scanner = Scanner(string: hex)
            scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
            hexInt = UInt32(bitPattern: scanner.scanInt32(representation: .hexadecimal) ?? 0)
        
            let hexint = Int(hexInt)
            let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
            let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
            let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
            let alpha = alpha!

            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    static let colorShadow: UIColor = UIColor(hex: "#000000", alpha: 0.5)
}
