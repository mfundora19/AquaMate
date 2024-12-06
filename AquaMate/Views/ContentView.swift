//
//  ContentView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var greetUser = true
    @State var user: User? = nil
    
    var body: some View {
        ZStack {
            Color(.bg)
                .ignoresSafeArea()
            
            ZStack {
                if let user {
                    if greetUser {
                        UserCardView(name: user.name, finishGreetingUser: $greetUser)
                            .transition(.blurReplace(.downUp))
                    }
                } else {
                    RegisterView(onUserCreated: { newUser in
                        user = newUser
                    })
                        .transition(.opacity)
                }
            }
            .animation(.easeInOut(duration: 0.7), value: greetUser)
        }
    }
}

#Preview {
    ContentView()
}
