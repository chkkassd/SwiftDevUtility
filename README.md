# SwiftDevUtility
[![Version status](https://img.shields.io/cocoapods/v/SwiftDevUtility.svg)](https://cocoapods.org/pods/SwiftDevUtility)
![Platform support](https://img.shields.io/cocoapods/p/SwiftDevUtility.svg)
[![License](https://img.shields.io/cocoapods/l/SwiftDevUtility.svg)](http://opensource.org/licenses/MIT)
[![Language](https://img.shields.io/badge/language-swift-orange.svg)](https://developer.apple.com/swift/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-orange.svg)](https://github.com/Carthage/Carthage)

A Swift development tool which can make your programming easy.
## Table of Contentsyyy
* [General info](#(General-info))
* [Requirement](#Requirement)
* [Installation](#Installation)
* [Usage](#Usage)
* [Contact](#Contact)
* [License](#License)
## General info
This tool provides some useful functions which can be often used in your programming.It extends some Swift Standard Library and create some useful structs.
## Requirement
* iOS 11+
* Swift 4.2
## Installation
`Cocoapods:`
```bash
pod 'SwiftDevUtility'
```
`Carthage:`
```bash
github "chkkassd/SwiftDevUtility"
```
## Usage
* [StringExtension](#StringExtension)
    * `public var md5String: String`
    * `public var convertedDate: Date?`
    * `public static func timeFormatString(_ seconds: Double) -> String`
* [ArrayExtension](#ArrayExtension)
    * `public func reject(_ predicate: (Element) -> Bool) -> [Element]`
    * `public func allMatch(_ predicate: (Element) -> Bool) -> Bool`
* [DictionaryExtension](#DictionaryExtension)
    * `public mutating func merge<S>(_ sequence: S) where S: Sequence, S.Iterator.Element == (key: Key, value: Value)`
    * `public init<S: Sequence>(_ sequence: S) where S.Iterator.Element == (key: Key, value: Value)`
    * `public func valueMap<T>(_ transform:(Value) -> T) -> [Key:T]`
* [SequenceExtension](#SequenceExtension)
    * `public func unique() -> [Iterator.Element]`
* [DateExtension](#DateExtension)
    * `public var standardTimeString: String`
    * `public var weekdayIndex: Int?`
    * `public var weekdayEnum: WeekDay`
    * `public var weekdayString: String`
    * `public var firstDayDate: Date?`
    * `public var lastDayDate: Date?`
* [URLExtension](#URLExtension)
    * `public var pathString: String?`
* [UIImageExtension](#UIimageExtension)
    * `public func scaledImage(_ rect: CGRect, _ compressionQuality: CGFloat) -> UIImage?`
* [UIViewExtension](#UIViewExtension)
    * `@IBInspectable public var viewCornerRadius: CGFloat`
    * `@IBInspectable public var viewBorderWidth: CGFloat`
    * `@IBInspectable public var viewBorderColor: UIColor`
* [AppInfoHelper](#AppInfoHelper)
    * `public static var appVersion: String?`
    * `public static var appBuildVersion: String?`
    * `public static var appName: String?`
* [DirectoryPath](#DirectoryPath)
    * `public static func pathOfDocuments() -> String`
    * `public static func pathOfTemporary() -> String`
    * `public static func pathOfCache() -> String`
    * `public static func urlInDocument(with component: String) -> URL`
    * `public static func urlInTemporary(with component: String) -> URL`
    * `public static func urlInCache(with component: String) -> URL`
    * `public static func directoryPathInDocument(withDirectoryName name: String) -> String`
    * `public static func directoryURLInDocument(withDirectoryName name: String) -> URL`
* [ScreenShot](#ScreenShot)
    * `public static func screenShot(withView view: UIView) -> UIImage?`
* [SSFSortDescriptor](#SSFSortDescriptor)
### StringExtension
```swift
public var md5String: String
```
> A read-only computed property that return the md5 string from the origin string.
> ```swift
> "Hello world".md5String//3e25960a79dbc69b674cd4ec67a72c62
> ```
---
```swift
public var convertedDate: Date?
```
>Convert a ISO8601 string(yyyy-MM-dd'T'HH:mm:ssZ) to Date.
>```swift
>let time = "2019-3-12T12:34:23+0000"
>let dateTime = time.convertedDate//Optional(2019-03-12 12:34:23 +0000)
>```
---
```swift
public static func timeFormatString(_ seconds: Double) -> String
```
> Convert seconds to a string with style of "mm:ss"
> ```swift
> String.timeFormatString(188.8)//03:08
> ```
### ArrayExtension
```swift
public func reject(_ predicate: (Element) -> Bool) -> [Element]
```
> Delete the element which matchs the predicate.
> ```swift
> let a = [1,2,3,4,5,6]
> let b = a.reject{$0 % 2 == 0}//[1,3,5]
> ```
---
```swift
public func allMatch(_ predicate: (Element) -> Bool) -> Bool
```
> Weather all elements match the predicate.
> ```swift
> let a = [1,2,3,4,5,6]
> let c = a.allMatch{$0 > 0}//true
>```
### DictionaryExtension
```swift
public mutating func merge<S>(_ sequence: S) where S: Sequence, S.Iterator.Element == (key: Key, value: Value)
```
> Merge a sequence into a dictionary.
> ```swift
> var a = ["name": "jack", "age": "10"]
> let b = ["name": "Tom", "age": "10", "address": "shanghai"]
> a.merge(b)//["address": "shanghai", "age": "10", "name": "Tom"]
> ```
---
```swift
init<S: Sequence>(_ sequence: S) where S.Iterator.Element == (key: Key, value: Value)
```
> Initail a dictionary by a sequence,such as [(key:xx, value:xx)].
> ```swift
> let c = [("name", "Peter"), ("age", "20")]
> let d = Dictionary(c)//["age": "20", "name": "Peter"]
> ```
---
```swift
public func valueMap<T>(_ transform:(Value) -> T) -> [Key:T]
```
> A dictionary's value map to a new value with the transform,then return a new dictionary.
> ```swift
> let e = ["height": 80, "width": 100]
> let f = e.valueMap { $0 / 2 }//["height": 40, "width": 50]
> ```
### SequenceExtension
```swift
public func unique() -> [Iterator.Element]
```
> Find the unique element in the sequence,it will drop the repeated element.
> ```swift
> let a = [1,2,3,4,4,8,8]
> let b = a.unique()//[1, 2, 3, 4, 8]
> ```
### DateExtension
```swift
public var standardTimeString: String
```
> Convert date to string(yyyy-MM-dd HH:mm:ss)
> ```swift
> let date = Date()
> date.standardTimeString//"2019-03-06 14:14:34"
> ```
---
```swift
public var weekdayIndex: Int?
```
> Convert a date to weekdayIndex(saturday is 0, sunday is 1, Monday is 2,...).
> ```swift
> let date = Date()
> date.weekdayIndex//Optional(4)
> ```
---
```swift
public var weekdayEnum: WeekDay
```
> Convert a date to weekday enum..
> ```swift
> let date = Date()
> date.weekdayEnum//WED
> ```
---
```swift
public var weekdayString
```
> Convert a date to chinese weekday string.
> ```swift
> let date = Date()
> date.weekdayString//"周三"
> ```
---
```swift
public var firstDayDate: Date?
```
> Fetch the first day of a week by a date.
> ```swift
> let date = Date()
> date.firstDayDate//Optional(2019-03-02 06:14:34 +0000)
> ```
---
```swift
public var lastDayDate: Date?
```
> Fetch the last day of a week by a date.
> ```swift
> let date = Date()
> date.lastDayDate//Optional(2019-03-08 06:14:34 +0000)
> ```
### URLExtension
```swift
public var pathString: String?
```
> Convert a file url to a path string
> ```swift
> let fileURL = DirectoryPath.urlInDocument(with: "test")//file:///Users/xxx/Library/Developer/CoreSimulator/Devices/761F483C-6A5C-4A4F-8F3C-7FDABBEC5A86/data/Containers/Data/Application/099F3AE8-8743-4466-B147-F84A91AE8C17/Documents/test
> let filePath = fileURL.pathString//Optional("/Users/xxx/Library/Developer/CoreSimulator/Devices/761F483C-6A5C-4A4F-8F3C-7FDABBEC5A86/data/Containers/Data/Application/099F3AE8-8743-4466-B147-F84A91AE8C17/Documents/test")
> ```
### UIImageExtension
```swift
public func scaledImage(_ rect: CGRect, _ compressionQuality: CGFloat) -> UIImage?
```
> Scale a big image to a small image with specifial rect.
> ```swift
> let aImage = UIImage(named: "water")
> aImage.size//Optional((180.0, 180.0))
> let bImage = aImage?.scaledImage(CGRect(x: 0, y: 0, width: 20, height: 20), 1.0)
> bImage.size//Optional((20.0, 20.0))
> ```
### UIViewExtension
```swift
@IBInspectable public var viewCornerRadius: CGFloat
```
> Discribe corner radius of a view and reflect in storyboard.
---
```swift
@IBInspectable public var viewBorderWidth: CGFloat
```
> Discribe border width of a view and reflect in storyboard.
---
```swift
@IBInspectable public var viewBorderColor: UIColor
```
> Discribe border color of a view and reflect in storyboard.
### AppInfoHelper
```swift
public static var appVersion: String?
```
> Fetch the app version.
> ```swift
> AppInfoHelper.appVersion//Optional("1.0.1")
> ```
---
```swift
public static var appBuildVersion: String?
```
> Fetch the app build version
> ```swift
> AppInfoHelper.appBuildVersion//Optional("1")
> ```
---
```swift
public static var appName: String?
```
> Fetch the app name
> ```swift
> AppInfoHelper.appName//Optional("SwiftDevUtilityDemo")
> ```
### DirectoryPath
```swift
public static func pathOfDocuments() -> String
```
> Document directory path
> ```swift
> DirectoryPath.pathOfDocuments()// /Users/xxx/Library/Developer/CoreSimulator/Devices/761F483C-6A5C-4A4F-8F3C-7FDABBEC5A86/data/Containers/Data/Application/11F3E559-1365-473D-AFA5-C7C10AD2800A/Documents
> ```
---
```swift
public static func pathOfTemporary() -> String
```
> Temporary directory path
> ```swift
> DirectoryPath.pathOfTemporary()// /Users/xxx/Library/Developer/CoreSimulator/Devices/761F483C-6A5C-4A4F-8F3C-7FDABBEC5A86/data/Containers/Data/Application/11F3E559-1365-473D-AFA5-C7C10AD2800A/tmp/
> ```
---
```swift
public static func pathOfCache() -> String
```
> Cache directory path
> ```swift
> DirectoryPath.pathOfCache()// /Users/xxx/Library/Developer/CoreSimulator/Devices/761F483C-6A5C-4A4F-8F3C-7FDABBEC5A86/data/Containers/Data/Application/11F3E559-1365-473D-AFA5-C7C10AD2800A/Library/Caches
> ```
---
```swift
public static func urlInDocument(with component: String) -> URL
```
> Create URL in document compent
> ```swift
> DirectoryPath.urlInDocument(with: "haha")//file:///Users/xxx/Library/Developer/CoreSimulator/Devices/761F483C-6A5C-4A4F-8F3C-7FDABBEC5A86/data/Containers/Data/Application/11F3E559-1365-473D-AFA5-C7C10AD2800A/Documents/haha
> ```
---
```swift
public static func urlInTemporary(with component: String) -> URL
```
> Create URL in temporary compent
> ```siwft
> DirectoryPath.urlInTemporary(with: "hihi")//file:///Users/xxx/Library/Developer/CoreSimulator/Devices/761F483C-6A5C-4A4F-8F3C-7FDABBEC5A86/data/Containers/Data/Application/331A1DE9-81A4-4322-88BD-334E34AEBD06/tmp/hihi
> ```
---
```swift
public static func urlInCache(with component: String) -> URL
```
> Create URL in cache compent
> ```swift
> DirectoryPath.urlInCache(with: "hehe")//file:///Users/xxx/Library/Developer/CoreSimulator/Devices/761F483C-6A5C-4A4F-8F3C-7FDABBEC5A86/data/Containers/Data/Application/331A1DE9-81A4-4322-88BD-334E34AEBD06/Library/Caches/hehe
> ```
---
```swift
public static func directoryPathInDocument(withDirectoryName name: String) -> String
```
> Creat directory path at document directory.
> ```swift
> DirectoryPath.directoryPathInDocument(withDirectoryName: "test1")// /Users/xxx/Library/Developer/CoreSimulator/Devices/761F483C-6A5C-4A4F-8F3C-7FDABBEC5A86/data/Containers/Data/Application/331A1DE9-81A4-4322-88BD-334E34AEBD06/Documents/test1
> ```
---
```swift
public static func directoryURLInDocument(withDirectoryName name: String) -> URL
```
> Creat directory URL at document directory
> ```swift
> DirectoryPath.directoryURLInDocument(withDirectoryName: "test2")//file:///Users/xxx/Library/Developer/CoreSimulator/Devices/761F483C-6A5C-4A4F-8F3C-7FDABBEC5A86/data/Containers/Data/Application/331A1DE9-81A4-4322-88BD-334E34AEBD06/Documents/test2
> ```
### ScreenShot
```swift
public static func screenShot(withView view: UIView) -> UIImage?
```
> Crop a specific view
> ```swift
> let image = SSFScreenShot.screenShot(withView: aView)//It will crop aView and return a image
> ```
### SSFSortDescriptor
```swift
public typealias SortDescriptor<T> = (T, T) -> Bool
```
> The documention of the function type (T, T) -> Bool.
```swift
infix operator |>: LogicalDisjunctionPrecedence
public func |><T>(l: @escaping SortDescriptor<T>, r: @escaping SortDescriptor<T>) -> SortDescriptor<T>
```
> Mix operator with two SortDescriptor<T> type.
```swift
public static func makeDescriptor<Key, Value>(key: @escaping (Key) -> Value, _ isAscending: @escaping (Value, Value) -> Bool) -> SortDescriptor<Key>
```
> Create the specific sortDescriptor by the sorted data and the sorted methods.
> Parameter: `key` is a function which returns the real sorted value.
> Parameter: `isAscending` is a function which comapre the sorted value.
> Return: A SortDescriptor function which use `key` and `isAscending`.
##### SortedDescriptor Example
```swift
struct Dog {
    var name: String = ""
    var age: Int = 0
}

let dog1 = Dog(name: "laifu", age: 4)
let dog2 = Dog(name: "xiaohu", age: 3)
let dog3 = Dog(name: "dingdang", age: 8)
let dog4 = Dog(name: "laifu", age: 6)
let dog5 = Dog(name: "laifu", age: 9)
let dogs = [dog1, dog2, dog3, dog4, dog5]

let nameSortDescriptor: SortDescriptor<Dog> = SSFSortDescriptor.makeDescriptor(key: {$0.name}, >)
let ageSortDescriptor: SortDescriptor<Dog> = SSFSortDescriptor.makeDescriptor(key: {$0.age}, >)

let newDogs = dogs.sorted(by: nameSortDescriptor |> ageSortDescriptor)
print(newDogs)//[Dog(name: "xiaohu", age: 3), Dog(name: "laifu", age: 9), Dog(name: "laifu", age: 6), Dog(name: "laifu", age: 4), Dog(name: "dingdang", age: 8)]
```
## Contact
* Email:peter1990lynn@gmail.com
* Weibo:[@PeterShi](https://weibo.com/u/2138535555)
## License
SwiftDevUtility is released under the MIT license. See [LICENSE](https://github.com/chkkassd/SwiftDevUtility/blob/master/LICENSE) for details.
