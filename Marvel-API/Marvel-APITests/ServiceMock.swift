//
//  ServiceMock.swift
//  Marvel-APITests
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation
@testable import Marvel_API

class ServiceMock : ServiceProtocol {
    let characterResponse : [String : Any] =
        ["code":200,
         "status":"Ok",
         "copyright":"© 2020 MARVEL",
         "attributionText":"Data provided by Marvel. © 2020 MARVEL",
         "attributionHTML":"<a href=\"http://marvel.com\">Data provided by Marvel. © 2020 MARVEL</a>",
         "etag":"fdb485b736a02d1ab823fdb882d1a3a7079dc655",
         "data":[
            "offset":0,
            "limit":2,
            "total":4,
            "count":2,
            "results":[
                ["id":1017100,
                 "name":"A-Bomb (HAS)",
                 "description":"Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
                 "modified":"2013-09-18T15:54:04-0400",
                 "thumbnail":[
                    "path":"http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16",
                    "extension":"jpg"],
                 "resourceURI":"http://gateway.marvel.com/v1/public/characters/1017100",
                 "comics":[
                    "available":0,
                    "collectionURI":"http://gateway.marvel.com/v1/public/characters/1017100/comics",
                    "items":[],
                    "returned":0],
                 "series":[
                    "available":0,
                    "collectionURI":"http://gateway.marvel.com/v1/public/characters/1017100/series",
                    "items":[],
                    "returned":0],
                 "stories":[
                    "available":0,
                    "collectionURI":"http://gateway.marvel.com/v1/public/characters/1017100/stories",
                    "items":[],
                    "returned":0],
                 "events":[
                    "available":0,
                    "collectionURI":"http://gateway.marvel.com/v1/public/characters/1017100/events",
                    "items":[],
                    "returned":0],
                 "urls":[
                    ["type":"detail",
                     "url":"http://marvel.com/comics/characters/1017100/a-bomb_has?utm_campaign=apiRef&utm_source=3f571eccb3e73af23236d572a9811c6a"],
                    ["type":"comiclink",
                     "url":"http://marvel.com/comics/characters/1017100/a-bomb_has?utm_campaign=apiRef&utm_source=3f571eccb3e73af23236d572a9811c6a"]
                    ]
                ],
                ["id":1016823,
                 "name":"Abomination (Ultimate)",
                 "description":"",
                 "modified":"2012-07-10T19:11:52-0400",
                 "thumbnail":[
                    "path":"http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
                    "extension":"jpg"],
                 "resourceURI":"http://gateway.marvel.com/v1/public/characters/1016823",
                 "comics":[
                    "available":0,
                    "collectionURI":"http://gateway.marvel.com/v1/public/characters/1016823/comics",
                    "items":[],
                    "returned":0],
                 "series":[
                    "available":0,
                    "collectionURI":"http://gateway.marvel.com/v1/public/characters/1016823/series",
                    "items":[],
                    "returned":0],
                 "stories":[
                    "available":0,
                    "collectionURI":"http://gateway.marvel.com/v1/public/characters/1016823/stories",
                    "items":[],
                    "returned":0],
                 "events":[
                    "available":0,
                    "collectionURI":"http://gateway.marvel.com/v1/public/characters/1016823/events",
                    "items":[],
                    "returned":0],
                 "urls":[
                    ["type":"detail",
                     "url":"http://marvel.com/comics/characters/1016823/abomination_ultimate?utm_campaign=apiRef&utm_source=3f571eccb3e73af23236d572a9811c6a"],
                    ["type":"comiclink",
                     "url":"http://marvel.com/comics/characters/1016823/abomination_ultimate?utm_campaign=apiRef&utm_source=3f571eccb3e73af23236d572a9811c6a"]
                    ]
                ]
            ]
        ]
    ]

    let comicResponse : [String : Any] =
        [
           "code":200,
           "status":"Ok",
           "copyright":"© 2020 MARVEL",
           "attributionText":"Data provided by Marvel. © 2020 MARVEL",
           "attributionHTML":"<a href=\"http://marvel.com\">Data provided by Marvel. © 2020 MARVEL</a>",
           "etag":"99af7e5e465ba2e89086829ed28c59a9c3e256d2",
           "data":[
              "offset":0,
              "limit":1,
              "total":47416,
              "count":1,
              "results":[
                 [
                    "id":82967,
                    "digitalId":0,
                    "title":"Marvel Previews (2017)",
                    "issueNumber":0,
                    "variantDescription":"",
                    "description":nil,
                    "modified":"2019-11-07T08:46:15-0500",
                    "isbn":"",
                    "upc":"75960608839302811",
                    "diamondCode":"",
                    "ean":"",
                    "issn":"",
                    "format":"",
                    "pageCount":112,
                    "textObjects":[

                    ],
                    "resourceURI":"http://gateway.marvel.com/v1/public/comics/82967",
                    "urls":[
                       [
                          "type":"detail",
                          "url":"http://marvel.com/comics/issue/82967/marvel_previews_2017?utm_campaign=apiRef&utm_source=3f571eccb3e73af23236d572a9811c6a"
                       ]
                    ],
                    "series":[
                       "resourceURI":"http://gateway.marvel.com/v1/public/series/23665",
                       "name":"Marvel Previews (2017 - Present)"
                    ],
                    "variants":[
                       [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/82965",
                          "name":"Marvel Previews (2017)"
                       ],
                       [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/82970",
                          "name":"Marvel Previews (2017)"
                       ],
                       [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/82969",
                          "name":"Marvel Previews (2017)"
                       ],
                        [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/74697",
                          "name":"Marvel Previews (2017)"
                       ],
                        [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/72736",
                          "name":"Marvel Previews (2017)"
                       ],
                       [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/75668",
                          "name":"Marvel Previews (2017)"
                       ],
                       [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/65364",
                          "name":"Marvel Previews (2017)"
                       ],
                       [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/65158",
                          "name":"Marvel Previews (2017)"
                       ],
                       [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/65028",
                          "name":"Marvel Previews (2017)"
                       ],
                       [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/75662",
                          "name":"Marvel Previews (2017)"
                       ],
                       [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/74320",
                          "name":"Marvel Previews (2017)"
                       ],
                       [
                          "resourceURI":"http://gateway.marvel.com/v1/public/comics/73776",
                          "name":"Marvel Previews (2017)"
                       ]
                    ],
                    "collections":[

                    ],
                    "collectedIssues":[

                    ],
                    "dates":[
                       [
                          "type":"onsaleDate",
                          "date":"2099-10-30T00:00:00-0500"
                       ],
                       [
                          "type":"focDate",
                          "date":"2019-10-07T00:00:00-0400"
                       ]
                    ],
                    "prices":[
                       [
                          "type":"printPrice",
                          "price":0
                       ]
                    ],
                    "thumbnail":[
                       "path":"http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
                       "extension":"jpg"
                    ],
                    "images":[

                    ],
                    "creators":[
                       "available":1,
                       "collectionURI":"http://gateway.marvel.com/v1/public/comics/82967/creators",
                       "items":[
                          [
                             "resourceURI":"http://gateway.marvel.com/v1/public/creators/10021",
                             "name":"Jim Nausedas",
                             "role":"editor"
                          ]
                       ],
                       "returned":1
                    ],
                    "characters":[
                       "available":0,
                       "collectionURI":"http://gateway.marvel.com/v1/public/comics/82967/characters",
                       "items":[

                       ],
                       "returned":0
                    ],
                    "stories":[
                       "available":2,
                       "collectionURI":"http://gateway.marvel.com/v1/public/comics/82967/stories",
                       "items":[
                          [
                             "resourceURI":"http://gateway.marvel.com/v1/public/stories/183698",
                             "name":"cover from Marvel Previews (2017)",
                             "type":"cover"
                          ],
                          [
                             "resourceURI":"http://gateway.marvel.com/v1/public/stories/183699",
                             "name":"story from Marvel Previews (2017)",
                             "type":"interiorStory"
                          ]
                       ],
                       "returned":2
                    ],
                    "events":[
                       "available":0,
                       "collectionURI":"http://gateway.marvel.com/v1/public/comics/82967/events",
                       "items":[

                       ],
                       "returned":0
                    ]
                 ]
              ]
           ]
        ]

    let storieResponse : [String : Any] =
        [
           "code":200,
           "status":"Ok",
           "copyright":"© 2020 MARVEL",
           "attributionText":"Data provided by Marvel. © 2020 MARVEL",
           "attributionHTML":"<a href=\"http://marvel.com\">Data provided by Marvel. © 2020 MARVEL</a>",
           "etag":"897becb8cefe885b47871692e4266254cd610180",
           "data":[
              "offset":0,
              "limit":1,
              "total":110729,
              "count":1,
              "results":[
                 [
                    "id":7,
                    "title":"Investigating the murder of a teenage girl, Cage suddenly learns that a three-way gang war is under way for control of the turf",
                    "description":"",
                    "resourceURI":"http://gateway.marvel.com/v1/public/stories/7",
                    "type":"story",
                    "modified":"1969-12-31T19:00:00-0500",
                    "thumbnail":nil,
                    "creators":[
                       "available":0,
                       "collectionURI":"http://gateway.marvel.com/v1/public/stories/7/creators",
                       "items":[

                       ],
                       "returned":0
                    ],
                    "characters":[
                       "available":0,
                       "collectionURI":"http://gateway.marvel.com/v1/public/stories/7/characters",
                       "items":[

                       ],
                       "returned":0
                    ],
                    "series":[
                       "available":1,
                       "collectionURI":"http://gateway.marvel.com/v1/public/stories/7/series",
                       "items":[
                          [
                             "resourceURI":"http://gateway.marvel.com/v1/public/series/6",
                             "name":"Cage Vol. I (2002)"
                          ]
                       ],
                       "returned":1
                    ],
                    "comics":[
                       "available":1,
                       "collectionURI":"http://gateway.marvel.com/v1/public/stories/7/comics",
                       "items":[
                          [
                             "resourceURI":"http://gateway.marvel.com/v1/public/comics/941",
                             "name":"Cage Vol. I (Hardcover)"
                          ]
                       ],
                       "returned":1
                    ],
                    "events":[
                       "available":0,
                       "collectionURI":"http://gateway.marvel.com/v1/public/stories/7/events",
                       "items":[

                       ],
                       "returned":0
                    ],
                    "originalIssue":[
                       "resourceURI":"http://gateway.marvel.com/v1/public/comics/941",
                       "name":"Cage Vol. I (Hardcover)"
                    ]
                 ]
              ]
           ]
        ]
    
    func getData(from url: String, parameters: [String:Any]?, callBack: @escaping CallBack) throws {
        do {
            var jsonData = Data()
            let apiUrl : String = "http://gateway.marvel.com/v1/public/"
//            print(url, apiUrl + DataType.characters.string())
            if url == apiUrl + DataType.characters.string() {
                jsonData = try JSONSerialization.data(withJSONObject: self.characterResponse, options: [])
            } else if url == apiUrl + DataType.comics.string() {
                jsonData = try JSONSerialization.data(withJSONObject: self.comicResponse, options: [])
            } else if url == apiUrl + DataType.stories.string() {
                jsonData = try JSONSerialization.data(withJSONObject: self.storieResponse, options: [])
            }
            
            callBack(jsonData, true, "")
        } catch {
            print(error)
        }
    }
}

