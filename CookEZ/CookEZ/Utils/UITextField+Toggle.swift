//
//  UITextField+Toggle.swift
//  CookEZ
//
//  Created by Admin on 3/26/24.
//

import UIKit
import SwiftUI

let passwordToggleButton = UIButton(type: .custom)

extension UITextField {
    func enablePasswordToggle() {
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        rightView = passwordToggleButton
        rightViewMode = .always
        
    }
    
    @objc func togglePasswordView(){
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
