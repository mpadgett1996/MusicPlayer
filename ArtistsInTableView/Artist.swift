//
//  Artist.swift
//  Navigation
//
//  Created by AAK on 3/11/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class Artist: NSObject {
    
    let artist: AnyObject

    init(artist: AnyObject) {
        self.artist = artist
        super.init()
    }
    
    func artistName() -> String? {
        if let a = artist["artist_name"] {
            return a as? String
        }
        return nil
    }
    
    func artistProfile() -> String? {
        if let a = artist["profile"] {
            return a as? String
        }
        return nil        
    }
    func getartistID() -> Int? {
        if let a = artist["artist_id"] {
            return a as? Int
        }
        return nil
    }
    
    func getImage() ->UIImage? {
        if let uriString = artist["uri"], let uri = uriString as? String {
            if let url = URL(string: uri),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                return image
            }
        }
        return nil
    }
}
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
    func getArtistalbum() -> Int? {
        if let a = album["artist_id"] {
            return a as? Int
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
    
    func getalbumID() -> Int? {
        if let a = album["album_id"] {
            return a as? Int
        }
        return nil
    }

    
    
}



class Track: NSObject {
    let track: AnyObject
    
    init(track: AnyObject){
        self.track = track
        super.init()
    }
    
    func getTrackartist()-> String? {
        if let a = track["artist_name"]{
            return a as? String
        }
        return nil
        
    }
    
    func trackName() -> String? {
        if let a = track["title"] {
            return a as? String
        }
        return nil
    }
    
    
    func getTrackalbum()-> String? {
        if let a = track["album_name"]{
            return a as? String
        }
        return nil
        
    }
    
    func getTrackPostion()-> String? {
        if let a = track["position"]{
            return a as? String
        }
        return nil
        
    }
    
    func getTrackDuration()-> String? {
        if let a = track["duration"]{
            return a as? String
        }
        return nil
        
    }
    
    func getTrackAlbumID() -> Int? {
        if let a = track["album_id"]{
            return a as? Int
        }
        return nil
    }
    
    
    
    
    
    
}




class Image: NSObject {
    let image: AnyObject
    
    init(image: AnyObject){
        self.image = image
        super.init()
    }
    
    
    func getImageAlbumID() -> Int? {
        if let a = image["album_id"]{
            return a as? Int
        }
        return nil
    }
    
    
    
    func getImage() ->UIImage? {
        if let uriString = image["uri"], let uri = uriString as? String {
            if let url = URL(string: uri),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                return image
            }
        }
        return nil
    
    }
    
}
