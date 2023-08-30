//
//  XDismissButton.swift
//  projectInterview
//
//  Created by Lucinda Flores on 29/08/2023.
//

import SwiftUI

struct XDismissButton: View {
    @Binding var isImageSliderShown: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(isImageSliderShown ? .secondary : .clear)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(isImageSliderShown ? .black : .clear)
        }
        .disabled(isImageSliderShown ? false : true)
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton(isImageSliderShown: .constant(false))
    }
}
