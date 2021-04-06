//
//  HomeViewController.swift
//  BookApp
//
//  Created by Ngoc The on 1/20/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import UIKit
import SBCardPopup

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bookView: UIView!
    @IBOutlet weak var newBookCollectionView: UICollectionView!
    @IBOutlet weak var newBookTableView: UITableView!
    @IBOutlet weak var heightOfTbv: NSLayoutConstraint!
    
    var lstNewBook = [Book(title: "Converting Facebook Traffic Into Sales", author: "Brian Meert", cover: "2", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/uploads/2021/03/fb-sales-ae-rebrand-2.pdf", comment: 100, like: 100, price: "20200202"),
                      Book(title: "Facebook Ads Templates", author: "Allan Dib", cover: "3", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/uploads/2019/07/Facebook_Ad_Templates.pdf", comment: 100, like: 100, price: "20200202"),
                      Book(title: "Facebook Ads Cost 2020 Benchmarks", author: "Mark J Cook", cover: "4", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/uploads/2020/11/Facebook-Ads-Cost-2020-eBook-1.pdf", comment: 100, like: 100, price: "20200202"),
                      Book(title: "The Ultimate Guide to Facebook Custom Audiences", author: "Andrea Vahl", cover: "5", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/Facebook-Ads-Custom-Audiences-Guide-2019.pdf", comment: 100, like: 100, price: "20200202"),
                      Book(title: "Instagram Ads Cost 2018 Benchmarks", author: "Social Media", cover: "6", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/uploads/2018/05/instagramADScost2018eBook.pdf", comment: 100, like: 100, price: "20200202"),
                      Book(title: "Google Ads campaign on YouTube with TrueView Factsheet", author: "Help! I'm an Author", cover: "7", file: "https://cdn2.hubspot.net/hub/53/blog/docs/ebooks/how_to_create_epic_facebook_ads.pdf", comment: 100, like: 100, price: "20200202"),
                      Book(title: "137 Instagram Ads Examples", author: "Jennifer A Lee", cover: "8", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/137-Instagram-Ads-Examples.pdf", comment: 100, like: 100, price: "20200202")]
    var lstPopular = [
                      Book(title: "500+ Twitter Ads Examples to get inspired", author: "The best advertisers are those that constantly try new ways to improve their performances. New designs, new audiences, new ads' copy. In this eBook you'll find 500+ real world Twitter Ads Examples to get inspiration from for your campaigns!", cover: "9", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/500-Twitter-Ads-Examples.pdf", comment: 11, like: 120, price: "200000"),
                      Book(title: "The DOs & DON'Ts of Facebook Ads", author: "From Zero to Pro. Learn the best practices to create Facebook Ads campaigns that convert. In 45 slides we'll go from designing killer ads to improving the targeting and the conversion rate!", cover: "10", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/The-DOs-and-DONTs-of-Facebook-Ads.pdf", comment: 130, like: 110, price: "200000"),
                      Book(title: "Lead Generation with Facebook Ads", author: "Lead Generation is one of the most powerful ways to grow your business with Facebook Advertising. In this free eBook you'll learn everything you need to know to get the most out of it.", cover: "11", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/Lead-Generation-Facebook-Ads.pdf", comment: 16, like: 37, price: "200000"),
                      Book(title: "The Ultimate Social Proof Marketing Guide", author: "Do you sometimes wonder why customers pick your competitors over you? Do you feel like you do everything \"right\" - the traffic, the content, the user experience...but they still prefer to buy from someone else?", cover: "12", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/guide-social-proof-marketing.pdf", comment: 45, like: 24, price: "200000"),
                      Book(title: "The Science of Successful Twitter Ads", author: "Ever wondered what is the optimal length for a Twitter Ad headline? Or what's the perfect length of the text in the body of the Ad?", cover: "13", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/Science-Successful-Twitter-Ads.pdf", comment: 101, like: 100, price: "200000"),
                      Book(title: "The Complete Guide to Facebook Advertising", author: "Download our guide and learn how to convert your Facebook traffic into sales.", cover: "14", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/uploads/2020/11/Facebook-Ads-Cost-2020-eBook-1.pdf", comment: 44, like: 90, price: "200000"),
                      Book(title: "The 1-Page Marketing Plan: Get New Customers, Make More Money, And Stand Out From The Crowd", author: "We’ve put together these Facebook Ad templates to help you create better Facebook ads that are optimized for the platform and consistent with your brand.", cover: "15", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/500-Twitter-Ads-Examples.pdf", comment: 34, like: 67, price: "200000"),
                      Book(title: "Facebook Marketing Adversiting 2021: How To Make Over $ 20,000 + Each Month Using Facebook Ads To Skyrocket Any Brand And Business Like Dropshipping Or Affiliate", author: "We've analyzed hundreds of millions of dollars of Facebook Advertising world-wide to provide you the most complete benchmarks to understand Facebook Advertising costs and how you're performing compared to other advertisers!", cover: "16", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/uploads/2021/03/fb-sales-ae-rebrand-2.pdf", comment: 54, like: 76, price: "200000"),
                      Book(title: "Facebook Ads Made Simple: How to Create High-Converting Facebook Ads in an Hour or Less", author: "Custom Audiences are one of - if not the most - powerful targeting features of Facebook Ads. In this eBook you'll discover how to use them like a pro!", cover: "17", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/Facebook-Ads-Custom-Audiences-Guide-2019.pdf", comment: 44, like: 12, price: "200000"),
                      Book(title: "FACEBOOK MARKETING ADVERTISING 2020: The ultimate beginners guide with the latest strategies on how to become a top influencer even if you have a small", author: "We've analyzed hundreds of millions of dollars of Instagram Advertising worldwide to provide you the most complete benchmark to understand Instagram ads costs and how you're performing compared to other advertisers!", cover: "18", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/137-Instagram-Ads-Examples.pdf", comment: 78, like: 93, price: "200000"),
                      Book(title: "Help! My Facebook Ads Suck: Second Edition (Help! I'm an Author 2)", author: "Trueview Ads are a very powerful way to advertise on Youtube through Google Ads. Learn how to get the most out of them with this quick Factsheet!", cover: "19", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/uploads/2019/07/Facebook_Ad_Templates.pdf", comment: 34, like: 56, price: "200000"),
                      Book(title: "Facebook Ads Domination: The Ultimate Guide to Using Facebook to Get More Leads and Sales (The Complete Guide to Facebook Marketing) (Volume 1)", author: "Instagram is probably the biggest scaling opportunity for everyone advertising on Facebook. In this eBook you'll find 137 real world Instagram Ads Examples to get inspiration from for your campaigns!", cover: "20", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/The-DOs-and-DONTs-of-Facebook-Ads.pdf", comment: 99, like: 12, price: "200000")
    ]
    var lstBook = [Book]()
    
    var loadingActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        
        indicator.color = UIColor(hexString: "5856D6")
        indicator.startAnimating()
        
        indicator.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin,
            .flexibleTopMargin, .flexibleBottomMargin
        ]
        
        return indicator
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingActivityIndicator.center = CGPoint(x: scrollView.bounds.midX, y: scrollView.bounds.midY)
        scrollView.addSubview(loadingActivityIndicator)
        
        loadData()
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Home"
        self.parent?.navigationItem.searchController = nil
    }
    
    private func initView() {
        newBookCollectionView.register(UINib(nibName: "PopularCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionCell")
        newBookTableView.register(UINib(nibName: "BookDetailCell", bundle: nil), forCellReuseIdentifier: "BookDetailCell")
    }
    
    private func loadData() {
        BookDataModel.shared.getAllData { [weak self] in
            guard let weakSelf = self else { return }
            //            weakSelf.lstNewBook = BookDataModel.shared.lstNewBook
            //            weakSelf.lstBook = BookDataModel.shared.lstAllBook
//            weakSelf.lstPopular = BookDataModel.shared.lstPopular
            weakSelf.newBookCollectionView.reloadData()
            weakSelf.configHeightOfTBV()
            weakSelf.bookView.isHidden = false
            weakSelf.loadingActivityIndicator.removeFromSuperview()
        }
    }
    
    private func configHeightOfTBV() {
        self.heightOfTbv.constant = CGFloat(self.lstPopular.count * 180)
        self.newBookTableView.reloadData()
    }
    
    // MARK: - Logic func
    private func openWebView(withBook book: Book) {
        let webVC = WebViewController()
        webVC.openMainScreen = {
            self.openDetailBook(book: book)
        }
        self.present(webVC, animated: true, completion: nil)
    }
    
    private func openPopup(withBook book: Book) {
        let popup = NotiPopup(nibName: "NotiPopup", bundle: nil)
        popup.book = book
        popup.openWebView = {
            self.openWebView(withBook: book)
        }
        let cardPopup = SBCardPopupViewController(contentViewController: popup)
        cardPopup.show(onViewController: self)
    }
    
    private func openDetailBook(book: Book) {
        let vc = DetailBookViewController()
        vc.url = book.file
        vc.titleBook = book.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func didTapAll(_ sender: UIButton) {
    }
}

// MARK: - UICollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.lstNewBook.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newBookCollectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionCell", for: indexPath) as! PopularCollectionCell
        
        let book = self.lstNewBook[indexPath.row]
        cell.bindData(book: book)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openDetailBook(book: lstNewBook[indexPath.row])
    }
}

// MARK: - UITableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lstPopular.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newBookTableView.dequeueReusableCell(withIdentifier: "BookDetailCell") as! BookDetailCell
        cell.bindData(book: lstPopular[indexPath.row])
        cell.likeButton.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetailBook(book: lstPopular[indexPath.row])
    }
}
