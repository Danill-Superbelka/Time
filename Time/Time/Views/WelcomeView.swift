//
//  WelcomeView.swift
//  Time
//
//  Created by Даниил  on 14.10.2024.
//

import SwiftUI

struct WelcomeView: View {
    var greetingText: String
    var userName: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(greetingText),")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.black)
                Text(userName)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .strokeBorder(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.pink]),
                                       startPoint: .topLeading, endPoint: .bottomTrailing),
                        lineWidth: 4
                    )
                    .frame(width: 70, height: 70)
                Image(.avatarMock)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
        }
        .padding()
    }
}

#Preview {
    WelcomeView(greetingText: "Добрый день", userName: "Даниил")
}
