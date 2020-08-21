//
//  Story.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

class Story: Codable {
    var id : Int?
    var description : String?
    var title : String?
    var thumbnail : Thumbnail?
    var resourceURI : String?
    var type : String?
    var modified : String? //Date
    var comics : ComicList?
//    var series : SeriesList?
//    var events : EventList?
//    var characters : CharacterList?
//    var creators : CreatorList?
//    var originalissue : ComicSummary?
}
