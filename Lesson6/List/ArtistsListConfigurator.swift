//
//  ListConfigurator.swift
//  Lesson6
//
//  Created by aprirez on 11/4/21.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

class ArtistsListConfigurator {
    
    let presenter: ArtistsListPresenter
    let dataService: ArtistService
    let interactor: ArtistsListInteractor
    let router: ArtistsListRouter

    init(_ viewController: ListViewController) {

        presenter = ArtistsListPresenter()
        dataService = ArtistService()
        router = ArtistsListRouter()

        interactor = ArtistsListInteractor(
            service: dataService,
            output: presenter
        )

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        viewController.tableView.dataSource = viewController.dataHandler
        viewController.tableView.delegate = presenter
    }
}
