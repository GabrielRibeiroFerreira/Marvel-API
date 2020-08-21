//
//  StoryList.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

class StoryList: Codable {
    var available : Int? //The number of total available stories in this list. Will always be greater than or equal to the "returned" value.,
    var returned : Int? //The number of stories returned in this collection (up to 20).,
    var collectionURI : String? //The path to the full list of stories in this collection.,
    var items : [StorySummary]? //The list of returned stories in this collection.
    
}

struct StorySummary : Codable {
    var resourceURI : String? //The path to the individual story resource.,
    var name : String? //The canonical name of the story.,
    var type : String? //The type of the story (interior or cover).
}
