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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadSongs()
        // Do any additional setup after loading the view.
    }
    
    func downloadSongs() {
        Music.fetchSongs { (result: [Song]) in
            self.songs = result
            self.tableView.reloadData()
        }
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
        return cell
    }
    
    
}
