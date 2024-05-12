//
//  RouterDestination.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 10/03/2024.
//

import SwiftUI

protocol RouterDestination: Hashable, Identifiable, Equatable, Codable, CustomStringConvertible {
    var id: String { get }
    var description: String { get }
}

extension RouterDestination {
    var id: String {
        return description
    }
}

extension RouterDestination where Self: RawRepresentable, RawValue == String {
    var description: String {
        return rawValue
    }
}

extension RouterDestination {
    static func == (lhs: any RouterDestination, rhs: any RouterDestination) -> Bool {
        return lhs.id == rhs.id
    }
}
