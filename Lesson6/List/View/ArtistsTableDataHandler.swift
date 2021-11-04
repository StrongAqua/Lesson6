//
//  ArtistsTableDataHandler.swift
//  Lesson6
//
//  Created by aprirez on 11/4/21.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

final class ArtistsTableDataHandler: NSObject, UITableViewDataSource {
    var artistsList: [ArtistsListViewModel] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      cell.accessoryType = .disclosureIndicator
      cell.textLabel?.text = artistsList[indexPath.row].title

      return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsList.count
    }

    func reload(_ viewModels: [ArtistsListViewModel]) {
        artistsList.removeAll()
        artistsList.append(contentsOf: viewModels)
    }
}
