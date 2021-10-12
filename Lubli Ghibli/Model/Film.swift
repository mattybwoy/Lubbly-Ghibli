//
//  FilmData.swift
//  Lubli Ghibli
//
//  Created by Matthew Lock on 01/10/2021.
//

import Foundation

struct Film: Decodable {
    let id: String
    let title: String
    let release_date: String
    let image: String
}
