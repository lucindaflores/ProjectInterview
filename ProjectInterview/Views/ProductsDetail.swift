//
//  ProductsDetail.swift
//  projectInterview
//
//  Created by Lucinda Flores on 29/08/2023.
//

import SwiftUI

struct ProductsDetail: View {
    
    @Environment(\.dismiss) var dismiss
    
    var product: Products
    var discountedPrice: Double {
        Double(product.price) - ((product.discountPercentage * Double(product.price)) / 100)
    }
    
    @State var images: [Image]? = nil
    @State var isImageSliderShown = false
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ImageSliderView(images: product.images, isImageSliderShown: $isImageSliderShown)
                        .frame(height: 300)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(product.category)
                                .font(.callout)
                                .foregroundColor(.secondary)
                            
                            Text(product.title)
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("€ \(product.price)")
                                .fontWeight(.bold)
                            Text("-\(product.discountPercentage, specifier: "%.2f")%")
                                .font(.callout)
                        }
                    }
                    .padding([.leading, .trailing], 20.0)
                    .padding(.bottom, 20.0)
                      
                    VStack(spacing: 10.0) {
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        Text(product.description)
                    }
                    .padding([.leading, .trailing], 20.0)
                    .padding(.bottom, 20.0)
                    
                    
                    VStack(spacing: 10.0) {
                        Text("More Details")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        HStack(spacing: 15.0) {
                            VStack(alignment: .leading, spacing: 5.0) {
                                Text("Rating")
                                Text("Brand")
                                Text("Stock")
                                Text("Final price")
                            }
                            .fontWeight(.medium)
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 5.0) {
                                Text("\(product.rating, specifier: "%.1f")")
                                Text(product.brand)
                                Text("\(product.stock) units")
                                Text("€ \(discountedPrice, specifier: "%.2f")")
                                    .fontWeight(.medium)
                            }
                        }
                    }
                    .padding([.leading, .trailing], 20.0)
                } //-- SCROLLVIEW
                .padding(.top, -8)
                
                Spacer ()
                
                Button {
                    dismiss()
                } label: {
                    Text("Go Back")
                }
                .frame(width: 260, height: 50)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Capsule())
                .padding([.top, .bottom], 10.0)
            } //-- VSTACK
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isImageSliderShown = true
                    } label: {
                        Label("", systemImage: "arrow.up.right.square")
                    }
                }
            }
            .sheet(isPresented: $isImageSliderShown) {
                ImageSliderView(images: product.images, isImageSliderShown: $isImageSliderShown)
            }
        } //-- ZSTACK
    }
    
    
}


struct ProductsDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductsDetail(product: MockData.product1)
    }
}
