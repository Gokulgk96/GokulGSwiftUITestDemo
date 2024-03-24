//
//  contentView.swift
//  GokulGSwiftUITestDemo
//
//  Created by Gokul Gopalakrishnan on 24/02/24.
//

import SwiftUI


// Main Content
struct contentView: View {
    
    // name and password field to Recognize the user
    @State private var name: String = demoConstants.showNilConstant
    @State private var pass: String = demoConstants.showNilConstant
    
    // for showing the alert page if the password or user is returning wrong value
    @State private var showingAlert = demoConstants.showAlertConstant
    
    // enabling the navigation to the next page kill switch
    @State private var showPage = demoConstants.showPageConstant
    
    private var viewModel = contentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    
                    // label
                    Text("Login Testing").font(.largeTitle).foregroundColor(.brown)
                }.padding([.bottom], 50).underline(color: .red)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // username field
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Username:").font(.system(size: 20))
                        TextField("Name Please", text: $name).font(.system(size:30)).keyboardType(.numberPad)
                    }
                    
                    Divider()
                    
                    // password field
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Passowrd:").font(.system(size: 20))
                        SecureField("Secret Text Please", text: $pass).font(.system(size:30))
                    }
                    
                }.padding()
                
                // login button
                VStack {
                    Button("Login") {
                        
                        (showingAlert, self.showPage) = viewModel.loginAuthenticationCheck(nameField: name, passField: pass)
                        
                        
                    }.font(.system(size: 15)).padding([.leading, .trailing], 20).padding([.top,.bottom],8).background(.green).clipShape(RoundedRectangle(cornerRadius: 50.0, style: .continuous)).foregroundColor(.black).alert("password or User dosen't match", isPresented: $showingAlert) {
                        Button("Retry", role: .cancel) {
                            name = ""
                            pass = ""
                        }
                    }
                }.padding([.top], 30)
            }.overlay(NavigationLink(destination: secondContentView(), isActive: $showPage) {}).onAppear { name = ""
                pass = "" }
        }
    }
}


struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        contentView()
    }
}
