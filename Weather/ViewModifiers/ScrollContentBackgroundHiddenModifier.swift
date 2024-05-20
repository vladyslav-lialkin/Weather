//
//  ScrollContentBackgroundHiddenModifier.swift
//  Weather
//
//  Created by Влад Лялькін on 28.04.2024.
//

import SwiftUI

struct ScrollContentBackgroundHiddenModifier: ViewModifier {
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
        } else {
            content
                .onAppear {
                    UIScrollView.appearance().backgroundColor = UIColor(.clear)
                }
        }
    }
}
