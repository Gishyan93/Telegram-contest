//
//  ContactsCoordinator.swift
//  Telegram-contest
//
//  Created by Tigran Gishyan on 27.08.23.
//

import UIKit

class ContactsCoordinator: HorizontalCoordinator {
    
    var id = UUID()
    var children: [Coordinator] = []
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func push(viewController controller: UIViewController) {
        
    }
}
