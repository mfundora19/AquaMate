//
//  MainView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.bg)
                    .ignoresSafeArea()
                
                if viewModel.greetUser { // Greet the User
                    UserCardView(user: viewModel.user,
                                 finishGreetingUser: $viewModel.greetUser,
                                 notificationAcceptance: $viewModel.notificationAcceptance)
                    .transition(.opacity)
                    
                } else if let user = viewModel.user {
                    // If the User already Exist go directly to the HomeView
                    NavigationLink("", destination: HomeView(user: user, notify: viewModel.notificationAcceptance))
                        .navigationDestination(isPresented: $viewModel.navigationToHome) {
                            HomeView(user: user, notify: viewModel.notificationAcceptance)
                                .navigationBarBackButtonHidden()
                                .ignoresSafeArea()
                        }
                    
                } else {
                    // Show RegisterView if no user exists
                    RegisterView(
                        navigateToHome: $viewModel.navigationToHome,
                        onDataCreated: viewModel.handleUserCreation
                    )
                    .transition(.opacity)
                }
            }
            .animation(.easeInOut(duration: 0.7), value: viewModel.greetUser)
            .onAppear(perform: viewModel.preparations)
            .onChange(of: viewModel.greetUser) { _, _ in
                viewModel.handleGreetingCompletion()
            }
        }
    }
    

}

#Preview {
    MainView()
}
