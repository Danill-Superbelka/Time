//
//  TestView.swift
//  Time
//
//  Created by Даниил  on 15.11.2024.
//

import SwiftUI


import SwiftUI

struct SomeView: View {
    var body: some View {
        VStack {
            
            Rectangle()
                .fill(.blue)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .convex(position: .bottom, height: 25)
        }
    }
}

// End of file. No additional code.



struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        SomeView()
    }
}


struct GradientBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(content: {
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.purple.opacity(0.3)]),
                               startPoint: .bottom,
                               endPoint: .topTrailing)
                .ignoresSafeArea()
                .blur(radius: 30)
            })
    }
}

extension View {
    func gradientBackground() -> some View {
        self.modifier(GradientBackgroundModifier())
    }
}


struct ConvexModifier: ViewModifier {
    enum ConvexPosition {
        case top, bottom
    }
    
    let position: ConvexPosition
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .clipShape(ConvexShape(position: position, height: height))
    }
}

// Your imports remain the same

// Other structs and extensions remain the same

struct ConvexShape: Shape {
    let position: ConvexModifier.ConvexPosition
    let height: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            let midX = width / 2
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: width, y: 0))
            
            switch position {
            case .top:
                path.move(to: CGPoint(x: 0, y: 0))
                path.addCurve(to: CGPoint(x: midX, y: -self.height),
                              control1: CGPoint(x: midX / 4, y: 0),
                              control2: CGPoint(x: midX - midX / 4, y: -self.height))
                path.addCurve(to: CGPoint(x: width, y: 0),
                              control1: CGPoint(x: midX + midX / 4, y: -self.height),
                              control2: CGPoint(x: width - midX / 4, y: 0))
            case .bottom:
                path.move(to: CGPoint(x: 0, y: height))
                path.addCurve(to: CGPoint(x: midX, y: height + self.height),
                              control1: CGPoint(x: midX / 4, y: height),
                              control2: CGPoint(x: midX - midX / 4, y: height + self.height))
                path.addCurve(to: CGPoint(x: width, y: height),
                              control1: CGPoint(x: midX + midX / 4, y: height + self.height),
                              control2: CGPoint(x: width - midX / 4, y: height))
            }
        }
    }
}

// The rest of your code remains the same

// End of file. No additional code.

extension View {
    func convex(position: ConvexModifier.ConvexPosition, height: CGFloat) -> some View {
        self.modifier(ConvexModifier(position: position, height: height))
    }
}

// End of file. No additional code.
