//
//  CustomColoredSlider.swift
//  AquaMate
//
//  Created by Marcos Fundora on 12/6/24.
//

import SwiftUI

struct CustomColoredSlider: View {
    let width: CGFloat
    let height: CGFloat
    let axis: Axis = .vertical // Horizontal or Vertical Slider
    
    @State var dragging: CGFloat = 0
    @Binding var theValue: Double
    @State var startDragging: CGFloat = 0
    
    var maxDragDistance: CGFloat{
        axis == .horizontal ? width - height : height - width
    }
    
    var gradientColors: [Color] {
        let progress = axis == .horizontal ? min(max(dragging / maxDragDistance , 0), 1) : min(max(-dragging / maxDragDistance, 0), 1)
        let topColor = Color(red: progress, green: 1.0, blue: 1.0 - progress)
        let bottomColor = Color(red: progress, green: progress * 0.4, blue: 1.0 - progress)
        
        return [bottomColor, topColor]
    }
    
    var body: some View {
        ZStack { // Slider
            Capsule()
                .frame(width: width, height: height)
                .frame(maxWidth: .infinity, maxHeight: .infinity,
                       alignment: axis == .horizontal ? .leading : .bottom)
                .foregroundStyle(.thinMaterial)
            Capsule()
                .frame(width: axis == .horizontal ? max(0, dragging + height) : width,
                       height: axis == .vertical ? max(0, -dragging + width) : height)
                .frame(maxWidth: .infinity, maxHeight: .infinity,
                       alignment: axis == .horizontal ? .leading : .bottom)
                .foregroundStyle(LinearGradient(
                    colors: gradientColors,
                    startPoint: axis == .horizontal ? .leading : .bottom,
                    endPoint: axis == .horizontal ? .trailing : .top
                ))
        }
        .frame(width: width, height: height)
        .overlay(alignment: axis == .horizontal ? .leading : .bottom) { // Draggable Ball
            Circle()
                .frame(width: axis == .horizontal ? height : width,
                       height: axis == .vertical ? width : height)
                .foregroundStyle(Color.darkLabel)
                .offset(x:axis == .horizontal ? dragging : 0,
                        y:axis == .vertical ? dragging : 0)
                .gesture(
                    DragGesture()
                        .onChanged {gesture in
                            updateDragging(gesture: gesture)
                            theValue = axis == .horizontal ? Double(dragging / maxDragDistance) : Double(-dragging / maxDragDistance)

                        }
                        .onEnded { _ in
                            startDragging = dragging
                        }
                )
        }
    }
    
    // MARK: - Helper Methods
    
    func updateDragging(gesture: DragGesture.Value) {
        if axis == .horizontal {
            let newValue = startDragging + gesture.translation.width
            dragging = newValue <= 0 ? 0 : min(newValue, maxDragDistance)
        } else {
            let newValue = startDragging + gesture.translation.height
            dragging = newValue >= 0 ? 0 : max(newValue, -maxDragDistance)
        }
    }
    

}

#Preview {
    CustomColoredSlider(width: 50, height: 380, theValue: .constant(0))
}
