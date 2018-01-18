//
//  AlbumTableViewController.swift
//  ArtistsInTableView
//
//  Created by student on 3/28/17.
//  Copyright © 2017 SSU. All rights reserved.
//
import UIKit

class AlbumTableViewController: UITableViewController {
    
    var AlbumsDS: AlbumsDataSource?
    var AlbumImageDS: ImageDataSource?
    var ArtistDS: ArtistDataSource?
    var artist: Artist?
    var album: [Album]? = []
    
    var downloadAssistant2 = Download(withURLString: "https://www.cs.sonoma.edu/~kooshesh/cs470/albums.json")
    var downloadAssistant3 = Download(withURLString: "https://www.cs.sonoma.edu/~kooshesh/cs470/albumImages.json")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadAssistant3.addObserver(self, forKeyPath: "dataFromServer", options: .old, context: nil)
        downloadAssistant2.download_request()
        
        downloadAssistant3.download_request()
        
        title = "Albums"
    }
    func artistforthisview(_ artist: Artist){
        self.artist = artist
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //print(downloadAssistant2.dataFromServer!)
        
        AlbumImageDS = ImageDataSource(dataSource: downloadAssistant3.dataFromServer!)
        AlbumsDS = AlbumsDataSource(dataSource: downloadAssistant2.dataFromServer!)
        
        album = (AlbumsDS?.albumsForArtists(artist!))
        
        
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
    
    deinit {
        downloadAssistant3.removeObserver(self, forKeyPath: "dataFromServer", context: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if album != nil {
            return (album?.count)!
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath)
        
        if let theCell = cell as? AlbumTableViewCell, let album = album?[indexPath.row]
        {
            
            let image: UIImage? = AlbumImageDS?.imagesForAlbums(album)?.getImage()
            
            theCell.useAlbum(album,image: image)
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ToTracks" {
            /*
             if let row = tableView.indexPathForSelectedRow?.row {
             let artist = artistsDS?.artistAt(row)
             let detailedVC = segue.destinationViewController as! ArtistDetailedViewController
             detailedVC.artistForThisView(artist!)
             }
             */
            // OR
            let cell = sender as! AlbumTableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let detailedVC = segue.destination as! TrackTableViewController
                
                detailedVC.albumforthisview((album?[indexPath.row])!)
            }
            
        }
        
        
    }
    
}

