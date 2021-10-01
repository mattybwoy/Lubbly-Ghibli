//
//  DataManager.swift
//  Lubli Ghibli
//
//  Created by Matthew Lock on 01/10/2021.
//

import Foundation

struct DataManager {
    
    let baseURL = "https://ghibliapi.herokuapp.com/films/2baf70d1-42bb-4437-b551-e5fed5a87abe"
    
    func getFilms() {
        
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error ) in
                if error != nil {
                    return
                }
                if let safeData = data {
                    if let movie = self.parseJSON(safeData) {
                        print(movie)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> String? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FilmData.self, from: data)
            let film = decodedData.title
            print(film)
            return film
        } catch {
            print(error)
            return nil
        }
    }
}
