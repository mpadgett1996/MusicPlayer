//
//  AlbumDataSource.swift
//  ArtistsInTableView
//
//  Created by student on 3/20/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class AlbumDataSource: NSObject {
    
    var albums: [AnyObject]
    
    init(dataSource: [AnyObject]) {
        albums = dataSource
        super.init()
    }
    
    func numAlbums() -> Int{
        return albums.count
    }
    
    func albumAt(_ index: Int) -> Artist{
        let album = Artist( artist: albums[index] )
        return album
    }
    
}
