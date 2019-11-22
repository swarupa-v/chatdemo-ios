//
//  MessageViewController.swift
//  chatapp
//
//  Created by Swarupa Vengurlekar on 21/11/19.
//  Copyright © 2019 Swarupa Vengurlekar. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SocketIOManager.sharedInstance.getMessages().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messageTableView.dequeueReusableCell(withIdentifier: "messageCellIdentifier")!
        let messages = SocketIOManager.sharedInstance.getMessages();
        cell.textLabel?.text = messages[indexPath.row] //3.
        
        return cell //4.
    }
    

    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var chatTextfield: UITextField!
    var room:String = ""
    
    @IBAction func sendClick(_ sender: Any) {
        
        SocketIOManager.sharedInstance.sendMessage(message: chatTextfield.text!, room: room)
        self.chatTextfield.text = ""
    }

    
    @IBAction func backClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SocketIOManager.sharedInstance.joinRoom(name: self.room)
        
       
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(messageRcvd),
            name: NSNotification.Name(rawValue: "messagercvd"),
            object: nil)
    }
    
  
    @objc func messageRcvd(notfication: NSNotification) {
        self.messageTableView.reloadData()
    }

    
    
    

}
