//
//  TrackTableViewCell.swift
//  ArtistsInTableView
//
//  Created by student on 3/30/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var tracklabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func useTrack(_ track: Track){
        tracklabel.text = track.trackName()
    }

}
