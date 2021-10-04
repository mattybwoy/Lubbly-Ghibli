//
//  DataManager.swift
//  Lubli Ghibli
//
//  Created by Matthew Lock on 01/10/2021.
//

import Foundation

class DataManager {
    
    let baseURL = "https://ghibliapi.herokuapp.com/films"
    var films = [Film]()
    
    func getFilms(completion: @escaping ( [Film]) -> Void) {
        
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error ) in
                if error != nil {
                    return
                }
                if let data = data {
                    self.films = self.parseFilmData(data)
                }
                completion(self.films)
            }
            task.resume()
        }
    }
    
    func parseFilmData(_ data: Data) -> [Film] {
        let decoder = JSONDecoder()
        do {
            let films = try decoder.decode([Film].self, from: data)
            films.forEach{ film in
                print(film.id)
            }
            return films
        } catch {
            print(error)
            return []
        }
    }
}
