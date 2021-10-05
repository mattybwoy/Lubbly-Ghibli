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
    @IBOutlet var searchField: UITextField!
    
    var dataManager: DataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.alpha = 0.5
        background.contentMode = .scaleToFill
        setupView()
        searchField.delegate = self
    }

    private func setupView() {
        mainHeading.text = "LUBLI GHIBLI"
        mainHeading.font = UIFont(name: "ITC Avant Garde Gothic", size: 40.0)
        mainHeading.sizeToFit()
        mainHeading.textAlignment = .center
        mainHeading.alpha = 0.8
    }

}

extension ViewController: UITextFieldDelegate {
    
    @IBAction func searchFieldPressed(_ sender: UITextField) {
        searchField.endEditing(true)
        print(searchField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        print(searchField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let userText = searchField.text {
            dataManager = DataManager(userSearchTerm: userText)
            dataManager?.getFilms{ films in
                //let filteredFilms = films.filter( {$0.title.contains("castle") } )
                //print(filteredFilms)
                for film in films {
                    print(film.original_title)
                    //below line doesn't work
                    if film.title.contains(userText) {
                        print(film.title)
                        //print("[\(film.id)] Film: \(film.title)")
                    }
                }
            }
        }
        searchField.text = ""
    }
}
