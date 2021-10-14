//
//  ViewController.swift
//  Lubli Ghibli
//
//  Created by Matthew Lock on 29/09/2021.
//

import UIKit
import Nuke

class ViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet var background: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var dataManager: DataManager?
    
    let fontName = "AvantGarde-Medium"
    var films = [Film]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        
        searchController.searchResultsUpdater = self
        
        collectionView.delegate = self
        setupBackground()
        title = "LUBLI GHIBLI"
        searchController.searchBar.searchTextField.font = UIFont(name: fontName, size: 15)
        searchController.searchBar.sizeToFit()
        guard let font = UIFont(name: fontName, size: 28) else { return }
        searchController.searchBar.searchTextField.backgroundColor = .lightGray
        searchController.searchBar.delegate = self
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .darkGray
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.darkGray, .font: font]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.searchController = searchController
        searchController.becomeFirstResponder()
        collectionView.register(UINib(nibName: "FilmCellCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "filmCell")
        dataManager = DataManager(userSearchTerm: "")
        dataManager?.getFilms{ films in
            self.films = films
            self.collectionView.reloadData()
        }
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
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        guard let text = searchBar.text else {
//            return
//        }
//        print(text)
//        dataManager = DataManager(userSearchTerm: text)
//        dataManager?.getFilms{ films in
//            self.films = films.filter({ film in
//                film.title.contains(text)
//            })
//            self.collectionView.reloadData()
//        }
        searchController.loadView()
        print("clicked")
    }
    
    func setupBackground() {
        collectionView.backgroundView = background
        background.alpha = 0.5
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as! FilmCellCollectionViewCell
        Nuke.loadImage(with: URL(string: self.films[indexPath.row].image)!, into: collectionCell.image)
        collectionCell.filmTitle.text = self.films[indexPath.row].title
        collectionCell.filmYear.text = self.films[indexPath.row].release_date
        return collectionCell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}
