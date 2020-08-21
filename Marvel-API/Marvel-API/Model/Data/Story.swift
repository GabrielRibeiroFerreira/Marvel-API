//
//  Story.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

class Story: Codable {
    var id : Int? //The unique ID of the story resource.
    var title : String? //The story title.
    var description : String? //A short description of the story.
    var resourceURI : String? //The canonical URL identifier for this resource.
    var type : String? //The story type e.g. interior story, cover, text story.
    var modified : String? //Date? //The date the resource was most recently modified.
    var thumbnail : Thumbnail? //The representative image for this story.
    var comics : ComicList? //A resource list containing comics in which this story takes place.
//    var series : SeriesList? //A resource list containing series in which this story appears.
//    var events : EventList? //A resource list of the events in which this story appears.
    var characters : CharacterList? //A resource list of characters which appear in this story.
//    var creators : CreatorList? //A resource list of creators who worked on this story.
    var originalissue : ComicSummary? //A summary representation of the issue in which this story was originally published.
}
