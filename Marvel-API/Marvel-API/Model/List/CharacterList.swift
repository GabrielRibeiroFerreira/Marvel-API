//
//  CharacterList.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

class CharacterList: Codable {
    var available : Int? //The number of total available characters in this list. Will always be greater than or equal to the "returned" value.,
    var returned : Int? //The number of characters returned in this collection (up to 20).,
    var collectionURI : String? //The path to the full list of characters in this collection.,
    var items : [CharacterSummary]? //The list of returned characters in this collection.
}

struct CharacterSummary: Codable {
    var resourceURI : String? //The path to the individual character resource.,
    var name : String? //The full name of the character.,
    var role : String? //The role of the creator in the parent entity.
}

