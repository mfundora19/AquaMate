import SwiftUI

struct ContentView: View {
    @State private var greetUser = true
    @State private var user: User? = nil
    @State private var appSettings: AppSettings? = nil
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
                        onDataCreated: handleDataCreation
                    )
                    .transition(.opacity)
                }
            }
            .animation(.easeInOut(duration: 0.7), value: greetUser)
            .onAppear(perform: preparations)
            .onChange(of: greetUser) { _, _ in
                handleGreetingCompletion()
            }
        }
    }
    
    // MARK: - Helper Functions
    
    // Load the app's data from User Defaults
    private func preparations() {
        user = UserDefaultsManager.shared.loadUser()
        appSettings = UserDefaultsManager.shared.loadAppSettings()
    }
    
    
    private func handleDataCreation(newUser: User, newAppSettings: AppSettings) {
        user = newUser
        appSettings = newAppSettings
        UserDefaultsManager.shared.saveUser(newUser)
        UserDefaultsManager.shared.saveAppSettings(newAppSettings)
        navigationToHome = true
    }
    
    // Don't go Home until we got an user
    private func handleGreetingCompletion() {
        navigationToHome = (user != nil)
    }
}

#Preview {
    ContentView()
}
