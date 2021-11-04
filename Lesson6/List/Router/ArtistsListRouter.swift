//
//  ArtistsListRouter.swift
//  Lesson6
//
//  Created by aprirez on 10/30/21.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

final class ArtistsListRouter {
    weak var view: UIViewController?
}

extension ArtistsListRouter: ArtistsListRouterInput {
    func gotoDetails(artist id: Int) {
        let details = DetailAssembly.assemble(artistId: id)
        view?.navigationController?.pushViewController(details, animated: true)
    }
}
