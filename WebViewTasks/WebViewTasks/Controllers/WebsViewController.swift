//
//  WebsViewController.swift
//  WebViewTasks
//
//  Created by Mac on 14/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import WebKit

class WebsViewController: UIViewController {

 //MARK:- Properties
    @IBOutlet weak var webView: WKWebView!
    var urlString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        let url = URL(string: urlString!)
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
}

 //MARK:- WKNavigationDelegate Method
extension WebsViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        let alert = UIAlertController(title: "FAIL", message: "Unable to load url", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            self.navigationController?.popViewController(animated: true)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        print("fail")
    }

}
