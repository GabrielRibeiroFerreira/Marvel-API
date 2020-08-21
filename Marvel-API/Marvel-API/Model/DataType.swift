//
//  DataType.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

enum DataType: String {
    case characters
    case comics
    case stories
    
    func string() -> String {
        return self.rawValue
    }
}
