//
//  MainScreen.swift
//  Todo
//
//  Created by 刘林 on 2025/8/22.
//

import SwiftUI

struct MainScreen: View {
    let selectedTab: TabIcon
    var body: some View {
        VStack {
            switch selectedTab {
            case .Home:
                HomeScreen()
            case .TaskList:
                TaskListScreen()
            case .AddTask:
                Text("创建页面")
            case .Graphic:
                GraphicScreen()
            case .Profile:
                ProfileScreen()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MainScreen(selectedTab: .Graphic)
}
