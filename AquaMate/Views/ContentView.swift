//
//  ContentView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var greetUser = true
    
    var body: some View {
        ZStack {
            Color(.bg)
                .ignoresSafeArea()
            
            ZStack {
                if greetUser {
                    UserCardView(name: nil, finishGreetingUser: $greetUser)
                        .transition(.blurReplace)
                } else {
                    RegisterView()
                        .transition(.blurReplace)
                }
            }
            .animation(.easeInOut(duration: 0.5), value: greetUser)
        }
    }
}

#Preview {
    ContentView()
}
