//
//  TabViewExtension.swift
//  Time
//
//  Created by Даниил  on 19.11.2024.
//

import SwiftUI

extension TabView {
    
    @ViewBuilder
    func tabSheet<SheetContent: View>(initialHeight: CGFloat = 100, sheetCornernRadius: CGFloat = 35, @ViewBuilder content: @escaping () -> SheetContent) -> some View {
        self
            .modifier(BottomSheetModifier(initialHeight: initialHeight, sheetCornerRadius: sheetCornernRadius, sheetView: content()))
    }
}

fileprivate struct BottomSheetModifier<SheetContent: View>: ViewModifier {
    
    var initialHeight: CGFloat
    var sheetCornerRadius: CGFloat
    var sheetView: SheetContent
    
    @State private var showContent: Bool = true
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $showContent, content: {
                sheetView
                    .presentationDetents([.medium])
                    .presentationCornerRadius(sheetCornerRadius)
                    .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                    .interactiveDismissDisabled()
            })
    }
}

