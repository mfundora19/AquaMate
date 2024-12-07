import SwiftUI

struct ContentView: View {
    @State private var greetUser = true
    @State private var user: User? = nil
    @State private var navigationToHome = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.bg)
                    .ignoresSafeArea()
                
                if greetUser { // Greet the User
                    UserCardView(name: user?.name,
                                 finishGreetingUser: $greetUser)
                    .transition(.opacity)
                    
                } else if let user { // If the User already Exist go directly to the HomeView
                    NavigationLink("", destination: HomeView(user: user))
                        .navigationDestination(isPresented: $navigationToHome) {
                            HomeView(user: user)
                                .navigationBarBackButtonHidden()
                                .ignoresSafeArea()
                        }
                    
                } else {
                    // Show RegisterView if no user exists
                    RegisterView(
                        navigateToHome: $navigationToHome,
                        onUserCreated: handleUserCreation
                    )
                    .transition(.opacity)
                }
            }
            .animation(.easeInOut(duration: 0.7), value: greetUser)
            .onAppear(perform: loadUser)
            .onChange(of: greetUser) { _, _ in
                handleGreetingCompletion()
            }
        }
    }
    
    // MARK: - Helper Functions
    
    private func loadUser() {
        user = UserDefaultsManager.shared.loadUser()
    }
    
    private func handleUserCreation(newUser: User) {
        user = newUser
        UserDefaultsManager.shared.saveUser(newUser)
        navigationToHome = true
    }
    
    private func handleGreetingCompletion() {
        navigationToHome = (user != nil)
    }
}

#Preview {
    ContentView()
}
