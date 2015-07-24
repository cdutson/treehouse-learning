//
//  ViewController.swift
//  FunFact
//
//  Created by Corey Dutson on 2015-07-19.
//  Copyright (c) 2015 Corey Dutson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!

    let factBook = FactBook()
    let colourWheel = ColourWheel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        funFactLabel.text = factBook.randomFact()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showFunFact() {
        funFactLabel.text = factBook.randomFact()
        var newColour = colourWheel.RandomColour()
        view.backgroundColor = newColour
        funFactButton.tintColor = newColour
    }
}

