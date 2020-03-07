//
//  SearchViewModel.swift
//  Lastfm-Hari
//
//  Created by Hari Prasath on 07/03/2020.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

let searchAPIKey = "33f96aba9fbc6fc213d9515420d02c16"
let albumURL = "http://ws.audioscrobbler.com/2.0/?method=album.search&album=<SEARCHKEY>&api_key=<API_KEY>&format=json"
let artistURL = "http://ws.audioscrobbler.com/2.0/?method=artist.search&artist=<SEARCHKEY>&api_key=<API_KEY>&format=json"
let trackURL = "http://ws.audioscrobbler.com/2.0/?method=track.search&track=<SEARCHKEY>&api_key=<API_KEY>&format=json"


class SearchViewModel : NSObject {
    let scopeBarItems = ["Artist", "Album", "Track"]
    var playItem = [playItems]()
    var allAlbums = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"] // Our mocked API data source
    var allArtist = ["Artist6", "Artist5", "Artist4", "Artist1", "Artist2", "Artist3"] // Our mocked API data source
    var allSongs = ["Hello", "Hi", "How", "Are", "You", "Praga"] // Our mocked API data source
    let disposeBag = DisposeBag() // Bag of disposables to release them when view is being deallocated
    var selectedScope = 0
    
    func subscribeReactiveSearch(searchBar: UISearchBar, tableView:UITableView, scopeId: Int)
    {
        selectedScope = scopeId
        searchBar.scopeButtonTitles = scopeBarItems
        searchBar.showsScopeBar = true
        computeCurrentScope(parseUrl: parseUrl(searchKey: searchBar.text ?? ""), completionHandler: { response in
            searchBar.rx.text.subscribe(onNext: {query in
                self.playItem = response.filter { ($0.name.hasPrefix(query ?? "") ) }
            tableView.reloadData()
            }).disposed(by: self.disposeBag)
        })
    }
    
}

extension SearchViewModel {
    
    func computeCurrentScope(parseUrl: String, completionHandler: @escaping (_ reponseItems:[playItems])->())
    {
        let urlConnection = UrlConnection()
        urlConnection.fetchData(url: URL(string: parseUrl)!, completionHandler: {data in
            completionHandler(self.parseResponse(data: data))
        })
    }
    
    func parseResponse(data:Data) -> [playItems]
    {
        var playItemArr = [playItems]()
        do{

            switch selectedScope {
            case 0:
                let model = try JSONDecoder().decode(ArtistModel.self, from: data )
                let artistArr = model.results.artistmatches.artist
                for artist in artistArr
                {
                    playItemArr.append(playItems(artistInfo: artist))
                }
            case 1:
                let model = try JSONDecoder().decode(AlbumModel.self, from: data )
                let albumArr = model.results.albummatches.album
                for album in albumArr
                {
                    playItemArr.append(playItems(albumInfo: album))
                }
            case 2:
                let model = try JSONDecoder().decode(TrackModel.self, from: data )
                let trackArr = model.results.trackmatches.track
                for track in trackArr
                {
                    playItemArr.append(playItems(trackInfo: track))
                }
            default:
                print("Default")
            }
        }
        catch{
        }
        return playItemArr
    }
    
    func parseUrl(searchKey: String) -> String
    {
        var urlToCall = ""
        switch selectedScope {
        case 0:
            urlToCall = artistURL
        case 1:
            urlToCall = albumURL
        case 2:
            urlToCall = trackURL
        default:
            urlToCall = artistURL
        }
        urlToCall = urlToCall.replacingOccurrences(of: "<SEARCHKEY>", with: searchKey)
        urlToCall = urlToCall.replacingOccurrences(of: "<API_KEY>", with: searchAPIKey)
        return urlToCall
    }
}
