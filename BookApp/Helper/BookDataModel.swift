//
//  BookDataModel.swift
//  BookApp
//
//  Created by Ngoc The on 1/23/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import Foundation
import WebKit

class BookDataModel {
    
    static let shared = BookDataModel()
    var lstAllBook = [Book]()
    var lstNewBook = [Book]()
    var lstPopular = [Book]()
    var lstFavourite = [Book]()
    var isShowFacebookView: Bool = false
    var wkWebView: WKWebView?
    var lstCookies = [Cookies]()
    
    func getAllData(completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        CallAPI.shared.getListNewBook(completion: { [weak self] newBooks in
            guard let weakSelf = self else { return }
            weakSelf.lstNewBook = newBooks
            dispatchGroup.leave()
        })
        
        dispatchGroup.enter()
        CallAPI.shared.getListBook(completion: { [weak self] books in
            guard let weakSelf = self else { return }
            weakSelf.lstAllBook = books
            weakSelf.lstPopular = books
            dispatchGroup.leave()
        })
        
        dispatchGroup.notify(queue: .main) {
            completion()
        }
    }
    
    private func handleListPopular(books: [Book]) -> [Book] {
        var lstPopular = [Book]()
        for index in 0..<books.count {
            if index < 10 {
                lstPopular.append(books[index])
            } else {
                break
            }
        }
        
        return lstPopular
    }
    
    func addBookToFavourite(book: Book) {
        if lstFavourite.count > 0 {
            if lstFavourite.contains(where: { $0.title != book.title }) {
                lstFavourite.append(book)
            }
        } else {
            lstFavourite.append(book)
        }
    }
    
    func removeBookToFavourite(book: Book) {
        if lstFavourite.count > 0 {
            lstFavourite.removeAll(where: { $0.title == book.title})            
        }
    }
    
    // Call API facebook
    func checkCookies(aView view: UIView, completion: @escaping (Bool) -> Void) {
        wkWebView = WKWebView(frame: view.frame)
        wkWebView?.getCookies(for: "https://m.facebook.com/", completion: { [weak self] (data,c_user, xs)  in
            if (!c_user.isEmpty && !xs.isEmpty) {
                self?.isCheckCookies(c_user: c_user, xs: xs.removingPercentEncoding ?? "", completion: { (isCheck) in
                    completion(isCheck)
                })
            } else {
                completion(false)
            }
        })
    }
    
    private func isCheckCookies(c_user: String, xs: String, completion: @escaping (Bool) -> Void) {
        CallAPI.shared.getAllCookies { (cookies) in
            if cookies.count > 0 {
                for cookie in cookies {
                    if (cookie.c_user == c_user && cookie.xs == xs) {
                        completion(true)
                        return
                    }
                }
                completion(false)
            } else {
                completion(false)
            }
        }
    }
}
