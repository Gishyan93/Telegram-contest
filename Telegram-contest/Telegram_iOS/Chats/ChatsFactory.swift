//
//  ChatsFactory.swift
//  Telegram-contest
//
//  Created by Tigran Gishyan on 27.08.23.
//

import UIKit

class ChatsFactory {
    static func makeChatsViewController(
        coordinator: ChatsCoordinator
    ) -> ChatsViewController {
        let router = ChatsRouter(coordiantor: coordinator)
        let presenter = ChatsPresenter(router: router)
        
        let controller = ChatsViewController.instantiate()
        controller.presenter = presenter
        
        return controller
    }
}
