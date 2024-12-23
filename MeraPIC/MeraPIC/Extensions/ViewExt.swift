//
//  ViewExt.swift
//  MeraPIC
//
//  Created by NhatMinh on 18/12/24.
//

import Foundation
import SwiftUI

extension View {
    func photoHeaderStyle() -> some View {
        self.modifier(PhotoHeaderStyleModifier())
    }
    
    func h1TitleStyle() -> some View {
        self.modifier(H1TitleStyleModifier())
    }
    
    func shouldHide(_ flag: Bool) -> some View {
        self.modifier(ViewHideModifier(flag: flag))
    }
}
