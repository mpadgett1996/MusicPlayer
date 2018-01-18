//
//  AlbumTableViewCell.swift
//  ArtistsInTableView
//
//  Created by student on 3/28/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit


class AlbumTableViewCell: UITableViewCell {
    @IBOutlet weak var Albumimage: UIImageView!
    
    @IBOutlet weak var albumlabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func useAlbum(_ album: Album, image: UIImage?) {
        
        if image != nil {
            Albumimage.image = image
        }
        
        albumlabel.text = album.albumName()
    }
}
