//
//  UserCard.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/4/24.
//

import SwiftUI

struct UserCard: View {
    let name: String?
    @Binding var finishGreetingUser: Bool
    
    var body: some View {
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
                                .stroke(Color(.cardLighter), lineWidth: 4)
                                .shadow(radius: 4)
                            Image(systemName: name != nil ? "drop.fill" : "person.fill")
                                .resizable()
                                .foregroundStyle(.blue.gradient)
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                                .padding()
                            
                        }
                        .padding(25)
                    
                    Button {
                        finishGreetingUser.toggle()
                    } label: {
                        Text(name ?? "New User")
                            .font(.title2)
                            .padding()
                            .fontWeight(.semibold)
                            .background()
                            .foregroundColor(.card)
                            .clipShape(.rect(cornerRadius: 20))
                            .shadow(color: .card, radius: 4, y: 2)
                        
                    }
                    .padding(.bottom)
                    
                }
            }
    }
}

#Preview {
    UserCard(name: "Carlos", finishGreetingUser: .constant(false))
}
