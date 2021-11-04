//
//  ModelStubFactory.swift
//  Lesson6
//
//  Created by aprirez on 10/30/21.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

class ModelStubFactory {
    static func list() -> [Model.Artist] {
        return [detail(0)]
    }
    
    static func detail(_ index: Int) -> Model.Artist {
        return Model.Artist(
            identifier: 1111,
            name: "John Lennon",
            albums: [
                Model.Artist.Album(
                    name: "Imagine",
                    songs: [
                        Model.Artist.Song(name: "Imagine", duration: 180),
                        Model.Artist.Song(name: "Crippled Inside", duration: 227),
                        Model.Artist.Song(name: "Jealous Guy", duration: 254),
                        Model.Artist.Song(name: "It's So Hard", duration: 205),
                        Model.Artist.Song(name: "I Don't Want to Be a Soldier", duration: 365),
                        Model.Artist.Song(name: "Gimme Some Truth", duration: 196),
                        Model.Artist.Song(name: "Oh My Love", duration: 170),
                        Model.Artist.Song(name: "How Do You Sleep?", duration: 336),
                        Model.Artist.Song(name: "How?", duration: 223),
                        Model.Artist.Song(name: "Oh Yoko!", duration: 260)
                    ],
                    date: Date(timeIntervalSince1970: 53222400)
                ) // Model.Artist.Album
            ] // albums
        ) // Model.Artist
    }
}
