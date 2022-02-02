//
//  OffsetKey.swift
//  BookdProject
//
//  Created by Øystein Thorheim on 02/02/2022.
//

import Foundation
import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
