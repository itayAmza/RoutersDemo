//
//  View+Extensions.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 10/03/2024.
//

import SwiftUI

extension View {
    func navigationBackButton(title: String? = nil, action: @escaping () -> Void) -> some View {
        navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: action, label: {
                        HStack(spacing: 0) {
                            Image(systemName: "chevron.backward")
                                .fontWeight(.semibold)
                            
                            if let title {
                                Text(title)
                                    .foregroundStyle(Color.accentColor)
                            }
                        }
                        
                    })
                    .frame(minWidth: .navigationBarHeight)
                    .offset(x: .navigationBackButtonXOffset)
                }
            }
    }
    
    func routerDestination<D, C>(router: BaseRouter,
                                 navigationBackTitle: String? = nil,
                                 @ViewBuilder destination: @escaping (D) -> C) -> some View where D : Hashable, C : View {
        navigationDestination(for: D.self) { item in
            destination(item)
                .navigationBackButton(title: navigationBackTitle, action: router.navigateBack)
        }
    }
}
