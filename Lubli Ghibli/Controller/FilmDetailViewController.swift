//
//  SearchResultsController.swift
//  Lubli Ghibli
//
//  Created by Matt Lock on 14/10/2021.
//

import UIKit
import Nuke
import SafariServices

class FilmDetailViewController: UIViewController {
    
    private let film: Film
    @IBOutlet var filmYear: UILabel!
    @IBOutlet var filmTitle: UILabel!
    @IBOutlet var filmDirector: UILabel!
    @IBOutlet var filmDescriptionLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    @IBOutlet var filmDescription: UITextView!
    @IBOutlet var runtime: UILabel!
    @IBOutlet var imdbLink: UIButton!
    @IBOutlet var blurredImageBackground: UIImageView!
    
    let fontName = "AvantGarde-Medium"
    
    init(film: Film) {
        self.film = film
        super.init(nibName: "FilmDetailViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .darkGray
        title = film.title
        Nuke.loadImage(with: URL(string: self.film.image)!, into: blurredImageBackground)
        filmTitle.text = film.title
        filmTitle.font = UIFont.boldSystemFont(ofSize: 20)
        filmYear.text = film.release_date
        filmDirector.text = film.director
        filmDescriptionLabel.text = "Description"
        filmDescription.text = film.description
        runtimeLabel.text = "Runtime"
        runtime.text = String(film.runtime)
        imdbLink.setTitle("Go to IMDB" , for: .normal)
        imdbLink.setTitleColor(.systemBlue, for: .normal)
        imdbLink.setTitleColor(UIColor.systemBlue.withAlphaComponent(0.9), for: .highlighted)
    }

    @IBAction func imdbButtonTapped(_ sender: UIButton) {
        if let url = URL(string: film.imdb_link) {
            let sfSafariVC = SFSafariViewController(url: url)
            present(sfSafariVC, animated: true)
        }
    }
    
}
