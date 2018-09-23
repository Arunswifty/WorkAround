//
//  ViewController.swift
//  WorkAround
//
//  Created by Arun on 19/09/18.
//  Copyright © 2018 @ArunSwifty. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var FeedTable: UITableView!
    var albumModels:[AlbumModels] = []
    
    struct instanceStruct {
        var name:String? = "Hello"
        var age:Int? = 12
    }
    
    class retainClass{
        var name:String?
        var age:Int?
        
        init(name:String,age:Int) {
            self.name = name
            self.age = age
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let swiftyParam:[String:AnyObject] = [:]
        
        ServiceParser.DoNetworkCall(view: self.view, url: "https://jsonplaceholder.typicode.com/photos", parameter:swiftyParam) { (feedmode:[AlbumObject]) in
            
            self.albumModels = feedmode.map({return AlbumModels(albums: $0)})

            self.FeedTable.dataSource = self
            self.FeedTable.reloadData()
        }
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albumModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedCell

        tablecell.albumModels = self.albumModels[indexPath.row]
        
        return tablecell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

