//
//  secondContentView.swift
//  GokulGSwiftUITestDemo
//
//  Created by Gokul Gopalakrishnan on 24/02/24.
//

import Foundation
import SwiftUI

struct secondContentView: View {
    
    @State private var showPage = demoConstants.showPageConstant
    @StateObject var viewModel = demoViewModel()
    
    private let adaptiveColumn = [
            GridItem(.adaptive(minimum: 150))
        ]
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                    ForEach(viewModel.photoDatas, id: \.self) { item in
                        NavigationLink(destination: thirdContentView(imageURL: item.url, imageTitle: item.title)) {
                            AsyncImage(url: URL(string: item.thumbnailUrl)).frame(width: 150, height: 150, alignment: .center).cornerRadius(10)
                        }
                    }
                }
                
            } .padding().onAppear { Task { await viewModel.fetch() } }
        }
}

