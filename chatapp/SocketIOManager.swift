//
//  SocketIOManager.swift
//  chatapp
//
//  Created by Swarupa Vengurlekar on 21/11/19.
//  Copyright © 2019 Swarupa Vengurlekar. All rights reserved.
//

import Foundation
import SocketIO


class SocketIOManager: NSObject {
    
    static let sharedInstance = SocketIOManager()
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
    lazy var socket = manager.socket(forNamespace: "/my-namespace1")
    var rooms:[String]? = []
    var messages:[String]? = []
    override init() {
        super.init()
        
        socket.joinNamespace()
        
        socket.on("hi") { dataArray, ack in
            print("socket connected \(dataArray)")

            self.rooms = (dataArray as! [String])
            let array = self.rooms?.first!.components(separatedBy: ",")
            print(array);
            self.rooms = array;
        }
        
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func joinRoom(name:String){
        socket.emit("joinroom", name)
        
        socket.on("roomresult") { dataArray, ack in
            print("room connected \(dataArray)")
            //self.socket.emit("chatmessage", "Room1");
        }
        
        socket.on("roomerr") { dataArray, ack in
            print("room connected error \(dataArray)")
        }
        
        socket.on("message") { dataArray, ack in
            print("message recieved \(dataArray)")
        }
  
    }
    
    func sendMessage(message:String, room:String){
       
        socket.emit("chatmessage", ["room":room,"message":message])
        
        socket.on("messagebroadcast") { dataArray, ack in
            print("message recieved\(dataArray)")
            let message = dataArray as! [String]
            self.messages?.append(message.first!)
            
            let unique = Array(Set(self.messages!))
            self.messages = unique
            let nc = NotificationCenter.default
            nc.post(name: Notification.Name("messagercvd"), object: nil)
        }
        
    }
    
    func getRooms()-> [String]{
        return self.rooms!
    }
    
    func getMessages()-> [String]{
        return self.messages!
    }
    
    func clearMessages(){
        return (self.messages?.removeAll())!
    }
    
    func setNamespaces(namespace:String){
        socket = manager.socket(forNamespace: namespace)
    }
}

