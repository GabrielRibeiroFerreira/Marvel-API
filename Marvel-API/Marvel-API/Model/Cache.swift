//
//  Cache.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

struct Cache {
    static let imageCache = NSCache<NSString, NSData>()
    static let characterCache = NSCache<NSString, DataWrapper<Character>>()
    static let comicCache = NSCache<NSString, DataWrapper<Comic>>()
    static let storyCache = NSCache<NSString, DataWrapper<Story>>()
    
    static func getKey(type: DataType, offset: Int, limit: Int) -> String {
        let key = type.string() + String(offset) + "/" + String(limit)
        return key
    }
}
