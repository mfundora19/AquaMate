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
                    InputButton(text: "Name",
                                icon: ButtonIcons.Name.rawValue,
                                action: viewModel.onNameButtonPressed)
                    .sheet(isPresented: $viewModel.showTextField) {
                        TextField("Enter your name", text: $viewModel.inputName)
                            .padding()
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    InputButton(text: "Weight", icon: ButtonIcons.Weight.rawValue, action: {})
                    InputButton(text: "Activity", icon: ButtonIcons.Fitness.rawValue, action: {})
                }.padding(.bottom, 20)
                
                Button {
                    
                } label: {
                    Text("Custom Goal")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundStyle(.base)
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}

