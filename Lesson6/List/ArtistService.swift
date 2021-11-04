//
//  ArtistService.swift
//  Lesson6
//
//  Created by aprirez on 10/30/21.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol ArtistServiceProtocol {

    typealias ArtistListResult = (Result<[Model.Artist]>) -> ()
    typealias ArtistDetailResult = (Result<Model.Artist>) -> ()

    func fetchArtistList(_ completion: @escaping ArtistListResult)
    func fetchArtist(at index: Int , _ completion: @escaping ArtistDetailResult)
}

final class ArtistService: ArtistServiceProtocol {

    func fetchArtistList(_ completion: @escaping ArtistListResult) {
        completion(.success(ModelStubFactory.list()))
    }

    func fetchArtist(at index: Int , _ completion: @escaping ArtistDetailResult) {
        completion(.success(ModelStubFactory.detail(index)))
    }
}
