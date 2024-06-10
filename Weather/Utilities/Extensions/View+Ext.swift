//
//  View+Ext.swift
//  Weather
//
//  Created by Влад Лялькін on 09.06.2024.
//

import Foundation
import SwiftUI

extension View {
    @inlinable
    public func reverseMask<Mask: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ mask: () -> Mask
    ) -> some View {
        self.mask {
            Rectangle()
                .overlay(alignment: alignment) {
                    mask()
                        .blendMode(.destinationOut)
                }
        }
    }
}
