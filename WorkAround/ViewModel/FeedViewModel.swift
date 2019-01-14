//
//  FeedViewModel.swift
//  WorkAround
//
//  Created by Arun on 19/09/18.
//  Copyright © 2018 @ArunSwifty. All rights reserved.
//

import Foundation
import UIKit

struct AlbumModels {
    let albumId:Int?
    let id:Int?
    let title:String?
    let url:String?
    let thumbnailUrl:String?
    
    init(albums:AlbumObject) {
        self.albumId = albums.albumId
        self.id = albums.id
        self.title = albums.title
        self.url = albums.url
        self.thumbnailUrl = albums.thumbnailUrl
    }
}

final class ApiClient {
    
    static func doCall(view:UIView, completion:@escaping ([AlbumObject])-> ()){
        
        let swiftyParam:[String:AnyObject] = [:]
        
        ServiceParser.DoNetworkCall(view: view, url: "https://jsonplaceholder.typicode.com/photos", parameter: swiftyParam) { (album:[AlbumObject]) in
            
            completion(album)
        }
    }
}
