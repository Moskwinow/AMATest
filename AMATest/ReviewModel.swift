//
//  ReviewModel.swift
//  TestMovieApp
//
//  Created by Максим Вечирко on 20.05.2021.
//

import Foundation

public struct ReviewModel: Codable {
    var results: [ReviewContent]
}

public struct ReviewContent: Codable {
    var author: String
    var author_details: Author
    var content: String
}

public struct Author: Codable {
    var avatar_path: String
}
