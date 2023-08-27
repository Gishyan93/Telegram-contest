//
//  Coordinator.swift
//  Telegram-contest
//
//  Created by Tigran Gishyan on 25.08.23.
//

import UIKit

protocol Coordinator: AnyObject {
    var id: UUID { get }
    var children: [Coordinator] { get set }
    
    func start()
}

extension Coordinator {
    func add(child: Coordinator) {
        children.append(child)
    }
    
    func remove(child: Coordinator) {
        children.removeAll(where: {
            print($0.id)
            print(child.id)
            return $0.id == child.id
        })
    }
}

protocol HorizontalCoordinator: Coordinator {
    func push(viewController controller: UIViewController)
    func pop()
    func pop(last: Int)
}

extension HorizontalCoordinator {
    func pop() {}
    func pop(last: Int) {}
}

protocol VerticalCoordinator: Coordinator {
    func present(navigationController: UINavigationController)
}

