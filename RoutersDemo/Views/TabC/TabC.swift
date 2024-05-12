//
//  TabC.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 10/03/2024.
//

import SwiftUI

struct TabC: View {
    typealias Destination = TabCRouter.Destination
    
    private let navigationTitle = ContentView.Tab.c.title
    @Environment(TabCRouter.self) private var router
    
    // MARK: - Views
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.path) {
            VStack {
                Button {
                    router.navigate(to: .inbox)
                } label: {
                    VStack {
                        Image(systemName: "envelope")
                            .font(.extraLargeTitle)
                        
                        Text("Go to inbox")
                            .font(.body)
                    }
                    .foregroundStyle(Color.primary)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.systemGroupedBackground)
            .routerDestination(router: router,
                               navigationBackTitle: navigationTitle,
                               destination: navigationDestination)
            .navigationTitle(navigationTitle)
        }
    }
    
    @ViewBuilder private func navigationDestination(_ destination: Destination) -> some View {
        switch destination {
        case .inbox:
            InboxView()
                .environment(\.inboxRouter, router)
        }
    }
}
