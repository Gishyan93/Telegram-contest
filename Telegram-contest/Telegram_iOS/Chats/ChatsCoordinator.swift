//
//  ChatsCoordinator.swift
//  Telegram-contest
//
//  Created by Tigran Gishyan on 27.08.23.
//

import UIKit

class ChatsCoordinator: HorizontalCoordinator {
    var id: UUID = .init()
    var children: [Coordinator] = []
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ChatsFactory.makeChatsViewController(coordinator: self)
        navigationController.setViewControllers([controller], animated: false)
    }
    
    func push(viewController controller: UIViewController) {
        
    }
}
