//
//  UserCard.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/4/24.
//

import SwiftUI

struct UserCardView: View {
    let user: User?
    @Binding var finishGreetingUser: Bool
    @Binding var notificationAcceptance: Bool
    
    var body: some View {
        ZStack {
            Color(.bg3)
                .ignoresSafeArea()
            Rectangle()
                .fill(.white)
                .frame(width: 220, height: 300)
                .clipShape(.rect(cornerRadius: 20))
                .shadow(color: Color(.card), radius: 20)
            
                .overlay {
                    VStack (spacing: 20){
                        Circle()
                            .fill(Color(white: 0.9))
                            .overlay {
                                Circle()
                                    .stroke(Color(.base), lineWidth: 4)
                                    .shadow(radius: 4)
                                Image(systemName: user?.name != nil ? "drop.fill" : "person.fill")
                                    .resizable()
                                    .foregroundStyle(.blue.gradient)
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                                    .padding()
                                
                            }
                            .padding(25)
                        
                        Button {
                            finishGreetingUser.toggle()
                            if user == nil {
                                NotificationManager.shared.requestAuthorization { auth in
                                    notificationAcceptance = auth
                                }
                            }
                        } label: {
                            Text(user?.name ?? "GET STARTED")
                                .font(.title2)
                                .padding()
                                .fontWeight(.semibold)
                                .background(.white)
                                .foregroundStyle(.card)
                                .clipShape(.rect(cornerRadius: 20))
                                .shadow(color: .card, radius: 4, y: 2)
                            
                        }
                        .padding(.bottom)
                        
                    }
                }
        }
    }
}

#Preview {
    UserCardView(user: nil, finishGreetingUser: .constant(false), notificationAcceptance: .constant(false))
}
