//
//  ViewController.swift
//  chatapp
//
//  Created by Swarupa Vengurlekar on 21/11/19.
//  Copyright © 2019 Swarupa Vengurlekar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var nameSpaces:[String] = ["/my-namespace","/my-namespace1"]
    @IBOutlet weak var namespaceTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = namespaceTableView.dequeueReusableCell(withIdentifier: "namespaceCellIdentifier")!
        
        cell.textLabel?.text = nameSpaces[indexPath.row] //3.
        
        return cell //4.
    }
    

    @IBOutlet weak var roomLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.roomLabel.text = "Welcome to chat" //SocketIOManager.sharedInstance.rooms
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let roomViewController = storyBoard.instantiateViewController(withIdentifier: "roomview") as! RoomViewController
        //roomViewController.room = self.roomArray![indexPath.row]
        let namespace = self.nameSpaces[indexPath.row]
        //SocketIOManager.sharedInstance.setNamespaces(namespace: namespace)
        self.present(roomViewController, animated: true,completion: nil)
    }

}

