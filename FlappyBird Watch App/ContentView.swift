//
//  ContentView.swift
//  FlappyBird Watch App
//
//  Created by Moon Jongseek on 3/18/24.
//

import SwiftUI
import SpriteKit

struct ContentView: View{
    var body: some View {
        GeometryReader { geometryProxy in
            let scene = GameScene(size: geometryProxy.size)
            SpriteView(scene: scene)
            .onTapGesture { scene.tapGesture() }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
