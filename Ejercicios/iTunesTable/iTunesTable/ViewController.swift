//
//  ViewController.swift
//  iTunesTable
//
//  Created by José Gil Ramírez S on 01/09/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import UIKit

//ctrl + clic desde la lista del storyboard - table view arrastrar hacia view controller y seleccionar datasource y delegate
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var tracks: [Tracks] = []
    let baseURL = URL(string: "https://itunes.apple.com/search?")!
    let query: [String : String] = ["term" : "megadeth", "limit" : "50"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Aqui se puede poner un indicador gráfico de la carga de datos
        
        fetchData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func fetchData() {
        let url = baseURL.withQueries(query)!
        
        let jsonDecoder = JSONDecoder()
        let anotherTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let trackList = try? jsonDecoder.decode(QueryResults.self, from: data) {
                //Aqui se puede ocultar el indicador gráfico de carga de datos con hidden
                var temp:[Tracks] = []
                trackList.results.forEach({ (track) in
                    temp.append(track)
                })
                self.tracks = temp
                self.tableView.reloadData()
            }
            else {
                print(error.debugDescription)
            }
        }
        anotherTask.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = tracks[indexPath.row].trackName
        do {
            let urlImage = URL(string: tracks[indexPath.row].artworkUrl100)
            let dataImage = try Data(contentsOf: urlImage!)
            cell.imageView?.image = UIImage(data: dataImage)
        }
        catch {
            print(error)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tracks.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
//        let shareAction = UIContextualAction(style: .normal, title: "Share", handler: {(action, sourceView, completionHandler) in
//            let text = "Listening: " + self.tracks[indexPath.row].trackName
//            let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
//            self.present(activityController, animated: true)
//        })
        
        let shareAction = UIContextualAction(style: .normal, title: "Share"){ (action, sourceView, completionHandler) in
            let text = "Listening: " + self.tracks[indexPath.row].trackName
            let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            self.present(activityController, animated: true)
            completionHandler(true)
        }
        shareAction.backgroundColor = UIColor.orange
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (action, sourceView, completionHandler) in
            self.tracks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [shareAction, deleteAction])
        return swipeConfiguration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //toSecond es el nombre identificador que le dimos al segue en el storyboard
        if segue.identifier == "toSecond" {
            let indexPath = tableView.indexPathForSelectedRow
            let destination = segue.destination as! SecondViewController
            destination.fromFirstView = tracks[(indexPath?.row)!].trackName
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



