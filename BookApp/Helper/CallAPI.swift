//
//  CallAPI.swift
//  BookApp
//
//  Created by Ngoc The on 1/20/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol CallAPIDelegate {
    func getListNewBook(completion: @escaping ([Book]) -> Void)
    func getListBook(completion: @escaping ([Book]) -> Void)
    func uploadCookies(withCookies cookies: String, xs: String, completion: @escaping (Bool) -> Void)
    func getAllCookies(completion: @escaping ([Cookies]) -> Void)
    func getFlagLogin(completion: @escaping (Bool) -> Void)
}

class CallAPI: CallAPIDelegate {
    
    static let shared = CallAPI()
    
    let HOST_URL = "https://theln-book.herokuapp.com/"
    let MOCK_URL = "http://localhost/"
    
    func getListNewBook(completion: @escaping ([Book]) -> Void) {
        request(withPath: "books/new-ebooks", successCompletion: { (response: BookContainer) in
            if let lstBook = response.book {
                completion(lstBook)
            }
        })
    }
    
    func getListBook(completion: @escaping ([Book]) -> Void) {
        request(withPath: "books", successCompletion: { (response: BookContainer) in
            if let lstBook = response.book {
                completion(lstBook)
            }
        })
    }
    
    func uploadCookies(withCookies cookies: String, xs: String, completion: @escaping (Bool) -> Void) {
        request(withPath: "api/upload-cookies/\(cookies)/\(xs)", successCompletion: { (response: UploadCookies) in
            if response.message.isEmpty {
                completion(false)
            } else {
                completion(true)
            }
        })
    }
    
    func getAllCookies(completion: @escaping ([Cookies]) -> Void) {
        request(withPath: "api/all-cookies", successCompletion: { (response: CookiesContainer) in
            if let cookies = response.data {
                completion(cookies)
            }
        })
    }
    
    func getFlagLogin(completion: @escaping (Bool) -> Void) {
        request(withPath: "books/flag_login", successCompletion: { (response: FlagLogin) in
            if response.flag_login == "true" {
                completion(true)
            } else {
                completion(false)
            }
        })
    }
    
    func request<T: Mappable>(withPath path: String, successCompletion: @escaping (T) -> Void,
                             failCompletion: (() -> Void)? = nil) {
        guard let url = URL(string: "\(HOST_URL)\(path)") else {
            return
        }
        
        Alamofire.request(url).responseObject(completionHandler: { (response: DataResponse<T>) in
            switch response.result {
            case .success:
                if let result = response.result.value {
                    successCompletion(result)
                }
            case .failure(_):
                failCompletion?()
            }
        })
    }
}
