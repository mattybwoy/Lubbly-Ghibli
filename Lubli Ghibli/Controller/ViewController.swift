//
//  ViewController.swift
//  Lubli Ghibli
//
//  Created by Matthew Lock on 29/09/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var background: UIImageView!
    var dataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        background.alpha = 0.5
        background.contentMode = .scaleToFill

        dataManager.getFilms()

    }


}

