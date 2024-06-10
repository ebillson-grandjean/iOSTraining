//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/*
 Global Queues - These are system provided queues. They have different quality of service (QOS)
 
 QOS - it tells the system what is the priority of the task
 */



DispatchQueue.global().async {
    print("Global Queue")
}

/*
 QOS
 1. User interactive
 2. User initiated
 3. Utility
 4. Default
 5. Background
 6. Unspecified
 
 */


DispatchQueue.global(qos: .default).async {
    
    print("Doing task on default qos")
}


// 1. User interactive
// For animations or for any UI related job which will require UI updates
// For tasks that interact with user and require immediate results

DispatchQueue.global(qos: .userInteractive).async {
    print("Doing task on userInteractive")
}

func playMusic() {
    
    let queue = DispatchQueue.global(qos: .userInteractive)
    
    queue.async {
        print("Logic for playing or pausing music using AvFoundation Framework")
        DispatchQueue.main.async {
            print("Updating UI for music play/pause button")
        }
    }
}

playMusic()


// 2. User initiated - When we want immediate results, scrolling a list/tableview pagination, pull to refresh

let queue = DispatchQueue.global(qos: .userInitiated)

queue.async {
    print("Logic for pagination or pull to refresh")
    DispatchQueue.main.async {
        print("Update UI like tableView refresh")
    }
}


// 3. Utility - Any task which is long running task, user is aware of that task, this task is not high priority


func downloadFile(url: URL) {
    let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
        
        if let error = error {
            print("Got the error \(error)")
            return
        }
        
        guard let data = data else {
            print("Unable to get data ")
            return
        }
        
        return
    }
    
    dataTask.resume()
}


DispatchQueue.global(qos: .utility).async {
//    downloadFile(url: URL(string: "https://file.zip")!)
    DispatchQueue.main.async {
        print("Alert: Download completed")
    }
}


// 4. Default - It falls between Initiated and utility

DispatchQueue.global(qos: .default).async {
    print("Normal API Call")
}


// 5. Background - These are the tasks that are not visible to users, like creating backups, indexing, 
// restoring from server/syncing up your data locally or to the cloud

DispatchQueue.global(qos: .background).async {
    print("Restoring backups")
}

func compressLargeVideoFiles(videos: [URL]) {
    let queue = DispatchQueue.global(qos: .background)
    
    queue.async {
        for video in videos {
            print("compression logic for video: \(video)")
        }
    }
}


// 6. Unspecified - it takes less priority

DispatchQueue.global(qos: .unspecified).async {
    print("File writing logic for logger class")
    
//    compressLargeVideoFiles(videos: <#T##[URL]#>)
}
