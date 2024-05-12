//
//  TabDRouter.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 10/03/2024.
//

import SwiftUI

@Observable class TabDRouter: BaseRouter {
    enum Destination: String, RouterDestination {
        case subview = "Tab d subview"
        case inbox
    }
    
    //Protocols
    @ObservationIgnored override var routerDestinationTypes: [any RouterDestination.Type] {
        return [Destination.self, InboxDestination.self]
    }
    
    //MARK: - Public
    func navigate(to destination: Destination) {
        path.append(destination)
    }
}

//MARK: - InboxRouterProtocol
extension TabDRouter: InboxNavigationProtocol {
    func navigate(to destination: InboxDestination) {
        path.append(destination)
    }
}
