//
//  TrackModel.swift
//  Lastfm-Hari
//
//  Created by Hari Prasath on 07/03/2020.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//
import Foundation

// MARK: - Welcome
struct TrackModel: Codable {
    let results: TrackModelResults
}

// MARK: - Results
struct TrackModelResults: Codable {
    let opensearchQuery: OpensearchQuery
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String
    let trackmatches: Trackmatches
    let attr: Attr

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case trackmatches
        case attr = "@attr"
    }
}

// MARK: - Trackmatches
struct Trackmatches: Codable {
    let track: [Track]
}

// MARK: - Track
struct Track: Codable {
    let name, artist: String
    let url: String
    let streamable: Streamable
    let listeners: String
    let image: [Image]
    let mbid: String
}



enum Streamable: String, Codable {
    case fixme = "FIXME"
}
