//
//  ArtistsList.swift
//  Lesson6
//
//  Created by aprirez on 10/30/21.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

protocol ArtistsListViewInput: class {
    func reload(_ viewModels: [ArtistsListViewModel])
}

protocol ArtistsListViewOutput {
    func viewIsReady()
}

protocol ArtistsListInteractorInput {
    func obtainArtists()
    func obtainArtist(at index: Int) -> Model.Artist?
}
protocol ArtistsListInteractorOutput: class {
    func showResults(_ results: [Model.Artist])
    func showError(_ error: Error)
}

protocol ArtistsListRouterInput {
    func gotoDetails(artist id: Int)
}
