//
//  BookDetailCell.swift
//  BookApp
//
//  Created by Ngoc The on 1/21/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import UIKit
import SDWebImage

class BookDetailCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    var didLikeBook: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnail.layer.cornerRadius = 6

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func bindData(book: Book) {
        thumbnail.image = UIImage(named: book.cover)
        titleLabel.text = book.title
        authorLabel.text = book.author
        commentLabel.text = "\(book.comment)"
        likeLabel.text = "\(book.like)"
        likeButton.isSelected = book.isSelected
    }
    
    // MARK: - IBActions
    @IBAction func didLikeBook(_ sender: UIButton) {
        didLikeBook?(sender.tag)
    }
}
