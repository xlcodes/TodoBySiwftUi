//
//  AppTabBarController.swift
//  Todo
//
//  Created by 刘林 on 2025/8/22.
//

import SwiftUI

struct TabBar: Identifiable {
    var id = UUID()
    var iconName: String
    var tab: TabIcon
    var index: Int
}

enum TabIcon: String {
    case Home
    case TaskList
    case AddTask
    case Graphic
    case Profile
}

let tabItems: [TabBar] = [
    TabBar(iconName: "house", tab: .Home, index: 0),
    TabBar(iconName: "checklist.unchecked", tab: .TaskList, index: 1),
    TabBar(iconName: "plus.circle", tab: .AddTask, index: 2),
    TabBar(iconName: "chart.pie", tab: .Graphic, index: 3),
    TabBar(iconName: "person", tab: .Profile, index: 4),
]

class AppTabBarController: ObservableObject {
    @Published var selectedTab: TabIcon = .Home
    @Published var xOffset: CGFloat = 0 * 70.0
}
