//
//  MovieModel.swift
//  TestMovieApp
//
//  Created by Максим Вечирко on 19.05.2021.
//

import Foundation

public struct ResponseModel: Decodable {
    var page: Int
    var results: [Model]
}

public struct Model: TypeModel, Codable, Equatable {
    
    public var id: Int = 0
    
    public var title: String? = ""
    
    public var votes: Double = 0.0
    
    public var overview: String = ""
    
    public var image: String = ""
    
    public var name: String?
    
    public var type: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case votes = "vote_average"
        case title = "original_title"
        case id = "id"
        case overview = "overview"
        case image = "poster_path"
        case type = "media_type"
        case name = "name"
    }
}
