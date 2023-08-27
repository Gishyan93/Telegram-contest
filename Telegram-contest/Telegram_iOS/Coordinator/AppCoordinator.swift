//
//  AppCoordinator.swift
//  Telegram-contest
//
//  Created by Tigran Gishyan on 25.08.23.
//

import UIKit
import Combine

class AppCoordinator: Coordinator {
    var id: UUID = .init()
    var children: [Coordinator] = []
    let window: UIWindow
        
    var topViewController: UIViewController? {
        guard
            var topViewController = window.rootViewController
        else { return nil }
        
        while let controller = topViewController.presentedViewController {
            topViewController = controller
        }
        
        return topViewController
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showMainCoordinator()
    }
        
    private func showMainCoordinator() {
        let tabBarController = MainTabBarController()
        
        let mainCoordinator = MainCoordinator(tabBarController: tabBarController)
        add(child: mainCoordinator)
        
        window.setRootViewController(tabBarController, animated: true)
        mainCoordinator.start()
    }
}
