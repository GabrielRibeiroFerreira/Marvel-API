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

    func testGetCharacter() {
        var name : String?
        self.characterListPresenter.getData { (list, status, message) in
            guard let listCodable = list else { return }
            let characters = listCodable as? [Character]
            name = characters?.first?.name
        }

        XCTAssertEqual(name, "A-Bomb (HAS)", "getting character error")
    }
    
    func testGetComic() {
        var title : String?
        self.comicListPresenter.getData { (list, status, message) in
            guard let listCodable = list else { return }
            let comics = listCodable as? [Comic]
            title = comics?.first?.title
        }

        XCTAssertEqual(title, "Marvel Previews (2017)", "getting comic error")
    }
    
    func testGetStory() {
        var title : String?
        self.storyListPresenter.getData { (list, status, message) in
            guard let listCodable = list else { return }
            let stories = listCodable as? [Story]
            title = stories?.first?.title
        }

        XCTAssertEqual(title,
                       "Investigating the murder of a teenage girl, Cage suddenly learns that a three-way gang war is under way for control of the turf",
                       "getting story error")
    }
}
