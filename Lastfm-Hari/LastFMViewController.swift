//
//  ViewController.swift
//  Lastfm-Hari
//
//  Created by Hari Prasath on 07/03/2020.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//

import UIKit

class LastFMViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var tableView : UITableView!
    var searchVM : SearchViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView()
    {
        searchVM = SearchViewModel()
        searchBar.delegate = self
        searchBar.selectedScopeButtonIndex = 0
        searchVM?.subscribeReactiveSearch(searchBar: searchBar, tableView: tableView, scopeId: 0)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        searchVM?.subscribeReactiveSearch(searchBar: searchBar, tableView: tableView, scopeId: selectedScope)
    }

}

// MARK: - UITableViewDataSource
/// Here we have standard data source extension for ViewController
extension LastFMViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchVM?.playItem.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playItemCell", for: indexPath)
        cell.textLabel?.text = searchVM?.playItem[indexPath.row].name
        return cell
    }
}

// MARK: - UITableViewDelegate
/// Here we have standard data source extension for ViewController
extension LastFMViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
