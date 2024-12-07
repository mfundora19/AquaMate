//
//  Home.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    init(user: User) {
        viewModel = HomeViewModel(user: user)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer().frame(height: 50)
                    
                    VStack {
                        Text(viewModel.getOunces)
                            .font(.system(size: 40, weight: .semibold, design: .rounded))
                            .foregroundStyle(.base)
                        
                        Text(viewModel.getGoalPercentage)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    HomeWaterDropView(progress: viewModel.progress,
                                      dailyGoalCompleted: viewModel.user.dailyGoalCompleted)
                    Spacer()
                    
                    Button {
                        withAnimation {
                            viewModel.showWaterInput.toggle()
                        }
                    } label: {
                        Image(systemName: K.ButtonIcons.Bottle.rawValue)
                            .font(.system(size: 55))
                            .padding(25)
                            .foregroundStyle(.base)
                            .background(Color(.bg3), in: Circle())
                            .shadow(radius: 1)
                        
                    }
                }
                .padding()
                .background(.bg)
                
                // Display the water input
                if viewModel.showWaterInput {
                    HomeWaterInputView(showView: $viewModel.showWaterInput,
                                       ouncesDrunk: $viewModel.ouncesDrunk)
                    .transition(.opacity)
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: K.ButtonIcons.Settings.rawValue)
                            .font(.title)
                            .foregroundStyle(.card)
                            .padding()
                            .opacity(viewModel.showWaterInput ? 0 : 1)
                            .disabled(viewModel.showWaterInput)
                    }
                }
            }
        }
    }
}



#Preview {
    NavigationStack {
        HomeView(user: User(name: "Ana", goalWaterIntake: 64))
    }
}

