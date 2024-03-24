//
//  contentViewModel.swift
//  GokulGSwiftUITestDemo
//
//  Created by Gokul Gopalakrishnan on 25/02/24.
//

import Foundation

class contentViewModel {
   
    // Login authentication based on User name and Pass word
    func loginAuthenticationCheck(nameField: String, passField: String) -> (Bool, Bool) {
        if nameField == "123" && passField == "abc" {
            return (false, true)
        } else {
            return (true, false)
        }
    }
}
