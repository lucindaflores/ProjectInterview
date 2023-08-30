//
//  ContentView.swift
//  projectInterview
//
//  Created by Lucinda Flores on 29/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var products: [Products] = []
    @State var product: Products?
    @State var alertItem: AlertItem?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(products) { product in
                    NavigationLink {
                        ProductsDetail(product: product)
                    } label: {
                        AsyncImage(url: URL(string: product.thumbnail)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50.0, height: 50.0)
                        
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .fontWeight(.semibold)
                            
                            HStack {
                                Text("Price:")
                                Text("€ \(product.price)")
                            }
                        }
                    }
                    
                }
                
            } // -- LISTVIEW
            .navigationTitle("Products")
            
        } // -- NAVVIEW
        .task {
            getProducts()
        }
        //.onAppear(perform: getProducts)
        .alert(item: $alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)}
    }
    
    
    func getProducts() {
        Task {
            do {
                products = try await NetworkManager.shared.fetchProducts()
            } catch {
                if let productError = error as? ProductError {
                    switch productError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    }
                } else {
                    alertItem = AlertContext.genericAlert
                }
            }
        }
    }
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
