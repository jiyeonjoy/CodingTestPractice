import Foundation

// Dictionary
// var dic1 = ["key1":1, "key2":"2"] // error
var dic1:[String:Any] = ["key1":1, "key2":"2"] // key는 Any 타입 안됨
// var dic2 = [:] // error
var dic2:[String:Int] = [:] // 빈 Dictionary


var count:Int = dic1.count
var isEmpty:Bool = dic2.isEmpty // true


var dic3 = ["key1":1, "key2":2, "key3":3]
var value1 = dic3["key1"] // 1
var value4 = dic3["key4"] // nil
var value2 = dic1["key2"] // 2
var isSame:Bool = value1 == 1 // true


// delete
dic3["key3"] = nil
//dic3.removeValue(forKey: "key1")
//dic3.removeAll()


dic3.keys
dic3.keys.sorted()
dic3.values
dic3.values.sorted()


var dict11 = ["height": 165, "age" : 100]
var dict22 = ["height": 165, "age" : 100]
var dict33 = ["Height": 165, "Age" : 100]
var dict44 = ["name": "sodeul", "address" : "Suwon"]
dict11 == dict22 // key, value 모두 같을때만 true


let condition: ((String, Int)) -> Bool = {
    $0.0.contains("h")
}
dict11.contains(where: {(key: String, value: Int) -> Bool in
    return key.contains("h")
})
dict11.contains { $0.key.contains("h") }
dict11.contains(where: condition)
dict11.filter(condition)
dict11.filter { $0.value < 1000 }
dict11.first(where: condition)


// Sequence Based Initialization
var cities = ["Delhi","Bangalore","Hyderabad"]
var Distance = [2000,10, 620]
let cityDistanceDict = Dictionary(uniqueKeysWithValues: zip(cities, Distance))


// Filtering
var closeCities = cityDistanceDict.filter { $0.value < 1000 }
closeCities // ["Bangalore" : 10 , "Hyderabad" : 620]


// Dictionary Grouping
var cities1 = ["Delhi","Bangalore","Hyderabad","Dehradun","Bihar"]
var GroupedCities = Dictionary(grouping: cities1 ) { $0.first! }
GroupedCities // ["H": ["Hyderabad"], "D": ["Delhi", "Dehradun"], "B": ["Bangalore", "Bihar"]]


// Accessing Dictionaries
var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
var someVar = someDict[1]

print( "Value of key = 1 is \(someVar)" )
print( "Value of key = 2 is \(someDict[2])" )
print( "Value of key = 3 is \(someDict[3])" )
// Value of key = 1 is Optional("One")
// Value of key = 2 is Optional("Two")
// Value of key = 3 is Optional("Three")


// Modifying Dictionaries
var someDict2:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
var oldVal = someDict2.updateValue("New value of one", forKey: 1)
var someVar2 = someDict2[1]

print( "Old value of key = 1 is \(oldVal)" )
print( "Value of key = 1 is \(someVar2)" )
print( "Value of key = 2 is \(someDict2[2])" )
print( "Value of key = 3 is \(someDict2[3])" )
// Old value of key = 1 is Optional("One")
// Value of key = 1 is Optional("New value of one")
// Value of key = 2 is Optional("Two")
// Value of key = 3 is Optional("Three")


// Iterating Over a Dictionary
var someDict3:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

for (index, keyValue) in someDict3.enumerated() {
   print("Dictionary key \(index) - Dictionary value \(keyValue)")
}

for (key, value) in someDict3 {
   print("Dictionary key \(key) - Dictionary value \(value)")
}


// Convert to Arrays
var someDict4:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

let dictKeys = [Int](someDict4.keys)
let dictValues = [String](someDict4.values)

print("Print Dictionary Keys")

for (key) in dictKeys {
   print("\(key)")
}
print("Print Dictionary Values")

for (value) in dictValues {
   print("\(value)")
}

