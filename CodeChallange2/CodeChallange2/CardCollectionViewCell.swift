//
//  CardCollectionViewCell.swift
//  CodeChallange2
//
//  Created by Ron Avrahami on 4/11/21.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func update(image: UIImage) {
        imageView.image = image
    }
}
