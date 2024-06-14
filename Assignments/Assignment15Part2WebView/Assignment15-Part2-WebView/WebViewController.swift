//
//  ViewController.swift
//  Assignment15-Part2-WebView
//
//  Created by Ebillson Grand Jean on 6/13/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        let url = "https://github.com/"
        loadWebsite(websiteURL: url)
    }

    
    func loadWebsite(websiteURL: String) {
        let url = URL(string: websiteURL)
        
        guard let url = url else { return }
        
        let request = URLRequest(url: url)
        myWebView.load(request)
        
    }

}


extension WebViewController:WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        print("WebView ran into an error: \(error)")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("WebView Loaded successfully!")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        
        if webView.url?.absoluteString == "https://google.com/" {
            return .cancel
        }
        
        return .allow
    }
}
