//
//  UserDataTable.swift
//  UseAlamofire
//
//  Created by macbook on 10/22/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class UserDataTable: UITableView,UITableViewDelegate,UITableViewDataSource{
    
    var dataSourceArr = [User](){
        didSet{
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataSource = self
        self.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSourceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = String(dataSourceArr[indexPath.row].id)
        cell.detailTextLabel?.text = dataSourceArr[indexPath.row].title
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.textAlignment = .justified
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
}
