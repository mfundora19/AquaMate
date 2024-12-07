import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.bg)
                    .ignoresSafeArea()
                
                if viewModel.greetUser { // Greet the User
                    UserCardView(name: viewModel.user?.name,
                                 finishGreetingUser: $viewModel.greetUser)
                    .transition(.opacity)
                    
                } else if let user = viewModel.user {
                    // If the User already Exist go directly to the HomeView
                    NavigationLink("", destination: HomeView(user: user))
                        .navigationDestination(isPresented: $viewModel.navigationToHome) {
                            HomeView(user: user)
                                .navigationBarBackButtonHidden()
                                .ignoresSafeArea()
                        }
                    
                } else {
                    // Show RegisterView if no user exists
                    RegisterView(
                        navigateToHome: $viewModel.navigationToHome,
                        onDataCreated: viewModel.handleDataCreation
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
