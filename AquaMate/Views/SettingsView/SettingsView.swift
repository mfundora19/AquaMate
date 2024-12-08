//
//  SettingsView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/7/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var user: User
    @State var showCustomGoalView: Bool = false
    @State var showReminderView: Bool = false
    
    var body: some View {
        ZStack {
            Color.bg3.ignoresSafeArea()
            
            VStack (spacing: 25){
                NavigationLink {
                    SettingsReminderView(user: $user)
                } label: {
                    CustomButtonLabel2(title: "Reminders",
                                       subtitle: nil,
                                       description: "Healthy notifications when you forget to drink water",
                                       color: .card2,
                                       foregroundColor: .base)
                    .overlay {
                        Text(user.notificationOn ? "On" : "Off")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(Color.gray)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                            .offset(y: -50)
                    }
                }
                Button {
                    withAnimation {
                        showCustomGoalView.toggle()
                    }
                } label: {
                    CustomButtonLabel2(title: "\(user.goalWaterIntake) oz",
                                    subtitle: "Custom goal",
                                    description: "Set a new personal Goal !!!",
                                    color: .base,
                                    foregroundColor: .white)
                }
                .sheet(isPresented: $showCustomGoalView) {
                    RegisterCustomGoalView(showCustomGoal: $showCustomGoalView,
                                           customGoal: $user.goalWaterIntake)
                    .presentationDetents([.fraction(1/4)])
                }
                
                Spacer()
                
            }.padding()
            
            
            
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Image(systemName: K.ButtonIcons.BackButton.rawValue)
                        .font(.title)
                        .foregroundStyle(.base)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView(user: .constant(.init(name: "Juan", goalWaterIntake: 10, notifyAllowed: true)),
                     showCustomGoalView: false)
    }
}
