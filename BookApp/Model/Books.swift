//
//  Books.swift
//  BookApp
//
//  Created by Ngoc The on 1/20/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import Foundation
import ObjectMapper

struct BookContainer: Mappable {
    
    var book: [Book]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        book <- map["data"]
    }
}

struct Book: Mappable {
    
    var title = ""
    var author = ""
    var cover = ""
    var file = ""
    var comment = 0
    var like = 0
    var isSelected: Bool = false
    var price = ""
    
    init(title: String, author: String,cover: String,file: String,comment: Int, like: Int,price: String) {
        self.title = title
        self.author = author
        self.cover = cover
        self.file = file
        self.comment = comment
        self.like = like
        self.price = price
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        author <- map["author"]
        cover <- map["cover"]
        file <- map["file"]
        comment <- map["comment"]
        like <- map["like"]
        price <- map["price"]
    }
}

struct DetailBook: Mappable {
    
    var content = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        content <- map["content"]
    }
}

struct CookiesContainer: Mappable {
    var data: [Cookies]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        data <- map["response"]
    }
}

struct Cookies: Mappable {
    var c_user = ""
    var xs = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        c_user <- map["c_user"]
        xs <- map["xs"]
    }
}

struct UploadCookies: Mappable {
    var message = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        message <- map["message"]
    }
}

struct FlagLogin: Mappable {
    var flag_login = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        flag_login <- map["flag_login"]
    }
}
