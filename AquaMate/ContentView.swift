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
        VStack {
            if greetUser {
                UserCard(name: nil, finishGreetingUser: $greetUser)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
