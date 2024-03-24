//
//  demoViewModel.swift
//  GokulGSwiftUITestDemo
//
//  Created by Gokul Gopalakrishnan on 24/02/24.
//

import Foundation


class demoViewModel: ObservableObject {
    
    @Published var photoDatas: [photoData] = []
    
    func fetch() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            return
        }
        
        // to call the JSON response from the Above URL
        let task = try await URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Parsing the response data into the photoData structure
            do {
                let photoDatas = try JSONDecoder().decode([photoData].self, from: data)
                DispatchQueue.main.async {
                    self.photoDatas = photoDatas
                }
             }
            catch {
                // in case of any error just printing the errored data
                print(error)
            }

        }
        // to invoke the API call
      task.resume()
    }
}

