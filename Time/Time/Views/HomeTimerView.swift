//
//  HomeTimerView.swift
//  Time
//
//  Created by Даниил  on 15.10.2024.
//

import SwiftUI

struct HomeTimerView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(Date().getDateWithFormat(.dayMonthShort))
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.blackApp)
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: .infinity, height: 100)
                    .foregroundColor(.grayApp)
                
                Text("00:00:00")
                    .font(.system(size: 30, weight: .medium))
                    .padding(.bottom)
            }
        }
        .padding()
    }
}

#Preview {
    HomeTimerView()
}
