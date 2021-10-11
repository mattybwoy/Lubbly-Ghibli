//
//  ViewController.swift
//  Lubli Ghibli
//
//  Created by Matthew Lock on 29/09/2021.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {

    @IBOutlet var background: UIImageView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var dataManager: DataManager?
    
    let font = "ITC Avant Garde Gothic"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.alpha = 0.5
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
        title = "LUBLI GHIBLI"
        searchController.searchBar.sizeToFit()
        searchController.searchResultsUpdater = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.becomeFirstResponder()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        dataManager = DataManager(userSearchTerm: text)
        dataManager?.getFilms{ films in
            for film in films {
                if film.title.contains(text) {
                    print(film.title)
                }
            }
        }
        
    }
}
