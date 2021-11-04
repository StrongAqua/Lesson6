//
//  ArtistsListInteractor.swift
//  Lesson6
//
//  Created by aprirez on 10/30/21.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

final class ArtistsListInteractor {

    weak var output: ArtistsListInteractorOutput?
    private let service: ArtistService
    private var artistList: [Model.Artist] = []

    init(service: ArtistService, output: ArtistsListInteractorOutput) {
        self.output = output
        self.service = service
    }
}

extension ArtistsListInteractor: ArtistsListInteractorInput {

    func obtainArtists() {
        service.fetchArtistList {[weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(list):
                strongSelf.artistList += list
                strongSelf.output?.showResults(strongSelf.artistList)
            case let .failure(error):
                strongSelf.output?.showError(error)
            }
        }
    }

    func obtainArtist(at index: Int) -> Model.Artist? {
        guard index < artistList.count else { return nil }
        return artistList[index]
    }
}
