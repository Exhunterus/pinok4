//
//  ContentView.swift
//  Pinok4_vorobei_edition
//
//  Created by Иван Ткачев on 08/12/2023.
//

import SwiftUI
import Observation

struct AnimatedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(configuration.isPressed ? Color(white: 0.9) : .white)
            .foregroundStyle(.black)
            .clipShape(.circle)
            .scaleEffect(configuration.isPressed ? 0.7 : 1)
            .animation(.spring, value: configuration.isPressed)
    }
}
struct AnimatedButton2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(configuration.isPressed ? Color(white: 0.9) : .white)
            .foregroundStyle(.black)
            .clipShape(.circle)
            .scaleEffect(configuration.isPressed ? 0.7 : 1)

    }
}

struct ContentView: View {
    
    @State private var performAnimation = false
    @State private var performAnimation2 = false
    
    var body: some View {
        HStack(spacing: 100) {
            Button {
                if !performAnimation {
                    withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                        performAnimation = true
                    } completion: {
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
            
            Button {
                if !performAnimation2 {
                    withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                        performAnimation2 = true
                    } completion: {
                        performAnimation2 = false
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
                            .frame(width: performAnimation2 ? width : .zero)
                            .opacity(performAnimation2 ? 1 : .zero)
                        Image(systemName: systemName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: width)
                        Image(systemName: systemName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: performAnimation2 ? 0.5 : width)
                            .opacity(performAnimation2 ? .zero : 1)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                }
            }
            .frame(maxWidth: 62, maxHeight: 62)
            .buttonStyle(AnimatedButton2())
        }
        }
}

#Preview {
    ContentView()
}
