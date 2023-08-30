//
//  ImageSliderView.swift
//  projectInterview
//
//  Created by Lucinda Flores on 29/08/2023.
//

import SwiftUI

struct ImageSliderView: View {
    
    @State var images: [String]
    @Binding var isImageSliderShown: Bool
    
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { url in
                AsyncImage(url: URL(string: url)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                   
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onAppear {
            setupAppearance()
        }
        .overlay(Button { isImageSliderShown = false }
                 label: { XDismissButton(isImageSliderShown: $isImageSliderShown)
                            .padding([.top, .trailing], 5.0)
        }, alignment: .topTrailing)
        
        
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView(images: MockData.product1.images, isImageSliderShown: .constant(false))
    }
}

