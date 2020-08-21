//
//  Comic.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

class Comic : Codable {
    var id : Int?
    var description : String?
    var title : String?
    var prices : [ComicPrice]?
    var thumbnail : Thumbnail?
    
    struct ComicPrice : Codable {
        var type : String?
        var price : Float?
    }
}
