//
//  SearchDetail.swift
//  SearchApp
//
//  Created by Yasemin TOK on 19.03.2022.
//

import Foundation

// MARK: - SearchDetail
struct SearchDetail: Codable {
    let resultCount: Int?
    let results: [Detail]?
}

// MARK: - Result
struct Detail: Codable {
    let wrapperType, artistType, artistName: String?
    let artistLinkURL: String?
    let artistID, amgArtistID: Int?
    let primaryGenreName: String?
    let primaryGenreID: Int?

    enum CodingKeys: String, CodingKey {
        case wrapperType, artistType, artistName
        case artistLinkURL = "artistLinkUrl"
        case artistID = "artistId"
        case amgArtistID = "amgArtistId"
        case primaryGenreName
        case primaryGenreID = "primaryGenreId"
    }
}
