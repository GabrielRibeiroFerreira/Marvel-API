//
//  Character.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

class Character : Codable {
    var id : Int? //The unique ID of the character resource.
    var name : String? //The name of the character.
    var description : String? //A short bio or description of the character.
    var modified : String? //Date? //The date the resource was most recently modified.
    var resourceURI : String? //The canonical URL identifier for this resource.
//    var urls : [String]? //[URL]? //A set of public web site URLs for the resource.
    var thumbnail : Thumbnail? //The representative image for this character.
    var comics: ComicList? //A resource list containing comics which feature this character.
    var stories : StoryList? //A resource list of stories in which this character appears.
//    var events : EventList? //A resource list of events in which this character appears.
//    var series : SeriesList? //A resource list of series in which this character appears.
}
