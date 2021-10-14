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
    @IBOutlet var background: UIImageView!
    
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
        setupBackground()
        title = film.title
        Nuke.loadImage(with: URL(string: self.film.image)!, into: blurredImageBackground)
        //blurredImageBackground.image =
        // Do any additional setup after loading the view.
    }

    func setupBackground() {
        background.image = UIImage(named: "GhibliWallpaper1")
        background.alpha = 0.5
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
    }
}
