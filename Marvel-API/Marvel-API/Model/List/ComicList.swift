//
//  ComicList.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

class ComicList: Codable {
    var available: Int? //The number of total available issues in this list. Will always be greater than or equal to the "returned" value.
    var returned: Int? //The number of issues returned in this collection (up to 20).
    var collectionURI: String? //The path to the full list of issues in this collection.
    var items: [ComicSummary]? //The list of returned issues in this collection.
    
}

struct ComicSummary: Codable {
    var resourceURI : String? //The path to the individual comic resource.,
    var name : String? //The canonical name of the comic.
}
