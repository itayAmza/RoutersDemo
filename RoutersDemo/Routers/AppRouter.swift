//
//  AppRouter.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 10/03/2024.
//

import Foundation

@Observable class AppRouter {
    //MARK: - App states
    var presentedSheet: PresentedSheet?
    var selectedTab: ContentView.Tab = .a
    
    //MARK: - Routers
    var tabARouter = TabARouter()
    var tabBRouter = TabBRouter()
    var tabCRouter = TabCRouter()
    var tabDRouter = TabDRouter()
}
