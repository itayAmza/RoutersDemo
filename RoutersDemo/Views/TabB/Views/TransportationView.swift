//
//  TransportationView.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 11/03/2024.
//

import SwiftUI

struct TransportationView: View {
    enum TransportationType: String, CaseIterable, Identifiable, Codable {
        case airplane
        case car
        case bus
        case tram
        case cablecar
        case ferry
        case bicycle
        case scooter
        case sailboat
        
        var id: String {
            return rawValue
        }
    }
    
    private let type: TransportationType
    
    // MARK: - Lifecycle
    init(type: TransportationType) {
        self.type = type
    }
    
    // MARK: - Views
    var body: some View {
        Image(systemName: type.rawValue)
            .font(.extraLargeTitle)
    }
}

#Preview {
    TransportationView(type: .airplane)
}
