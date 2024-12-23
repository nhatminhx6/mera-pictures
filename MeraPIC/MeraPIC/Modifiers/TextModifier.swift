//
//  TextModifier.swift
//  MeraPIC
//
//  Created by NhatMinh on 18/12/24.
//

import Foundation
import SwiftUI

struct PhotoHeaderStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8.0)
            .font(.bold(.custom("Helvetica", size: 11.0))())
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

struct H1TitleStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.bold(.custom("Helvetica", size: 16.0))())
            .multilineTextAlignment(TextAlignment.leading)
            .foregroundColor(.black)
    }
}

struct H2StyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.bold(.custom("Helvetica", size: 14.0))())
            .foregroundColor(.black)
    }
}

struct H3StyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.bold(.custom("Helvetica", size: 12.0))())
            .foregroundColor(.black)
    }
}

struct H4StyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.bold(.custom("Helvetica", size: 10.0))())
            .foregroundColor(.black)
    }
}



