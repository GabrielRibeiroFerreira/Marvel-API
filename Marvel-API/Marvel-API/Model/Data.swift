//
//  Data.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

let url = "http://gateway.marvel.com/v1/public/"
let timestamp: String = NSDate().timeIntervalSince1970.description
let publicKey: String = "3f571eccb3e73af23236d572a9811c6a"
let privateKey: String = "8ca986cc60fe75b08da060874a58bce4d6b2c18e"
let hash = Hash.MD5(string: timestamp + privateKey + publicKey)
var copyright: String = ""
