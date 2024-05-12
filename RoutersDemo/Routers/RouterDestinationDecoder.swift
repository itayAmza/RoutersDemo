//
//  RouterDestinationDecoder.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 10/03/2024.
//

import Foundation

struct RouterDestinationDecoder: Decodable {
    var path: [any RouterDestination]
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        
        guard let types = decoder.userInfo[.routerDestinationTypes] as? [any RouterDestination.Type] else {
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "No router destination types defined")
        }
        
        var path = [any RouterDestination]()
        while !container.isAtEnd {
            let rawTypeName = try container.decode(String.self)
            
            guard let typeName = rawTypeName.components(separatedBy: ".").last,
                  let type = types.first(where: { String(describing: $0) == typeName }) else {
                throw DecodingError.dataCorruptedError(in: container,
                                                       debugDescription: "\(rawTypeName) is not decodable")
            }
            
            let encodedValue = try container.decode(String.self)
            let value = try JSONDecoder().decode(type, from: Data(encodedValue.utf8))
            
            path.append(value)
        }
        
        self.path = path.reversed()
    }
}
