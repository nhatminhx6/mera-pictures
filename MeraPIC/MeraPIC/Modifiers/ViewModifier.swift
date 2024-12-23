//
//  ViewModifier.swift
//  MeraPIC
//
//  Created by NhatMinh on 18/12/24.
//

import Foundation
import SwiftUI

struct ViewHideModifier: ViewModifier {
    let flag: Bool
    func body(content: Content) -> some View {
        Group {
            if flag {
                EmptyView()
            } else {
                content
            }
        }
    }
}
