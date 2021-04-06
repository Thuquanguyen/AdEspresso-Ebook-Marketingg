//
//  NotiPopup.swift
//  BookApp
//
//  Created by Ngoc The on 1/21/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import UIKit
import SBCardPopup

class NotiPopup: UIViewController, SBCardPopupContent {

    // MARK: - IBOutlets
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var facebookView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    var popupDismisser: SBCardPopupDismisser?
    let allowsTapToDismissPopupCard = true
    let allowsSwipeToDismissPopupCard = true
    
    var book: Book?
    var openWebView: (() -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        thumbnail.layer.cornerRadius = 6
        appleView.layer.cornerRadius = appleView.frame.height / 2
        facebookView.layer.cornerRadius = facebookView.frame.height / 2
        cancelButton.layer.cornerRadius = cancelButton.frame.height / 2
        
        let tapApple = UITapGestureRecognizer(target: self, action: #selector(didClosePopup))
        appleView.isUserInteractionEnabled = true
        appleView.addGestureRecognizer(tapApple)

        let tapFacebook = UITapGestureRecognizer(target: self, action: #selector(didLoginFacebook))
        facebookView.isUserInteractionEnabled = true
        facebookView.addGestureRecognizer(tapFacebook)
    }

    func fetchData() {
        guard let book = self.book else { return }
        if let url = URL(string: book.cover) {
            thumbnail.sd_setImage(with: url, completed: nil)
        }
        
        titleLabel.text = book.title
        authorLabel.text = book.author
        priceLabel.text = "$\(book.price)"
    }
    
    @objc func didLoginFacebook() {
        popupDismisser?.dismiss()
        openWebView?()
    }
    
    @objc func didClosePopup() {
        popupDismisser?.dismiss()
    }
    
    // MAKR: - IBActions
    @IBAction func closePopup(_ sender: UIButton) {
        didClosePopup()
    }
}
