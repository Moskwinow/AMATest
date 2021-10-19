//
//  DetailTypeModel.swift
//  TestMovieApp
//
//  Created by Максим Вечирко on 19.05.2021.
//

import Foundation

public protocol DetailTypeModel {
    var id: Int {get set}
    var name: String? {get set}
    var title: String? {get set}
    var genres: [Genres]? {get set}
    var overview: String {get set}
    var image: String {get set}
    var votes: Double {get set}
}

public struct Genres: Decodable {
    var name: String
}
