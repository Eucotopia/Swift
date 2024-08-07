//
//  ContentView.swift
//  ChatPrototype
//
//  Created by 李伟 on 2024/8/7.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = "jobs"
    var body: some View {
        // alignment:对齐方式
        // spacing:间距
        VStack(alignment: .center,spacing: 50) {
            Text("knock, knock")
                .padding()
            // 第一个参数为 ShapeStyle ，实际上这是一个协议，任何符合该协议的类型都可以作为参数，颜色、渐变色等
            // 第二个参数为 Shape 协议
                .background(
                    .linearGradient(
                        Gradient(colors: [.yellow,.orange]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    in: RoundedRectangle(cornerRadius: 8)
                )

            Text("Who's there?")
                .padding()
                .background(
                    RadialGradient(
                        gradient: Gradient(colors: [.blue, .green]),
                        center: .center,
                        startRadius: 10,
                        endRadius: 150
                    ),
                    in: RoundedRectangle(cornerRadius: 8)
                )
                .shadow(color: .red, radius: 2, x: 1, y: 1)


            TextField("What's your name?", text: $name)
                .padding()
                .background(.yellow,in: RoundedRectangle(cornerRadius: 8))
                .frame(width: 200, height: 100)

            Text("you name is \(name)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
