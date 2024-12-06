import SwiftUI

struct ContentView: View {
    @State var greetUser = true
    @State var user: User? = nil
    @State private var navigationToHome: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.bg)
                    .ignoresSafeArea()
                
                ZStack {
                    // Show the UserCardView while greeting the user
                    if greetUser {
                        UserCardView(name: user?.name, finishGreetingUser: $greetUser)
                            .transition(.opacity) // Transition when greeting user
                            .zIndex(1) // Ensure UserCardView stays on top
                    }
                    
                    // Check if user exists
                    if let user {
                        // Show HomeView if user exists using .navigationDestination
                        NavigationLink("", destination: HomeView(user: user))
                            .navigationDestination(isPresented: $navigationToHome) {
                                HomeView(user: user)
                                    .navigationTitle(user.name)
                                    .navigationBarBackButtonHidden()
                            }
                            .zIndex(0)
                    } else {
                        // Show RegisterView if no user exists
                        RegisterView(navigateToHome: $navigationToHome, onUserCreated: { newUser in
                            user = newUser
                            UserDefaultsManager.shared.saveUser(newUser)
                            
                            // Automatically trigger navigation to HomeView once the user is created
                            navigationToHome = true
                        })
                        .transition(.opacity) // Transition for RegisterView
                        .zIndex(0)
                    }
                }
                .animation(.easeInOut(duration: 0.7), value: greetUser)
                .onAppear {
                    // Load saved user if exists
                    user = UserDefaultsManager.shared.loadUser()
                }
                .onChange(of: greetUser) { _ , newValue in
                    if !newValue {
                        // When greeting finishes, navigate to the appropriate view
                        navigationToHome = (user != nil)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
