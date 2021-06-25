//
//  ViewController.swift
//  WKWebviewExample
//
//  Created by K, Senthil Kumar EX1 on 25/06/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    @IBOutlet var webView: WKWebView!
    var testURL : String = "https://www.google.com"  // Paste your URL

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        
        webView.uiDelegate = self
        let myURL = URL(string:testURL)
        let myRequest = URLRequest(url: myURL!)

        if #available(iOS 14.0, *) {
        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        } else {
        // Fallback on earlier versions
        webView.configuration.preferences.javaScriptEnabled = true
           }
        
        webView.load(myRequest)
        
        
        webView.evaluateJavaScript("document.getElementById('someElement').innerText") { (result, error) in
            if error == nil {
                print("Result = \(result as Any)")
            }else {
                print("Error= \(error as Any)")

            }
        }
        
    }


}

