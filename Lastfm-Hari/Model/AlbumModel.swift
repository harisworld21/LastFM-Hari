//
//  AlbumModel.swift
//  Lastfm-Hari
//
//  Created by Hari Prasath on 07/03/2020.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct AlbumModel: Codable {
    let results: AlbumResults
}

// MARK: - Results
struct AlbumResults: Codable {
    let opensearchQuery: OpensearchQuery
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String
    let albummatches: Albummatches
    let attr: Attr

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case albummatches
        case attr = "@attr"
    }
}

// MARK: - Albummatches
struct Albummatches: Codable {
    let album: [Album]
}

// MARK: - Album
struct Album: Codable {
    let name, artist: String
    let url: String
    let image: [Image]
    let streamable, mbid: String
}

