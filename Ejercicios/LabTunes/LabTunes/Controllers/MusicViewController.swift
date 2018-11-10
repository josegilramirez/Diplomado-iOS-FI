//
//  MusicViewController.swift
//  LabTunes
//
//  Created by José Gil Ramírez S on 11/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var songs: [Song] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadSongs()
        setupSearchBar()
        // Do any additional setup after loading the view.
    }
    
    func downloadSongs() {
        Music.fetchSongs { (result: [Song]) in
            self.songs = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func downloadSongsByName(name: String) {
        Music.fetchSongs(songName: name) { (result: [Song]) in
            self.songs = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Buscar por nombre de canción"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath)
        cell.textLabel?.text = songs[indexPath.row].name
        return cell
    }
}

extension MusicViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        downloadSongsByName(name: searchController.searchBar.text!)
    }
}
