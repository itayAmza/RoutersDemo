//
//  RoutersDemoApp.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 10/03/2024.
//

import SwiftUI

@main
struct RoutersDemoApp: App {
    @Bindable private var appRouter = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appRouter)
                .onReceive(DeeplinkManager.shared.userActivityPublisher, perform: handleDeeplink)
//                .task {
//                    try? await Task.sleep(for: .seconds(3))
//                    DeeplinkManager.shared.userActivityPublisher.send(.chat)
//                }
//                .task {
//                    try? await Task.sleep(for: .seconds(3))
//                    DeeplinkManager.shared.userActivityPublisher.send(.transportation(type: .bus))
//                }
        }
    }
    
    // MARK - Deeplinks
    func handleDeeplink(_ type: DeeplinkManager.DeeplinkType) {
        switch type {
        case .chat:
            appRouter.presentedSheet = nil
            appRouter.selectedTab = .c
            appRouter.tabCRouter.navigate(to: .inbox)
            appRouter.tabCRouter.navigate(to: .chat)
        case .transportation(let type):
            appRouter.presentedSheet = .transportation(type: type)
        }
    }
}
