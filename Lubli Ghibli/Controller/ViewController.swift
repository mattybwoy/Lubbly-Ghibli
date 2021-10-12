//
//  ViewController.swift
//  Lubli Ghibli
//
//  Created by Matthew Lock on 29/09/2021.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UICollectionViewDataSource {

    @IBOutlet var background: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var dataManager: DataManager?
    
    let fontName = "AvantGarde-Medium"
    var films = [Film]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.backgroundView = background
        background.alpha = 0.5
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
        title = "LUBLI GHIBLI"
        searchController.searchBar.searchTextField.font = UIFont(name: fontName, size: 15)
        searchController.searchBar.sizeToFit()
        guard let font = UIFont(name: fontName, size: 25) else { return }
        searchController.searchBar.searchTextField.backgroundColor = .lightGray
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .darkGray
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.darkGray, .font: font]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        searchController.searchResultsUpdater = self

        navigationItem.searchController = searchController
        searchController.becomeFirstResponder()
        collectionView.register(UINib(nibName: "FilmCellCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "filmCell")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        dataManager = DataManager(userSearchTerm: text)
        dataManager?.getFilms{ films in
            self.films = films.filter({ film in
                film.title.contains(text)
            })
            self.collectionView.reloadData()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as! FilmCellCollectionViewCell
        collectionCell.image.image = UIImage(data: try! Data(contentsOf: URL(string: films[indexPath.row].image)!))
        collectionCell.filmTitle.text = films[indexPath.row].title
        collectionCell.filmYear.text = films[indexPath.row].release_date
        return collectionCell
    }
}
