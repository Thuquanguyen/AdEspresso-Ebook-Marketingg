//
//  PopularCollectionCell.swift
//  BookApp
//
//  Created by Ngoc The on 1/20/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import UIKit
import SDWebImage

class PopularCollectionCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        thumbnailImageView.layer.cornerRadius = 6
    }

    func bindData(book: Book) {
        thumbnailImageView.image = UIImage(named: book.cover)
        titleLabel.text = book.title
        authorLabel.text = book.author
    }
}
