//
//  DataContainer.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

struct DataContainer<Element:Codable> : Codable {
    var offset : Int?
    var limit : Int?
    var total : Int?
    var count : Int?
    var results : [Element]?
}
