//
//  ViewController.swift
//  Collection View
//
//  Created by Mac on 11/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    var imageArray = ImageModel.sharedInstance.imageArray
}
//MARK: - CollectionView DataSource and Delegate Methods
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
}

//MARK: - CollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionwidth = collectionView.bounds.width
        
        return CGSize(width: collectionwidth/3.0 - 2, height: collectionwidth/3.0 - 2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
