//
//  ProductListView.swift
//  ProductDemo
//
//  Created by test on 11/19/24.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var productModel = ProductViewModel()
    
    var body: some View {
//    Note: See the below navigation also
        
        
        NavigationSplitView{
            VStack{
                List(productModel.products ?? [] , id: \.id) { product in
                    NavigationLink {
                        ProductDetailsView()
                    } label: {
                        ProductItemView(product: product)
                    }

                    
                    
                }
                .listStyle(.plain)
            }.task {
                do{
                    try await productModel.products = productModel.getProducts(url: "https://fakestoreapi.com/products")
                }catch{
                    print("Error \(error)")
                }
            }
            .navigationTitle("Products")
        } detail: {
            Text("Select a product")
        }
        
        // old way
//        NavigationStack{
//            List(productModel.products ?? [], id: \.id){ product in
//                NavigationLink(product.title) { // (key, content)
//                    ProductItemView(product: product)
//                }
//            }
//            .navigationTitle("Products")
//            .task {
//                do{
//                    try await productModel.products = productModel.getProducts(url: "https://fakestoreapi.com/products")
//                }catch{
//                    print("Error \(error)")
//                }
//            }
//        }
        
        //new way
//        NavigationStack{
//            List(productModel.products ?? [], id: \.id){ product in
//                NavigationLink(product.title, value: product) //(key, value)
//            }
//            .navigationTitle("Products")
//            .navigationDestination(for: Product.self, destination: { product in
//                ProductItemView(product: product)
//            })
//            .task {
//                do{
//                    try await productModel.products = productModel.getProducts(url: "https://fakestoreapi.com/products")
//                }catch{
//                    print("Error \(error)")
//                }
//            }
//        }
    }
}

#Preview {
    ProductListView()
}
