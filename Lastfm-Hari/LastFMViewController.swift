//
//  ViewController.swift
//  Lastfm-Hari
//
//  Created by Hari Prasath on 07/03/2020.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//

import UIKit
import RxSwift

class LastFMViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var tableView : UITableView!
    let disposeBag = DisposeBag()
    var searchVM : SearchViewModel?
    let scopeBarItems = ["Artist", "Album", "Track"]
    var playItem = [playItems]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView()
    {
        searchVM = SearchViewModel()
        searchBar.scopeButtonTitles = scopeBarItems
        searchBar.showsScopeBar = true
        searchBar.delegate = self
        searchBar.selectedScopeButtonIndex = 0
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        searchVM?.updateScopeId(scope: scopeBarItems[selectedScope])
        subscribeReactiveSearch()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 1 || playItem.count == 0
        {
            subscribeReactiveSearch()
        }
    }
    
    
    func subscribeReactiveSearch()
    {
        let parsedUrl = searchVM?.parseUrl(searchKey: searchBar.text ?? "") ?? ""
        searchVM?.computeCurrentScope(parseUrl: parsedUrl, completionHandler: { response in
            self.searchBar.rx.text.subscribe(onNext:{ query in
            self.playItem = response.filter{($0.name.hasPrefix(query ?? ""))}
                self.tableView.reloadData()
            }).disposed(by: self.disposeBag)
        })
    }

}

// MARK: - UITableViewDataSource
/// Here we have standard data source extension for ViewController
extension LastFMViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playItemCell", for: indexPath) as? PlayItemCell
        cell?.title.text = playItem[indexPath.row].name
        guard let imageUrl = URL(string: playItem[indexPath.row].imageMedium()) else { return cell!}
        
        UrlConnection.fetchData(url: imageUrl, completionHandler: { data in
            cell?.img.image = UIImage(data: data)
        })
            
        return cell!
    }
}

// MARK: - UITableViewDelegate
/// Here we have standard data source extension for ViewController
extension LastFMViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
