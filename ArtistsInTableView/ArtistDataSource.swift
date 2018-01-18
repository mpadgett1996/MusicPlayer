//
//  ArtistDataSource.swift
//  Navigation
//
//  Created by AAK on 3/11/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class ArtistDataSource: NSObject {
    
    var artists: [AnyObject]
    
    init(dataSource: [AnyObject]) {
        artists = dataSource
       
        super.init()
    }
    
    func numArtists() -> Int{
        return artists.count
    }
    
    func artistAt(_ index: Int) -> Artist {
        let artist = Artist( artist: artists[index] )
        return artist        
    }
   
    
    
}
class AlbumsDataSource: NSObject {
    var albums: [AnyObject]
    var artists: ArtistDataSource?
    
    init(dataSource: [AnyObject]) {
        albums = dataSource
        super.init()
    }
    
    func albumAt(_ index: Int) -> Album {
        let album = Album( album: albums[index])
        return album
    }
    func albumsForArtists( _ artist: Artist) -> [Album] {
        let id = artist.getartistID()
        var artistalbums: [Album] = []
        for art in albums {
            let album: Album = Album(album: art)
            let artistID = album.getArtistalbum()
            if artistID == id {
                print(art)
                artistalbums.append(album)
            }
        }
        
        return artistalbums    }
}




class TracksDataSource: NSObject {
    var tracks: [AnyObject]
   
    var albums: AlbumsDataSource?
    
    init(dataSource: [AnyObject]) {
        tracks = dataSource
        super.init()
    }
    
    func TrackAt(_ index: Int) -> Track {
        let track = Track( track: tracks[index])
        return track
    }
    
    func tracksForAlbums( _ album: Album) -> [Track] {
        let id = album.getalbumID()
        var albumtracks: [Track] = []
        for alb in tracks {
            let track: Track = Track(track: alb)
            let albumID = track.getTrackAlbumID()
      
            if albumID == id {
                print(alb)
                albumtracks.append(track)
            }
        }
        
        return albumtracks   }
}



class ImageDataSource: NSObject {
    var images: [AnyObject]
    
    
    
    init(dataSource: [AnyObject]) {
        images = dataSource
        
        super.init()
    }
    
    func numImage() -> Int{
        return  images.count
    }
    
    
    
    func imageAt(_ index: Int) -> Image {
        let images = Image( image: self.images[index] )
        return images
    }
    
    func imagesForAlbums( _ album: Album) -> Image? {
        let id = album.getalbumID()
    
        for alb in images{
            let image: Image = Image(image: alb)
            let albumID = image.getImageAlbumID()
            
            if albumID == id {
                print(alb)
                return image
            }
        }
        
        return nil  }
    
    
    
    
}
