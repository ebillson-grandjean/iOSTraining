//
//  ObserverPattern.swift
//  Assignment22SwiftUI
//
//  Created by Ebillson Grand Jean on 6/24/24.
//

import Foundation


extension Notification.Name {
    static let downloadFinishEvent = Notification.Name("Download Finished")
}

class MyPublisher {
    
    func observe(){
        NotificationCenter.default.addObserver(self, selector: #selector(myTaskIsDone), name: .downloadFinishEvent, object: nil)
    }
        
    func startDownloading(){
        print("Download Started...")
        for i in 0...10 {
            print(i)
        }
        
        NotificationCenter.default.post(name: .downloadFinishEvent, object: self)
       

    }
    
    
    @objc func myTaskIsDone() {
        print("The download task is finished!")
    }
}
