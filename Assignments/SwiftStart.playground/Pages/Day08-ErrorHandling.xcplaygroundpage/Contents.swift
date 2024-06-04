//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


func division(num: Double, deno: Double) throws -> Double {
    guard deno != 0 else {
        throw DivisionError.dividedByZero
    }
    return Double (num / deno)
}


// 1. do catch

do {
    let result = try division(num: 10, deno: 2)
    print(result)
}catch{
    print(error.localizedDescription)
}


// 2. try?
print(try? division(num: 10.0, deno: 2.0))
// Division by Zero exception
print(try? division(num: 10.0, deno: 0))

let output = try? division(num: 5.0, deno: 2.0)
print(output)


// 3. try!
//let otherOutput = try! division(num: 5, deno: 0)
//print(otherOutput)

enum DivisionError:Error {
    case dividedByZero
    case none
}


enum FileError:Error {
    case fileNotFound
    case unreadable
    case decodingError
    case noData
}


func readFile(name fileName: String) throws -> String {
    if(fileName != "existingFile.txt") {
        throw FileError.fileNotFound
    }
    
//    guard let data = Data(contentsOf: URL(string: "MyFile")!, options: nil) else {
//        throw FileError.noData
//    }
    
    return "Contents inside File!"
}



do {
    let  fileData = try readFile(name: "myFile.txt")
    print(fileData)
}catch{
    switch error {
    case FileError.fileNotFound:
        print("Couldn't find the file")
    case FileError.unreadable:
        print("File unreadable")
    case FileError.decodingError:
        print("Cannot decode file")
    case FileError.noData:
        print("No data")
    default:
        print("Couldn't read file")
    }
}

