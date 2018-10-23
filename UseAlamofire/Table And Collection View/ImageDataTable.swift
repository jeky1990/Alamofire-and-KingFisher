//
//  ImageDataTable.swift
//  UseAlamofire
//
//  Created by macbook on 10/22/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
import SDWebImage
import Kingfisher


class ImageDataTable: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var imageDataSourceArr = [Images]()
    {
        didSet{
            reloadData()
        }
    }
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.delegate = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return imageDataSourceArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollCell
        
        let urlString = imageDataSourceArr[indexPath.row].url
        
        let url = URL(string: urlString)
        
        /*do{
            let data = try Data(contentsOf: url!)
            cell.img.image = UIImage(data: data)
        }catch{}*/
        
//        Alamofire.request(url!).responseData { (response) in
//
//            if let data = response.data
//            {
//                cell.img.image = UIImage(data: data)
//            }
//        }
        
       //cell.img.af_setImage(withURL: URL(string: urlString)!, placeholderImage: UIImage(named: "1") , filter: nil, imageTransition: .curlDown(0.1), runImageTransitionIfCached: true, completion: nil)
        
        //cell.img.sd_setImage(with: url, placeholderImage: UIImage(named: "1.png"))
        
        //cell.img.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
    
        
        cell.img.kf.setImage(with: url, placeholder: UIImage(named: "1"), options: [], progressBlock: { (receivedSize, TotalSize) in
            print("Received Size \(receivedSize) TotalSize \(TotalSize)")
        }) { (image, error, catchType, url) in
            if  error == nil
            {
                print("Download Completed")
            }
        }
    
        return cell
    }
    
}

extension ImageDataTable:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let CollWidth = collectionView.bounds.width
        return CGSize(width: CollWidth/2-2, height: CollWidth/2-2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
