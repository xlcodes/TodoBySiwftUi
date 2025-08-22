//
//  ContentView.swift
//  Todo
//
//  Created by 刘林 on 2025/8/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tabBarController = AppTabBarController()
    
    var bottomBar: some View {
        HStack(spacing: 0) {
            Spacer()
            ForEach(tabItems) { tabItem in
                Button(action: {
                    withAnimation(.easeInOut) {
                        tabBarController.selectedTab = tabItem.tab
                    }
                }) {
                    if tabItem.type == .TabType {
                        VStack(spacing: 0) {
                            Image(systemName: tabItem.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                        }
                    } else {
                        Image(systemName: tabItem.icon)
                            .symbolVariant(.fill)
                            .font(.body.bold())
                            .frame(width: 56, height: 56)
                            .foregroundColor(Color.white)
                            .background(Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(.myTheme7), Color(.myTheme3)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .shadow(color: Color(.myTheme3).opacity(0.3), radius: 10, x: 8, y: 16))
                            .offset(y: -35)
                    }
                }
                .foregroundColor(tabBarController.selectedTab == tabItem.tab ? Color(.myTheme7) : Color(.myTheme3))
                .frame(maxWidth: .infinity)
                Spacer()
            }
            
        }
        .frame(height: 88, alignment: .top)
        .padding(.horizontal, 8)
        .padding(.top, 14)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch tabBarController.selectedTab {
                case .Home:
                    HomeScreen()
                case .TaskList:
                    TaskListScreen()
                case .AddTask:
                    AddTaskScreen()
                case .Graphic:
                    GraphicScreen()
                case .Profile:
                    ProfileScreen()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 88.0)
            
            TabClipperShape(radius: 38.0)
                .fill(Color.white)
                .frame(height: 88, alignment: .top)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: -1)
                .overlay(bottomBar)
        }
        .background(Color.white)
        .ignoresSafeArea()
        .environmentObject(tabBarController)
    }
}

#Preview {
    ContentView()
}
