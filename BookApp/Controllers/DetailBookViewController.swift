//
//  DetailBookViewController.swift
//  BookApp
//
//  Created by Ngoc The on 1/21/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import WebKit

class DetailBookViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var webView: UIView!
    @IBOutlet weak var startButton: UIButton!

    var titleBook = ""
    var url = ""
    var wkWebView: WKWebView!
    var openWebView: (() -> Void)? = nil

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.parent?.title = titleBook
        initView()
    }
    
    private func initView() {
        wkWebView = WKWebView(frame: self.webView.bounds)
        wkWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        wkWebView.navigationDelegate = self
        self.webView.addSubview(wkWebView)
        loadURL()

//        startButton.layer.cornerRadius = startButton.frame.height / 2
    }
    
    private func loadURL() {
        loadingActivityIndicator.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        self.view.addSubview(loadingActivityIndicator)
        
        guard let url = URL(string: self.url) else { return }
        let requestURL = URLRequest(url: url)
        wkWebView.load(requestURL)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingActivityIndicator.removeFromSuperview()
        self.containerView.isHidden = false
    }
    
    func didLoginFacebook() {
        let webVC = WebViewController()
        webVC.openMainScreen = {
//            self.facebookView.isHidden = true
        }
        
        self.present(webVC, animated: true, completion: nil)
    }
    
    @IBAction func startAction(_ sender: Any) {
        didLoginFacebook()
    }
}
