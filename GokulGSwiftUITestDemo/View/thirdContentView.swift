//
//  thirdContentView.swift
//  GokulGSwiftUITestDemo
//
//  Created by Gokul Gopalakrishnan on 25/02/24.
//

import SwiftUI

struct thirdContentView: View {
    
    var imageURL: String = demoConstants.showNilConstant
    var imageTitle: String = demoConstants.showNilConstant
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageURL)).frame(width: 300, height: 300, alignment: .center).cornerRadius(10)
            Divider()
            Text(imageTitle).multilineTextAlignment(.center)
        }
    }
}

struct thirdContentView_Previews: PreviewProvider {
    static var previews: some View {
        thirdContentView()
    }
}
