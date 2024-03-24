//
//  demoModel.swift
//  GokulGSwiftUITestDemo
//
//  Created by Gokul Gopalakrishnan on 24/02/24.
//

import Foundation

struct photoData: Hashable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
