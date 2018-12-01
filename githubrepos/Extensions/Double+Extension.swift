//
//  Double+Extension.swift
//  githubrepos
//
//  Created by Monsef Chakir on 01/12/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import Foundation

extension Double {
    var friendlyFormat: String {
        if self.isNaN {
            return "NaN"
        }
        if self.isInfinite {
            return "\(self < 0.0 ? "-" : "+")Infinity"
        }
        let units = ["", "k", "M"]
        var interval = self
        var i = 0
        while i < units.count - 1 {
            if abs(interval) < 1000.0 {
                break
            }
            i += 1
            interval /= 1000.0
        }
        return "\(String(format: "%0.*g", Int(log10(interval)) + 2, interval))\(units[i])"
    }
}
