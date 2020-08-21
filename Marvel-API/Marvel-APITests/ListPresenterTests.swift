//
//  ListPresenterTests.swift
//  Marvel-APITests
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import XCTest
@testable import Marvel_API

class ListPresenterTests: XCTestCase {
    var serviceMock : ServiceMock = ServiceMock()
    var characterListPresenter : ListPresenter = ListPresenter(type: .characters, service: ServiceMock())
    var comicListPresenter : ListPresenter = ListPresenter(type: .comics, service: ServiceMock())
    var storyListPresenter : ListPresenter = ListPresenter(type: .stories, service: ServiceMock())
    
    func testDecodeCharacter() {
        var name : String?
        self.characterListPresenter.getData { (list, status, message) in
            guard let listCodable = list else { return }
            let characters = listCodable as? [Character]
            name = characters?.first?.name
        }
        
        //testing decode character
        XCTAssertEqual(name, "A-Bomb (HAS)", "getting character error")
        
        let key = Cache.getKey(type: .characters,
                               offset: self.characterListPresenter.offset,
                               limit: self.characterListPresenter.limit)
        
        let list = self.characterListPresenter.getDataFromCache(key: key)
        let characters = list as? [Character]
        name = characters?.first?.name
        
        //testing setting and getting character from cache
        XCTAssertEqual(name, "A-Bomb (HAS)", "getting character error")
    }
    
    func testDecodeComic() {
        var title : String?
        self.comicListPresenter.getData { (list, status, message) in
            guard let listCodable = list else { return }
            let comics = listCodable as? [Comic]
            title = comics?.first?.title
        }
        
        //testing decode comic
        XCTAssertEqual(title, "Marvel Previews (2017)", "getting comic error")
        
        let key = Cache.getKey(type: .comics,
                               offset: self.comicListPresenter.offset,
                               limit: self.comicListPresenter.limit)
        
        let list = self.comicListPresenter.getDataFromCache(key: key)
        let comics = list as? [Comic]
        title = comics?.first?.title
        
        //testing setting and getting comic from cache
        XCTAssertEqual(title, "Marvel Previews (2017)", "getting comic error")
    }
    
    func testDecodeStory() {
        var title : String?
        self.storyListPresenter.getData { (list, status, message) in
            guard let listCodable = list else { return }
            let stories = listCodable as? [Story]
            title = stories?.first?.title
        }
        
        //testing decode story
        XCTAssertEqual(title,
                       "Investigating the murder of a teenage girl, Cage suddenly learns that a three-way gang war is under way for control of the turf",
                       "getting story error")
                       
        let key = Cache.getKey(type: .stories,
                               offset: self.storyListPresenter.offset,
                               limit: self.storyListPresenter.limit)
                       
        let list = self.storyListPresenter.getDataFromCache(key: key)
        let stories = list as? [Story]
        title = stories?.first?.title

        //testing setting and getting story from cache
        XCTAssertEqual(title,
                       "Investigating the murder of a teenage girl, Cage suddenly learns that a three-way gang war is under way for control of the turf",
                       "getting story error")
    }
}
