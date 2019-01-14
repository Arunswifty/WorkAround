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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ApiClient.doCall(view: self.view) { (albumObject) in
            self.albumModels = albumObject.map({return AlbumModels(albums: $0)})
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

