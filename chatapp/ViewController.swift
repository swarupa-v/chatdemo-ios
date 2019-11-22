//
//  ViewController.swift
//  chatapp
//
//  Created by Swarupa Vengurlekar on 21/11/19.
//  Copyright © 2019 Swarupa Vengurlekar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roomLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.roomLabel.text = "Welcome to chat" //SocketIOManager.sharedInstance.rooms
    }
    
    @IBAction func roomClick(_ sender: Any) {
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        
//        let roomViewController = storyBoard.instantiateViewController(withIdentifier: "roomview") as! RoomViewController
//        
//        self.navigationController?.pushViewController(roomViewController, animated: true)

    }
    
//    @IBAction func joinChat(_ sender: Any) {
//        SocketIOManager.sharedInstance.sendMessage(message: "Hi", room: "Room1")
//    }
//    
    
//    @IBAction func joinRoomClick(_ sender: Any) {
//
//        SocketIOManager.sharedInstance.joinRoom(name: "Room1")
//
//
//    }
//

}

