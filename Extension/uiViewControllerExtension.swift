//
//  uiViewControllerExtension.swift
//  Fuel
//
//  Created by Diego Rodrigues on 19/04/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func hidekeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
