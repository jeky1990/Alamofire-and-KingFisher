//
//  ViewController.swift
//  UseAlamofire
//
//  Created by macbook on 10/18/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var idField: UITextField!
    
    @IBOutlet weak var UserTable: UserDataTable!
    
    var myresponce : JSON?  = nil
    var arr : [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FetchedUserData()
        //PostData()
        GetDataForParticularId(id: 10)
    }
    
    @IBAction func Next(_ sender: Any)
    {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "ImagesViewController") as! ImagesViewController
        self.navigationController?.pushViewController(nav, animated: true)
    }
    @IBAction func GetButton(_ sender: UIButton)
    {
        GetDataForParticularId(id: Int(idField.text!)!)
    }
    
    func PostData()
    {
        //post data
        let url = Fetch_User_Url
        
        let parameter:Parameters = ["userId":25,"title":"Accident","body":"kjhsdfkjh sdfadsjhf khf"]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: URLEncoding.default)
            .responseJSON { response in
                print(response)
        }
    }
    
    func FetchedUserData()
    {
        ApiManager.sharedInstance.GetDataFromUrlforUsers { (UserJson) in
            self.myresponce = UserJson
            for i in 0..<self.myresponce!.count
            {
                let element = User(UserJson: self.myresponce![i])
                self.arr.append(element)
            }
            
            DispatchQueue.main.async {
                self.UserTable.dataSourceArr = self.arr
            }
        }
    }
    
    func GetDataForParticularId(id:Int)
    {
        var urlcComponents = URLComponents()
        
        urlcComponents.scheme = "https"
        urlcComponents.host = "jsonplaceholder.typicode.com"
        urlcComponents.path = "/posts"
        
        let useriditem = URLQueryItem(name: "id", value: "\(id)")
        urlcComponents.queryItems = [useriditem]
        
        guard let url = urlcComponents.url else {
            fatalError("Could not Create URL")
        }
        
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = "GET"
        urlrequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(urlrequest).responseJSON { (responce) in
            switch responce.result
            {
            case .success(let data):
                DispatchQueue.main.async
                {
                    self.myresponce = JSON(data)
                    
                    for i in 0..<self.myresponce!.count
                    {
                        let Suser = User(UserJson: self.myresponce![i])
                        self.arr.append(Suser)
                    }
                    
                    self.arr = self.UserTable.dataSourceArr
                }
            case.failure(let Error):
                print("Error",Error.localizedDescription)
            }
        }
    }
}

