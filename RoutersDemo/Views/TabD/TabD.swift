//
//  TabD.swift
//  RoutersDemo
//
//  Created by Itay Amzaleg on 10/03/2024.
//

import SwiftUI

struct TabD: View {
    typealias Destination = TabDRouter.Destination
    
    enum NavigationItem: String, CaseIterable, Identifiable {
        case subview = "Tab d subview"
        case inbox
        
        var id: String {
            return rawValue
        }
    }
    
    enum SheetItem: String, CaseIterable, Identifiable {
        case viewOne = "View one"
        case bicycle
        
        var id: String {
            return rawValue
        }
    }
    
    private let navigationTitle = ContentView.Tab.d.title
    @Environment(TabDRouter.self) private var router
    @Environment(\.presentedSheet) var presentedSheet
    
    // MARK: - Views
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.path) {
            listView
                .navigationTitle(navigationTitle)
                .routerDestination(router: router,
                                   navigationBackTitle: navigationTitle,
                                   destination: navigationDestination)
        }
    }
    
    @ViewBuilder private func navigationDestination(_ destination: Destination) -> some View {
        switch destination {
        case .subview:
            Image(systemName: "d.circle")
                .font(.extraLargeTitle)
        case .inbox:
            InboxView()
                .environment(\.inboxRouter, router)
        }
    }
    
    private var listView: some View {
        List {
            Section("Navigation items") {
                ForEach(NavigationItem.allCases, id: \.self) { item in
                    listRow(title: item.rawValue.capitalized)
                        .onTapGesture {
                            didSelectNavigationItem(item)
                        }
                }
            }
            
            Section("Sheet items") {
                ForEach(SheetItem.allCases, id: \.self) { item in
                    listRow(title: item.rawValue.capitalized)
                        .onTapGesture {
                            didSelectSheetItem(item)
                        }
                }
            }
        }
    }
    
    private func listRow(title: String) -> some View {
        Text(title)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .contentShape(Rectangle())
    }
    
    // MARK: - Private
    private func didSelectNavigationItem(_ item: NavigationItem) {
        switch item {
        case .subview:
            router.navigate(to: .subview)
        case .inbox:
            router.navigate(to: .inbox)
        }
    }
    
    private func didSelectSheetItem(_ item: SheetItem) {
        switch item {
        case .viewOne:
            presentedSheet.wrappedValue = .viewOne
        case .bicycle:
            presentedSheet.wrappedValue = .transportation(type: .bicycle)
        }
    }
}
