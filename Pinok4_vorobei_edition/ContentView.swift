//
//  ContentView.swift
//  Pinok4_vorobei_edition
//
//  Created by Иван Ткачев on 08/12/2023.
//

import SwiftUI

struct AnimatedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(configuration.isPressed ? Color(white: 0.5) : .white)
            .foregroundStyle(.black)
            .clipShape(.circle)
            .animation(.linear(duration: 0.22), value: configuration.isPressed)
    }
}
struct ContentView: View {
    @State private var data = Data()
    @State private var performAnimation = false
    @State private var performAnimation2 = false
    
    var body: some View {
            Button {
                if !performAnimation {
                    withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                        performAnimation = true
                        performAnimation2 = true
                    } completion: {
                        withAnimation {
                            performAnimation2 = false
                        }
                        performAnimation = false
                    }
                }
            } label: {
                GeometryReader { proxy in
                    let width = proxy.size.width / 2
                    let systemName = "play.fill"
                    HStack(alignment: .center, spacing: 0) {
                        Image(systemName: systemName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: performAnimation ? width : .zero)
                            .opacity(performAnimation ? 1 : .zero)
                        Image(systemName: systemName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: width)
                        Image(systemName: systemName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: performAnimation ? 0.5 : width)
                            .opacity(performAnimation ? .zero : 1)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                }
            }
            .frame(maxWidth: 62, maxHeight: 62)
            .buttonStyle(AnimatedButton())
            .scaleEffect(performAnimation2 ? 0.86 : 1)
        }
}

#Preview {
    ContentView()
}
