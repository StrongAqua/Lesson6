//
//  ArtistsListPresenterTests.swift
//  Lesson6Tests
//
//  Created by aprirez on 11/4/21.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import XCTest
@testable import Lesson6

final class ArtistsListPresenterTests: XCTestCase {
    
    private var presenter: ArtistsListPresenter!
    private var viewModels: [ArtistsListViewModel] = []
    private var viewStub: ArtistsListViewStub!
    
    class ArtistsListViewStub: ArtistsListViewInput {
        var reloaded = false

        func reload(_ viewModels: [ArtistsListViewModel]) {
            reloaded = true
        }
    }

    class ArtistsListRouterStub: ArtistsListRouterInput {
        var sawDetails = false

        func gotoDetails(artist id: Int) {
            sawDetails = true
        }
    }

    class ArtistsListInteractorStub: ArtistsListInteractorInput {
        var artistList: [Model.Artist] = []

        func obtainArtists() {
            artistList = ModelStubFactory.list()
        }
        
        func obtainArtist(at index: Int) -> Model.Artist? {
            return ModelStubFactory.detail(index)
        }
    }
    
    override func setUp() {
        viewStub = ArtistsListViewStub()
        presenter = ArtistsListPresenter()
        presenter.view = viewStub
        presenter.router = ArtistsListRouterStub()
        presenter.interactor = ArtistsListInteractorStub()
    }
    
    override func tearDown() {
        presenter = nil
        viewStub = nil
    }
    
    func testPresenter() {
        presenter.viewIsReady()
        
        let interactor = presenter.interactor as! ArtistsListInteractorStub

        XCTAssertFalse(interactor.artistList.isEmpty)
    }

}
