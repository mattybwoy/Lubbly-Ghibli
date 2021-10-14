//
//  FilmCellCollectionViewCell.swift
//  Lubli Ghibli
//
//  Created by Matt Lock on 12/10/2021.
//

import UIKit

class FilmCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmYear: UILabel!
    
    let fontName = "AvantGarde-Medium"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupImage()
        setupFilmTitle()
        setupFilmYear()
    }
    
    func setupImage() {
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 8
        image.layer.cornerCurve = .continuous
        image.layer.masksToBounds = true
    }
    
    func setupFilmTitle() {
        filmTitle.font = UIFont(name: fontName, size: 15)
    }
    
    func setupFilmYear() {
        filmYear.font = UIFont(name: fontName, size: 15)
        filmYear.alpha = 0.5
    }
}
