//
//  PersonalizedTextFieldView.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/5/24.
//

import SwiftUI

struct PersonalizedTextFieldView: View {
    var placeholderText: String
    @Binding var name: String
    
    let animation: Animation = .spring(response: 0.5, dampingFraction: 0.6)
    @State private var placeholderOffset:CGFloat
    @State private var scaleEffectValue: CGFloat
    
    private var onTextAction: ((_ oldValue: String, _ newValue: String) -> ())?
    
    init(name: Binding<String>,
         placeholderText: String,
         placeholderOffset: CGFloat = 0,
         scaleEffectValue: CGFloat = 1,
         onTextAction: ((_: String, _: String) -> Void)? = nil) {
        
        self._name = name
        self.placeholderOffset = placeholderOffset
        self.placeholderText = placeholderText
        self.scaleEffectValue = scaleEffectValue
        self.onTextAction = onTextAction
    }
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            Text(placeholderText)
                .foregroundStyle($name.wrappedValue.isEmpty ? Color(.base) : .gray)
                .font($name.wrappedValue.isEmpty ? .headline : .caption)
                .offset(y: placeholderOffset)
                .scaleEffect(scaleEffectValue, anchor: .leading)
            
            TextField("", text: $name)
                .font(.headline)
                .foregroundStyle(.base)
                .autocorrectionDisabled()
        }
        .padding()
        .padding(.vertical, 5)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.card, lineWidth: 2)
        }
        .frame(width: 350)
        .onChange(of: name) { oldValue, newValue in
            // Change the Placeholder location
            withAnimation (animation){
                movePlaceholder()
            }
            
            onTextAction?(oldValue, newValue)
        }
        .onAppear {
            if !$name.wrappedValue.isEmpty {
                movePlaceholder()
            }
        }
    }
    
    // Helper Method
    fileprivate func movePlaceholder() {
        placeholderOffset = $name.wrappedValue.isEmpty ? 0 : -30
        scaleEffectValue = $name.wrappedValue.isEmpty ? 1 : 0.85
    }
}

#Preview {
    PersonalizedTextFieldView(name: .constant(""), placeholderText: "Enter Name")
}



extension PersonalizedTextFieldView {
    public func onTextChange(_ onTextAction: @escaping ((_ oldValue: String, _ newValue: String) -> ())) -> Self {
        
        var view = self
        view.onTextAction = onTextAction
        
        return view
    }
}
