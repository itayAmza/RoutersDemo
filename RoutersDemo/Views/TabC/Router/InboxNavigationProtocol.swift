//
//  InboxRouter.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 14/03/2024.
//

import Foundation

protocol InboxNavigationProtocol: BaseRouter, Observable {
    func navigate(to destination: InboxDestination)
}

enum InboxDestination: String, RouterDestination {
    case chat
    
    var title: String {
        rawValue.capitalized
    }
}
