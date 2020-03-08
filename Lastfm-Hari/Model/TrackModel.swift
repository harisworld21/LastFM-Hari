// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trackModel = try? newJSONDecoder().decode(TrackModel.self, from: jsonData)

import Foundation

// MARK: - TrackModel
struct TrackModel: Codable {
    let results: Results
}

// MARK: - Results
struct Results: Codable {
    let opensearchQuery: TrackOpensearchQuery
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String
    let trackmatches: Trackmatches
    let attr: TrackAttr

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case trackmatches
        case attr = "@attr"
    }
}

// MARK: - Attr
struct TrackAttr: Codable {
}

// MARK: - OpensearchQuery
struct TrackOpensearchQuery: Codable {
    let text, role, startPage: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case role, startPage
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
