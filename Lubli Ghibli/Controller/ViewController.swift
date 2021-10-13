//
//  ViewController.swift
//  Lubli Ghibli
//
//  Created by Matthew Lock on 29/09/2021.
//

import UIKit
import Nuke

class ViewController: UIViewController, UISearchResultsUpdating {
    
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
        layout.itemSize = CGSize(width: 300, height: 300)
        collectionView.collectionViewLayout = layout
        searchController.searchResultsUpdater = self
        setupBackground()
        title = "LUBLI GHIBLI"
        searchController.searchBar.searchTextField.font = UIFont(name: fontName, size: 15)
        searchController.searchBar.sizeToFit()
        guard let font = UIFont(name: fontName, size: 28) else { return }
        searchController.searchBar.searchTextField.backgroundColor = .lightGray
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
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
}
