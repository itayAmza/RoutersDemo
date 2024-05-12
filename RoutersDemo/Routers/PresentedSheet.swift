//
//  PresentedSheet.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 11/03/2024.
//

import Foundation

enum PresentedSheet: Identifiable {
    case viewOne
    case transportation(type: TransportationView.TransportationType)
    
    var id: String {
        return switch self {
        case .viewOne:
            "View one"
        case .transportation:
            "Transportation"
        }
    }
}
