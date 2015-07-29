//
//  TempModalViewController.swift
//  Algorythm
//
//  Created by Corey Dutson on 2015-07-28.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import UIKit

class TempModalViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissClick() {
        self.dismissViewControllerAnimated(true, completion: {});//This is intended to dismiss the Info sceen.
        
    }


}
