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
    var userSearchTerm: String?
    
    init(userSearchTerm: String?) {
        self.userSearchTerm = userSearchTerm
    }
    
    func getFilms(completion: @escaping ( [Film]) -> Void) {
        
        guard let fileURL = Bundle.main.url(forResource: "films", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: fileURL)
            self.films = try JSONDecoder().decode([Film].self, from: data)
            completion(self.films)
        } catch {
            print(error)
        }
    }
    
    func parseFilmData(_ data: Data) -> [Film] {
        let decoder = JSONDecoder()
        do {
            let films = try decoder.decode([Film].self, from: data)
            return films
        } catch {
            print(error)
            return []
        }
    }
}
