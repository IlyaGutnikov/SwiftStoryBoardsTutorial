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
    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        if let playerDetailsViewController = segue.source as? PlayerDetailsViewController {
            
            //add the new player to the players array
            if let player = playerDetailsViewController.player {
                players.append(player)
                
                //update the tableView
                let indexPath = NSIndexPath(row: players.count-1, section: 0)
                tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text!, game: "Chess", rating: 1)
        }
    }
    
}
