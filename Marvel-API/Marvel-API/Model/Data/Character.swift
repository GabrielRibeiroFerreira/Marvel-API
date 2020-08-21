//
//  Character.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

class Character : Codable {
    var id : Int?
    var description : String?
    var name : String?
    var comics: ComicList?
    var thumbnail : Thumbnail?
}
