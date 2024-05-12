//
//  DeeplinkManager.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 17/03/2024.
//

import Foundation
import Combine

class DeeplinkManager {
    enum DeeplinkType {
        case chat
        case transportation(type: TransportationView.TransportationType)
    }
    
    static let shared = DeeplinkManager()
    
    let userActivityPublisher = PassthroughSubject<DeeplinkType, Never>()
    
    // MARK: - Lifecycle
    private init() {}
}
