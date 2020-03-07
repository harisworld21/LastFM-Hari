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


class SearchViewModel : NSObject {
    let scopeBarItems = ["Artist","Album","Songs"]
    var playItems = [String]()
    var allAlbums = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"] // Our mocked API data source
    var allArtist = ["Artist6", "Artist5", "Artist4", "Artist1", "Artist2", "Artist3"] // Our mocked API data source
    var allSongs = ["Hello", "Hi", "How", "Are", "You", "Praga"] // Our mocked API data source
    let disposeBag = DisposeBag() // Bag of disposables to release them when view is being deallocated
    var selectedScope = 0
    
    func subscribeReactiveSearch(searchBar: UISearchBar, tableView:UITableView)
    {
        var selectedItem = [String]()
        switch selectedScope {
        case 0:
            selectedItem = allArtist
        case 1:
            selectedItem = allAlbums
        case 2:
            selectedItem = allSongs
        default:
            selectedItem = allArtist
        }
        searchBar.rx.text.subscribe(onNext: {query in
        self.playItems = selectedItem.filter { $0.hasPrefix(query ?? "") }
        tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    func computeCurrentScope(scopeId: Int)
    {
        selectedScope = scopeId
        print(selectedScope)
    }
}
