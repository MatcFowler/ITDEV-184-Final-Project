//
//  Decimal+Utils.swift
//  CookEZ
//
//  Created by Admin on 3/31/24.
//

//
import UIKit
import SwiftUI

extension Decimal {
    var doubleValue: Double {
        return  NSDecimalNumber(decimal: self).doubleValue
    }
}
