//
//  CommonModel.swift
//  Lastfm-Hari
//
//  Created by Hari Prasath on 07/03/2020.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//

import Foundation

// MARK: - Image
struct Image: Codable {
    let text: String
    let size: Size

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

enum Size: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case mega = "mega"
    case small = "small"
}

// MARK: - Attr
struct Attr: Codable {
    let attrFor: String

    enum CodingKeys: String, CodingKey {
        case attrFor = "for"
    }
}

// MARK: - OpensearchQuery
struct OpensearchQuery: Codable {
    let text, role, searchTerms, startPage: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case role, searchTerms, startPage
    }
}

struct playItems {
    var name, artist: String
    let url: String
    let image: [Image]
    let streamable, mbid: String
    init(artistInfo:Artist) {
        name = artistInfo.name
        url = artistInfo.url
        image = artistInfo.image
        streamable = artistInfo.streamable
        artist = artistInfo.name
        mbid = artistInfo.mbid
    }
    init(albumInfo:Album) {
        name = albumInfo.name
        url = albumInfo.url
        image = albumInfo.image
        streamable = albumInfo.streamable
        artist = albumInfo.artist
        mbid = albumInfo.mbid
    }
    init(trackInfo:Track) {
        name = trackInfo.name
        url = trackInfo.url
        image = trackInfo.image
        streamable = trackInfo.streamable.rawValue
        artist = trackInfo.artist
        mbid = trackInfo.mbid
    }
    
    func imageMedium() -> String
    {
        for img in image
        {
            if img.size == .medium
            {
                return img.text
            }
        }
        return ""
    }
    
    func imageLarge() -> String
    {
        for img in image
        {
            if img.size == .large
            {
                return img.text
            }
        }
        return ""
    }
}



