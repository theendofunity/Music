//
//  SearchViewController.swift
//  Music
//
//  Created by Дмитрий Дудкин on 19.04.2022.
//

import UIKit
import Alamofire

class SearchViewController: UITableViewController {
    let id = "CellId"
    
    private var tracks: [TrackModel] = [
        TrackModel(trackName: "Track1", artistName: "Artist1"),
        TrackModel(trackName: "Track2", artistName: "Artist2"),
    ]
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
        setupSearchBar()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let track = tracks[indexPath.row]
        content.text = track.trackName
        content.secondaryText = track.artistName
        content.image = UIImage(systemName: "person")
        cell.contentConfiguration = content

        return cell
    }
    
    func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchBar.delegate = self
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        
        AF.request(url).responseData(completionHandler: { data in
            
        })
    }
}
