//
//  TabClipperShape.swift
//  Todo
//
//  Created by 刘林 on 2025/8/22.
//

import SwiftUI

struct TabClipperShape: Shape {
    var radius = 38.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let v = radius * 2
        // 移动到起点
        path.move(to: CGPoint(x: 0, y: 0))
        // 绘制左上角90°圆弧
        path.addArc(
            center: CGPoint(x: radius / 2, y: radius / 2),
            radius: radius / 2,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 180+90),
            clockwise: false
        )
        // 绘制中间水滴左边70°圆弧
        path.addArc(
            center: CGPoint(x: ((rect.size.width / 2) - radius) - radius + v * 0.04 + radius / 2, y: radius / 2),
            radius: radius / 2,
            startAngle: Angle(degrees: 270),
            endAngle: Angle(degrees: 270 + 70),
            clockwise: false
        )
        // 绘制中间水滴圆弧
        path.addArc(
            center: CGPoint(x: rect.size.width / 2, y: 0),
            radius: v / 2,
            startAngle: Angle(degrees: 160),
            endAngle: Angle(degrees: 20),
            clockwise: true
        )
        // 绘制中间水滴右边边70°圆弧
        path.addArc(
            center: CGPoint(x: (rect.size.width - ((rect.size.width / 2) - radius)) - v * 0.04 + radius / 2, y: radius / 2),
            radius: radius / 2,
            startAngle: Angle(degrees: 200),
            endAngle: Angle(degrees: 200 + 70),
            clockwise: false
        )
        // 绘制右上角90°圆弧
        path.addArc(
            center: CGPoint(x: rect.size.width - radius / 2, y: radius / 2),
            radius: radius / 2,
            startAngle: Angle(degrees: 270),
            endAngle: Angle(degrees: 270 + 90),
            clockwise: false
        )
        // 绘制上边线
        path.addLine(to: CGPoint(x: rect.size.width, y: 0))
        // 绘制右边线
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        // 绘制下边线
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        // 自动闭合图形
        return path
    }
}

struct TabClipperShape_Previews: PreviewProvider {
    static var previews: some View {
        TabClipperShape()
            .frame(maxWidth: .infinity)
            .frame(height: 72)
            .padding(.horizontal, 16)
    }
}
