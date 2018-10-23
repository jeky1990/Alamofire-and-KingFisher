//
//  ImagesViewController.swift
//  UseAlamofire
//
//  Created by macbook on 10/22/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ImagesViewController: UIViewController {
    
    var myResponce : JSON? = nil
    var ImageArr : [Images] = []
    
    @IBOutlet weak var CollectionView: ImageDataTable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FetchData()
    }
    
    func FetchData()
    {
        ApiManager.sharedInstance.GetDataFromUrlforImages{ (UserImages) in
        
                self.myResponce = UserImages
                for i in 0..<self.myResponce!.count
                {
                    let element = Images(ImageJson: self.myResponce![i])
                    self.ImageArr.append(element)
                }
            
            DispatchQueue.main.async {
                self.CollectionView.imageDataSourceArr = self.ImageArr
                
            }
        }
    }
    @IBAction func Back(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

class CollCell : UICollectionViewCell
{
    @IBOutlet weak var img: UIImageView!
    
}
