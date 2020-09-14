//
//  ViewController.swift
//  WebViewTasks
//
//  Created by Mac on 14/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import WebKit
import SafariServices


class ViewController: UIViewController {
    //MARK:- Properties
    @IBOutlet weak var collectionView: UICollectionView!
    var webs = WebLinkManager.sharedInstance.webLinks
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
}
//MARK: - UICollectionViewDataSource Method
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        webs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WebsCollectionViewCell
        let web = webs[indexPath.row]
        cell.webIconImage.image = UIImage(named: web.webImage)
        return cell
    }
}

//MARK: - CollectionViewDelegate Method
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showSimpleActionSheet(indexpath: indexPath.row)
    }
    //MARK: - ActionSheet
    func showSimpleActionSheet(indexpath:Int) {
        let temp = self.webs[indexpath]
        let alert = UIAlertController(title: "Title", message: "Open with", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Webview", style: .default, handler: { (_) in
            let webpage = self.storyboard?.instantiateViewController(identifier: "WebsViewController") as! WebsViewController
            webpage.urlString = temp.website
            self.navigationController?.pushViewController(webpage, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        
    }
}

//MARK: - CollectionViewDelegateFlowLayout Method
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionwidth = collectionView.bounds.width
        
        return CGSize(width: collectionwidth/2.0 - 2, height: collectionwidth/2.0 - 2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

