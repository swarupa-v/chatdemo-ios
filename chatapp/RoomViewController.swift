//
//  RoomViewController.swift
//  chatapp
//
//  Created by Swarupa Vengurlekar on 21/11/19.
//  Copyright © 2019 Swarupa Vengurlekar. All rights reserved.
//

import UIKit

class RoomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBAction func backClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var roomTableView: UITableView!
    var roomArray:[String]? = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.roomTableView.dataSource = self
        self.roomTableView.delegate = self
        self.roomArray = SocketIOManager.sharedInstance.getRooms()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.roomArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = roomTableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")! 
        
        cell.textLabel?.text = self.roomArray![indexPath.row] //3.
        
        return cell //4.
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          SocketIOManager.sharedInstance.clearMessages()
         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
                let messageViewController = storyBoard.instantiateViewController(withIdentifier: "messageview") as! MessageViewController
                messageViewController.room = self.roomArray![indexPath.row]
                self.present(messageViewController, animated: true,completion: nil)
    }

}
