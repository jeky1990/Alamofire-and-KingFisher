//
//  ApiManager.swift
//  UseAlamofire
//
//  Created by macbook on 10/22/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class ApiManager: NSObject {
    
    
    static let sharedInstance = ApiManager()
    private override init() {
    }

    func GetDataFromUrlforImages(onCompletion:@escaping (JSON)->Void)
    {
        var myresponce : JSON? = nil
        let url = URL(string: Fetch_User_Images_URL)
        
        Alamofire.request(url!).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
            
                    myresponce = JSON(data)
                    onCompletion(myresponce!)
            
            case .failure(let error):
                print(error.localizedDescription)
    
            }
        }
    }
    
    func GetDataFromUrlforUsers(oncompletion:@escaping (JSON)->Void)
    {
        var myresponce : JSON? = nil
        let url = URL(string: Fetch_User_Url)
        
        Alamofire.request(url!).validate().responseJSON { (response) in
            switch response.result
            {
            case.success(let data):
                myresponce = JSON(data)
                oncompletion(myresponce!)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
