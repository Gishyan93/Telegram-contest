//
//  UIViewController+.swift
//  Telegram-contest
//
//  Created by Tigran Gishyan on 27.08.23.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        let storyBoard = UIStoryboard(name: String(describing: Self.self), bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
        if let viewController = viewController as? Self {
            return viewController
        }
        fatalError("\(self) couldn't instantiate")
    }
}
