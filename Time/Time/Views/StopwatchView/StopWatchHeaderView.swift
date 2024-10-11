//
//  StopWatchHeaderView.swift
//  Time
//
//  Created by Даниил  on 22.10.2024.
//

import SwiftUI

struct StopWatchHeaderView: View {
    @State private var isPlaying = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("StopWatchTitle")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color.black)
                Text("CreateNewStopwatch")
                    .foregroundColor(Color.gray)
                    .underline()
            }

            Spacer()

            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isPlaying.toggle()
                }
            }) {
                ZStack {
                    PlayIcon()
                        .opacity(isPlaying ? 0 : 1)
                        .transition(.opacity)
                    PauseIcon()
                        .opacity(isPlaying ? 1 : 0)
                        .transition(.opacity)
                }
                .frame(width: 50, height: 50)
                .background(Color.red.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
    }
    
    
}

struct PlayIcon: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                path.move(to: CGPoint(x: width * 0.3, y: height * 0.2))
                path.addLine(to: CGPoint(x: width * 0.7, y: height * 0.5))
                path.addLine(to: CGPoint(x: width * 0.3, y: height * 0.8))
                path.closeSubpath()
            }
            .fill(Color.red)
        }
    }
}

struct PauseIcon: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let barWidth = width * 0.2
                path.addRect(CGRect(x: width * 0.35, y: height * 0.2, width: barWidth, height: height * 0.6))
                path.addRect(CGRect(x: width * 0.45 + barWidth, y: height * 0.2, width: barWidth, height: height * 0.6))
            }
            .fill(Color.red)
        }
    }
}

struct StopWatchHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchHeaderView()
    }
}

