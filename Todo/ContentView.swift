//
//  ContentView.swift
//  Todo
//
//  Created by 刘林 on 2025/8/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tabController = AppTabBarController()
    var body: some View {
        VStack(spacing: 0) {
            // MARK: 主体内容
            VStack {
                MainScreen(selectedTab: tabController.selectedTab)
            }
            // MARK: tabbar
            CustomTabbarView()
        }
        .environmentObject(tabController)
    }
}

#Preview {
    ContentView()
}
