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
        setupFilmYear()
    }
    
    func setupImage() {
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 8
        image.layer.cornerCurve = .continuous
        image.layer.masksToBounds = true
    }
    
    func setupFilmYear() {
        filmYear.alpha = 0.5
    }
}
