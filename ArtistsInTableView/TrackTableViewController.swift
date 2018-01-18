//
//  TrackTableViewController.swift
//  ArtistsInTableView
//
//  Created by student on 3/30/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class TrackTableViewController: UITableViewController {
    
    
    var AlbumsDS: AlbumsDataSource?
    var TrackDS: TracksDataSource?
    var album: Album?
    var track: [Track]? = []
    
    var downloadAssistant4 = Download(withURLString: "https://www.cs.sonoma.edu/~kooshesh/cs470/tracks_human_readable.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadAssistant4.addObserver(self, forKeyPath: "dataFromServer", options: .old, context: nil)
        downloadAssistant4.download_request()
        title = "Tracks"

    }
    
    func albumforthisview(_ album: Album){
        self.album = album
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
      //  print(downloadAssistant4.dataFromServer!)
        TrackDS = TracksDataSource(dataSource: downloadAssistant4.dataFromServer!)
        
        track = (TrackDS?.tracksForAlbums(album!))
        
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
    
    
    deinit {
        downloadAssistant4.removeObserver(self, forKeyPath: "dataFromServer", context: nil)
    }
    
    
    



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
     
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if track != nil {
            return (track?.count)!
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath)

        if let theCell = cell as? TrackTableViewCell, let trck = track?[indexPath.row]
        {
            
            theCell.useTrack(trck)
             //   track?.removeFirst()
            
        }
        

        return cell
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
