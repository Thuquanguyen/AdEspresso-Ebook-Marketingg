//
//  WKWebView+Extension.swift
//  BookApp
//
//  Created by Ngoc The on 1/20/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import WebKit
extension WKWebView {

    private var httpCookieStore: WKHTTPCookieStore  { return WKWebsiteDataStore.default().httpCookieStore }

    func getCookies(for domain: String? = nil, completion: @escaping ([String : Any],String, String) -> Void)  {
        httpCookieStore.getAllCookies { cookies in
            var c_user = ""
            var xs = ""
            var cookieDict = [String : AnyObject]()
            for cookie in cookies {
                
                if cookie.name.contains("c_user") {
                    c_user = cookie.value
                } else if cookie.name.contains("xs") {
                    xs = cookie.value
                } else {
                    // do something
                }
            }
            
            for cookie in cookies {
                cookieDict[cookie.name] = cookie.properties as AnyObject?
            }
            
            completion(cookieDict,c_user, xs)
        }
    }
}
