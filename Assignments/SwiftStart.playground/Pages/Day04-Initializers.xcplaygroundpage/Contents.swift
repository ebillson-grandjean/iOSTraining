//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
class Student {
    
    var name: String = ""
    var rollNo: Int = 8
    
    
}


let s1 = Student()
//1. Default Initializer



//2. Memberwise initializer - (only for struct)
struct Employee {
    var empId: Int
    var salary: Double
}


let employeee = Employee();



//3. Custom Initializer

class Animal {
    var numberOfLegs: Int
    
    init(numberOfLegs: Int) {
        self.numberOfLegs = numberOfLegs
    }
    
    func eat(){}
}


//4. Failable Initializer

class Subject {
    
    var subjectName: String
    var compulsoryTopics: Int
    
    
    init?(subjectName: String, compulsoryTopics: Int){
        if compulsoryTopics < 5 {
            return nil
        }
        
        self.compulsoryTopics = compulsoryTopics
        self.subjectName = subjectName
    }
}


let maths = Subject(subjectName: "Maths", compulsoryTopics: 10)
let physics = Subject(subjectName: "Physics", compulsoryTopics: 4)


//5. Required Initializer

class Teacher {
    var name: String
    var numberOfSubjects: Int
    
    init(name: String, numberOfSubjects: Int){
        self.name = name
        self.numberOfSubjects = numberOfSubjects
    }
}


class SportsTeacher:Teacher {
    var favSportsName: String
    
    init(favSportsName: String, name: String, numberOfSubjects: Int) {
        self.favSportsName = favSportsName
        super.init(name: name, numberOfSubjects: numberOfSubjects)
    }
    
    required init(name: String, numberOfSubjects: Int, favSportName: String) {
        self.name = name
        self.numberOfSubjects = numberOfSubjects
        self.favSportsName = favSportName
        
    }
}



//6. Convenience Init

class Language {
    var name: String
    var numberOfyears: Int
    
    init(name: String, numberOfYears: Int){
        self.name = name
        self.numberOfyears = numberOfyears
    }
    
    convenience init(<#parameters#>) {
        <#statements#>
    }
}
