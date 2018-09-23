//
//  FeedModel.swift
//  WorkAround
//
//  Created by Arun on 19/09/18.
//  Copyright © 2018 @ArunSwifty. All rights reserved.
//

import Foundation
import UIKit

struct AlbumObject:Codable {
    let albumId:Int?
    let id:Int?
    let title:String?
    let url:String?
    let thumbnailUrl:String?
    
    enum CodingsKey:String,CodingKey {
        case albumId = "albumId"
        case id = "id"
        case title = "title"
        case url = "url"
        case thumbnailUrl = "thumbnailUrl"
    }
}
