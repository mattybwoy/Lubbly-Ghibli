//
//  SearchResultsController.swift
//  Lubli Ghibli
//
//  Created by Matt Lock on 14/10/2021.
//

import UIKit
import Nuke

class FilmDetailViewController: UIViewController {
    
    private let film: Film
    @IBOutlet var filmYear: UILabel!
    @IBOutlet var filmTitle: UILabel!
    @IBOutlet var filmDirector: UILabel!
    @IBOutlet var filmDescriptionLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    @IBOutlet var filmDescription: UITextView!
    @IBOutlet var runtime: UILabel!
    @IBOutlet var blurredImageBackground: UIImageView!
    
    init(film: Film) {
        self.film = film
        super.init(nibName: "FilmDetailViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = film.title
        Nuke.loadImage(with: URL(string: self.film.image)!, into: blurredImageBackground)
        filmTitle.text = film.title
        filmYear.text = film.release_date
        filmDirector.text = film.director
        filmDescriptionLabel.text = "Description"
        filmDescription.text = film.description
        runtimeLabel.text = "Runtime"
        runtime.text = String(film.runtime)
    }

}
