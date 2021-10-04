//
//  ViewController.swift
//  Lubli Ghibli
//
//  Created by Matthew Lock on 29/09/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var background: UIImageView!
    @IBOutlet var mainHeading: UILabel!
    @IBOutlet var categoryPicker: UIPickerView!
    
    var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.alpha = 0.5
        background.contentMode = .scaleToFill
        setupView()

        dataManager.getFilms { films in
            //let filteredFilms = films.filter( {$0.title.contains("Castle") } )
            for film in films {
                if film.title.contains("Neighbor"){
                    print("[\(film.id)] Film: \(film.title)")
                }
            }
        }

    }

    private func setupView() {
        mainHeading.text = "LUBLI GHIBLI"
        mainHeading.font = UIFont(name: "ITC Avant Garde Gothic", size: 40.0)
        mainHeading.sizeToFit()
        mainHeading.textAlignment = .center
        mainHeading.alpha = 0.8
    }
    
    
}
