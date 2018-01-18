//
//  Album.swift
//  ArtistsInTableView
//
//  Created by student on 3/20/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class Album: NSObject {
    
    let album: AnyObject
    
    init(album: AnyObject) {
        self.album = album
        super.init()
    }
    
    func albumName() -> String? {
        if let a = album["title"] {
            return a as? String
        }
        return nil
    }
    
    func getNumTracks() -> Int? {
        if let a = album["num_tracks"] {
            return a as? Int
        }
        return nil
    }
    
    func getGenre() -> String? {
        if let a = album["genres"] {
            return a as? String
        }
        return nil
        
    }
    
    func getNumImages() -> Int? {
        if let a = album["num_images"]{
            return a as? Int
        }
        return nil
    }
    
    func getYear() -> String? {
        if let a = album["title"] {
            return a as? String
        }
        return nil
    }
    
    
}
