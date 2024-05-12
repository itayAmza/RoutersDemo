//
//  TabBRouter.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 10/03/2024.
//

import SwiftUI

@Observable class TabBRouter: BaseRouter {
    typealias TransportationType = TransportationView.TransportationType
    
    enum Destination: RouterDestination {
        case transportation(type: TransportationType)
        
        var description: String {
            return switch self {
            case .transportation(let type):
                "transportation(type: \(type))"
            }
        }
    }
    
    @ObservationIgnored override var routerDestinationTypes: [any RouterDestination.Type] {
        return [Destination.self]
    }
    
    //MARK: - Public
    func navigate(to destination: Destination) {
        path.append(destination)
    }
}
