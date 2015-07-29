//
//  PlaylistDetailViewController.swift
//  Algorythm
//
//  Created by Corey Dutson on 2015-07-28.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController {


    @IBOutlet weak var buttonPressLabel: UILabel!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        if playlist != nil {
            buttonPressLabel.text = playlist!.title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
