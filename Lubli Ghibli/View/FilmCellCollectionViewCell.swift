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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
