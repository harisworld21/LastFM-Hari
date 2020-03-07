//
//  ArtistModel.swift
//  Lastfm-Hari
//
//  Created by Hari Prasath on 07/03/2020.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct ArtistModel: Codable {
    let results: ArtistResults
}

// MARK: - Results
struct ArtistResults: Codable {
    let opensearchQuery: OpensearchQuery
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String
    let artistmatches: Artistmatches
    let attr: Attr

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case artistmatches
        case attr = "@attr"
    }
}

// MARK: - Artistmatches
struct Artistmatches: Codable {
    let artist: [Artist]
    
}

// MARK: - Artist
struct Artist: Codable {
    let name, listeners, mbid: String
    let url: String
    let streamable: String
    let image: [Image]
}

