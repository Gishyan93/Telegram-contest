//
//  Window+.swift
//  Telegram-contest
//
//  Created by Tigran Gishyan on 27.08.23.
//

import UIKit

extension UIWindow {
    /// Sets ViewController as rootViewcontroller of the window.
    /// if `animated` is true, and `rootViewController` is not `nil` perfors crossDissolve animation
    /// - Parameters:
    ///   - controller: ViewController to set as rootViewController
    ///   - animated: flag to perform setting animated
    func setRootViewController(_ controller: UIViewController, animated: Bool = false) {
        
        self.rootViewController = controller
        if animated && self.rootViewController != nil {
            UIView.transition(
                with: self,
                duration: 0.2,
                options: [.transitionCrossDissolve],
                animations: {},
                completion: nil
            )
        }
    }
}
