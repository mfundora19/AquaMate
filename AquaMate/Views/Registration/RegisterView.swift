//
//  RegisterView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegistererViewModel()
    
    var body: some View {
        ZStack {
            Color(.bg2)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text(viewModel.getIdealWaterIntake)
                        .font(.system(size: 55, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                    Text("Calculate your goal")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }.padding(.bottom, 50)
                
                
                VStack (spacing: 10){
                    GroupOfButtons(viewModel: viewModel)
                }.padding(.bottom, 20)
                
                Button {
                    viewModel.showCustomGoal = true
                } label: {
                    Text("Custom Goal")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundStyle(.base)
                }
                .sheet(isPresented: $viewModel.showCustomGoal) {
                    RegisterCustomGoalView(showCustomGoal: $viewModel.showCustomGoal,
                                           customGoal: $viewModel.waterGoal)
                    .presentationDetents([.fraction(1/4)])
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}

// MARK: - Group of Buttons

struct GroupOfButtons: View {
    @ObservedObject var viewModel: RegistererViewModel
    
    var body: some View {
        // Name Button
        InputButton(text: viewModel.inputName.isEmpty ? "Name" : viewModel.inputName,
                    icon: ButtonIcons.Name.rawValue,
                    action: viewModel.onNameButtonPressed)
        .sheet(isPresented: $viewModel.showTextField) {
            RegisterNameView(name: $viewModel.inputName,
                             nameDone: $viewModel.showTextField)
            .presentationDetents([.fraction(1/4)])
            .onSubmit {
                viewModel.showTextField = false
            }
            
            
        }
        
        // Weight Button
        InputButton(text: viewModel.selectedWeight == 0 ? "Weight" : "\(viewModel.selectedWeight) lb",
                    icon: ButtonIcons.Weight.rawValue,
                    action: viewModel.onWeightButtonPressed)
        .sheet(isPresented: $viewModel.showWeightPicker) {
            RegisterWeightView(weight: $viewModel.selectedWeight,
                               showWeightPicker: $viewModel.showWeightPicker)
            .presentationDetents([.fraction(3/8)])
        }
        
        // Activity Button
        InputButton(text: viewModel.minExercised == 0 ? "Activity" : "\(Int(viewModel.minExercised)) min",
                    icon: ButtonIcons.Fitness.rawValue,
                    action: viewModel.onActivityButtonPressed)
            .sheet(isPresented: $viewModel.showActivityRange) {
                RegisterActivityView(minExercised: $viewModel.minExercised,
                                     showActivityRange: $viewModel.showActivityRange)
                .presentationDetents([.fraction(1/4)])
            }
    }
}
