//
//  MainCoordinator.swift
//  Telegram-contest
//
//  Created by Tigran Gishyan on 25.08.23.
//

import UIKit

enum MainCoordinatorItemType {
    case contacts
    case calls
    case chats
    case settings
    
    var images: (image: UIImage, selectedImage: UIImage) {
        switch self {
        case .contacts:
            return (
                UIImage(systemName: "person.crop.circle.fill")!,
                UIImage(systemName: "person.crop.circle.fill")!
            )
        case .calls:
            return (
                UIImage(systemName: "phone.fill")!,
                UIImage(systemName: "phone.fill")!
            )
        case .chats:
            return (
                UIImage(systemName: "bubble.left.and.bubble.right.fill")!,
                UIImage(systemName: "bubble.left.and.bubble.right.fill")!
            )
        case .settings:
            return (
                UIImage(systemName: "gear.circle")!,
                UIImage(systemName: "gear.circle")!
            )
        }
    }
}

class MainCoordinatorItem {
    var type: MainCoordinatorItemType
    
    var coordinator: Coordinator?
    var controller: UIViewController
    
    init(type: MainCoordinatorItemType, controller: UIViewController) {
        self.type = type
        
        controller.tabBarItem = UITabBarItem(
            title: "",
            image: type.images.image,
            selectedImage: type.images.selectedImage
        )
        self.controller = controller
    }
}

class MainCoordinator: Coordinator {
    var id: UUID = .init()
    var children: [Coordinator] = []
    var tabChildren: [Coordinator] = []
    
    let tabBarController: UITabBarController
    var itemIndexes: [MainCoordinatorItemType: Int] = [:]
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func makeItems() -> [MainCoordinatorItem] {
        var items: [MainCoordinatorItem] = []
        
        // MARK: - CONTACTS -
        let contactsNavController = UINavigationController()
        let contacts = MainCoordinatorItem(type: .contacts, controller: contactsNavController)
        let contactsCoordinator = ContactsCoordinator(navigationController: contactsNavController)
        contacts.coordinator = contactsCoordinator
        items.append(contacts)
        
        // MARK: - CALLS -
        let callsNavController = UINavigationController()
        let calls = MainCoordinatorItem(type: .calls, controller: callsNavController)
        let callsCoordinator = CallsCoordinator(navigationController: callsNavController)
        calls.coordinator = callsCoordinator
        items.append(calls)
        
        // MARK: - CHATS -
        let chatsNavController = UINavigationController()
        let chats = MainCoordinatorItem(type: .chats, controller: chatsNavController)
        let chatsCoordinator = ChatsCoordinator(navigationController: chatsNavController)
        chats.coordinator = chatsCoordinator
        items.append(chats)
        
        // MARK: -SETTINGS-
        let settingsNavController = UINavigationController()
        let settings = MainCoordinatorItem(type: .settings, controller: settingsNavController)
        let settingsCoordinator = SettingsCoordinator(navigationController: settingsNavController)
        settings.coordinator = settingsCoordinator
        items.append(settings)
        
        return items
    }
    
    func start() {
        self.children = []
        
        let items = makeItems()
        
        itemIndexes = [:]
        for (index, item) in items.enumerated() { itemIndexes[item.type] = index }
        
        tabBarController.setViewControllers(items.map({ $0.controller }), animated: false)
        
        for coordinator in items.compactMap({ $0.coordinator }) {
            tabChildren.append(coordinator)
            coordinator.start()
        }
    }
}

