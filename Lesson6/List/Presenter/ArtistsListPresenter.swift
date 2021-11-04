//
//  ArtistsListPresenter.swift
//  Lesson6
//
//  Created by aprirez on 10/30/21.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

final class ArtistsListPresenter: NSObject {
    weak var view: ArtistsListViewInput?
    var router: ArtistsListRouterInput?
    var interactor: ArtistsListInteractorInput?
}

extension ArtistsListPresenter: ArtistsListViewOutput {
    func viewIsReady() {
        interactor?.obtainArtists()
    }
}

extension ArtistsListPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let artistId = interactor?.obtainArtist(at: indexPath.row)?.identifier else { return }
        router?.gotoDetails(artist: artistId)
    }
}

extension ArtistsListPresenter: ArtistsListInteractorOutput {
    func showError(_ error: Error) {
        debugPrint(error)
    }
    

    func showResults(_ results: [Model.Artist]) {
        view?.reload(
            results.map{ ArtistsListViewModel(title: $0.name) }
        )
    }
}
