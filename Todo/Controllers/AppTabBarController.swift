//
//  AppTabBarController.swift
//  Todo
//
//  Created by 刘林 on 2025/8/22.
//

import SwiftUI

enum TabItemType {
    case TabType
    case ButtonType
}

enum Tab {
    case Home
    case TaskList
    case AddTask
    case Graphic
    case Profile
}

struct TabItem: Identifiable {
    var id = UUID()
    var type: TabItemType
    var icon: String
    var tab: Tab
}

var tabItems: [TabItem] = [
    TabItem(type: .TabType, icon: "house", tab: .Home),
    TabItem(type: .TabType, icon: "checklist.unchecked", tab: .TaskList),
    TabItem(type: .ButtonType, icon: "plus", tab: .AddTask),
    TabItem(type: .TabType, icon: "chart.pie", tab: .Graphic),
    TabItem(type: .TabType, icon: "person", tab: .Profile),
]

class AppTabBarController: ObservableObject {
    @Published var selectedTab: Tab = .Home
}
