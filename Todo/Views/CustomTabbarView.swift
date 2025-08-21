//
//  CustomTabbarView.swift
//  Todo
//
//  Created by 刘林 on 2025/8/22.
//

import SwiftUI

struct CustomTabbarView: View {
    @EnvironmentObject var tabController: AppTabBarController
    
    var body: some View {
        HStack {
            ForEach(tabItems) { item in
                Spacer()
                Image(systemName: item.iconName)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            tabController.selectedTab = item.tab
                            tabController.xOffset = CGFloat(item.index) * 70
                            print("当前点中的选项是：\( tabController.selectedTab)")
                        }
                    }
                Spacer()
            }
            .frame(width: 23.3)
        }
        .frame(height: 72)
        .background(.black, in: RoundedRectangle(cornerRadius: 24))
        .overlay(alignment: .bottomLeading) {
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(.white)
                .offset(x: 30, y: -12)
                .offset(x: tabController.xOffset)
        }
    }
}

#Preview {
    CustomTabbarView()
        .environmentObject(AppTabBarController())
        .frame(width: 300, height: 100)
        .padding()
}
