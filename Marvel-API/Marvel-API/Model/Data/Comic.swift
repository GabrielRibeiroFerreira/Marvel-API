//
//  Comic.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

class Comic : Codable {
    var id : Int? //The unique ID of the comic resource.
    var digitalId : Int? //The ID of the digital comic representation of this comic. Will be 0 if the comic is not available digitally.
    var title : String? //The canonical title of the comic.
    var issueNumber : Double? //The number of the issue in the series (will generally be 0 for collection formats).
    var variantDescription : String? //If the issue is a variant (e.g. an alternate cover, second printing, or director’s cut), a text description of the variant.
    var description : String? //The preferred description of the comic.
    var modified : String? //Date? //The date the resource was most recently modified.
    var isbn : String? //The ISBN for the comic (generally only populated for collection formats).
    var upc : String? //The UPC barcode number for the comic (generally only populated for periodical formats).
    var diamondCode : String? //The Diamond code for the comic.
    var ean : String? //The EAN barcode for the comic.
    var issn : String? //The ISSN barcode for the comic.
    var format : String? //The publication format of the comic e.g. comic, hardcover, trade paperback.
    var pageCount : Int? //The number of story pages in the comic.
//    var textObjects : [TextObject]? //A set of descriptive text blurbs for the comic.
    var resourceURI : String? //The canonical URL identifier for this resource.
//    var urls : [String]? //[Url]? //A set of public web site URLs for the resource.
//    var series : SeriesSummary? //A summary representation of the series to which this comic belongs.,
    var variants : [ComicSummary]? //A list of variant issues for this comic (includes the "original" issue if the current issue is a variant).
    var collections : [ComicSummary]? //A list of collections which include this comic (will generally be empty if the comic's format is a collection).
    var collectedIssues : [ComicSummary]? //A list of issues collected in this comic (will generally be empty for periodical formats such as "comic" or "magazine").
//    var dates : [ComicDate]? //A list of key dates for this comic.
    var prices : [ComicPrice]? //A list of prices for this comic.
    var thumbnail : Thumbnail? //The representative image for this comic.
//    var images : [Image]? //A list of promotional images associated with this comic.
//    var creators : CreatorList? //A resource list containing the creators associated with this comic.
    var characters : CharacterList? //A resource list containing the characters which appear in this comic.
    var stories : StoryList? //A resource list containing the stories which appear in this comic.
//    var events : EventList? //A resource list containing the events in which this comic appears.
    
    struct ComicPrice : Codable {
        var type : String? //A description of the price (e.g. print price, digital price).
        var price : Float? //The price (all prices in USD).
    }
}
