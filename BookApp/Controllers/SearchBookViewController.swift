//
//  SearchBookViewController.swift
//  BookApp
//
//  Created by Ngoc The on 1/27/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import UIKit
import SBCardPopup

class SearchBookViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    var books: [Book] = [Book(title: "500+ Twitter Ads Examples to get inspired", author: "The best advertisers are those that constantly try new ways to improve their performances. New designs, new audiences, new ads' copy. In this eBook you'll find 500+ real world Twitter Ads Examples to get inspiration from for your campaigns!", cover: "9", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/500-Twitter-Ads-Examples.pdf", comment: 11, like: 120, price: "200000"),
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
                         Book(title: "Facebook Ads Domination: The Ultimate Guide to Using Facebook to Get More Leads and Sales (The Complete Guide to Facebook Marketing) (Volume 1)", author: "Instagram is probably the biggest scaling opportunity for everyone advertising on Facebook. In this eBook you'll find 137 real world Instagram Ads Examples to get inspiration from for your campaigns!", cover: "20", file: "https://mk0adespressoj4m2p68.kinstacdn.com/wp-content/eBooks/The-DOs-and-DONTs-of-Facebook-Ads.pdf", comment: 99, like: 12, price: "200000")]
    var filteredBooks: [Book] = []

    let searchController = UISearchController(searchResultsController: nil)
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
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

//        books = BookDataModel.shared.lstAllBook
        tableView.reloadData()
        loadingActivityIndicator.center = CGPoint(x: tableView.bounds.midX, y: tableView.bounds.midY)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Search"
    
        initSearch()
    }
    
    private func initSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search books"
        self.parent?.navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.register(UINib(nibName: "BookDetailCell", bundle: nil), forCellReuseIdentifier: "BookDetailCell")
    }
    
    func filterContentForSearchText(_ searchText: String) {
       
        filteredBooks = books.filter { (book: Book) -> Bool in
            return book.title.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    private func openDetailBook(book: Book) {
        let vc = DetailBookViewController()
        vc.url = book.file
        vc.titleBook = book.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchBookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredBooks.count
        }
        
        return books.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookDetailCell") as! BookDetailCell
        
        var book: Book

        if isFiltering {
            book = filteredBooks[indexPath.row]
        } else {
            book = books[indexPath.row]
        }
        
        cell.bindData(book: book)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var book: Book
        
        if isFiltering {
            book = filteredBooks[indexPath.row]
        } else {
            book = books[indexPath.row]
        }

        openDetailBook(book: book)
    }
}

extension SearchBookViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text ?? "")
    }
}

extension SearchBookViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text ?? "")
    }
}
