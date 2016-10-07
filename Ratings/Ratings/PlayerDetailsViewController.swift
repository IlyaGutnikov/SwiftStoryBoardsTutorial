//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Илья on 07.10.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    
    var player:Player?

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var game:String = "Chess" {
        didSet {
            detailLabel.text? = game
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text!, game: game, rating: 1)
        }
        
        if segue.identifier == "PickGame" {
            if let gamePickerViewController = segue.destination as? GamePickerViewController {
                gamePickerViewController.selectedGame = game
            }
        }
    }
    
    @IBAction func unwindWithSelectedGame(segue:UIStoryboardSegue) {
        if let gamePickerViewController = segue.source as? GamePickerViewController,
            let selectedGame = gamePickerViewController.selectedGame {
            game = selectedGame
        }
    }
}
