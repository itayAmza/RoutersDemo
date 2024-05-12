//
//  BaseRouter.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 10/03/2024.
//

import SwiftUI

@Observable class BaseRouter {
    var path: NavigationPath
    var isEmpty: Bool {
        return path.isEmpty
    }
    
    @ObservationIgnored var currentDestination: (any RouterDestination)? {
        return decodedPath?.last
    }
    
    @ObservationIgnored open var routerDestinationTypes: [any RouterDestination.Type] {
        fatalError("BaseRouter: must override routerDestinationTypes in subclass")
    }
    
    @ObservationIgnored private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.userInfo = [.routerDestinationTypes: routerDestinationTypes]
        return decoder
    }()
    
    @ObservationIgnored private var decodedPath: [any RouterDestination]? {
        guard let codableRepresentation = path.codable,
              let data = try? JSONEncoder().encode(codableRepresentation),
              let decodedRepresentation = try? decoder.decode(RouterDestinationDecoder.self, from: data) else {
            return nil
        }
        
        return decodedRepresentation.path
    }
    
    //MARK: - Lifecycle
    init(path: NavigationPath = NavigationPath()) {
        _path = path
        observePathChanges()
    }
    
    //MARK: - Public
    func navigateBack() {
        guard !isEmpty else {
            print("\(String(describing: self)) tried to navigate back on empty path")
            return
        }
        
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func contains(_ item: any RouterDestination) -> Bool {
        guard let decodedPath else {
            return false
        }
        
        return decodedPath.contains(where: { $0.id == item.id })
    }
    
    //MARK: - Private
    private func observePathChanges() {
        withObservationTracking {
            let _ = path
        } onChange: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                guard let self,
                      let decodedPath else {
                    return
                }
                
                print("➡️ \(String(describing: self)) navigation path changed \(decodedPath)⬅️")
                observePathChanges()
            }
        }
    }
}
