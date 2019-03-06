# SwiftDevUtility
[![Version status](https://img.shields.io/cocoapods/v/SwiftDevUtility.svg)](https://cocoapods.org/pods/SwiftDevUtility)
![Platform support](https://img.shields.io/cocoapods/p/SwiftDevUtility.svg)
[![License](https://img.shields.io/cocoapods/l/SwiftDevUtility.svg)](http://opensource.org/licenses/MIT)
[![Language](https://img.shields.io/badge/language-swift-orange.svg)](https://developer.apple.com/swift/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-orange.svg)](https://github.com/Carthage/Carthage)

A Swift development tool which can make your programming easy.
## Table of Contents
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
    * `public var translatedDate: Date?`
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
### StringExtension
```swift
public var md5String: String
```
> A read-only computed property that return the md5 string from the origin string.
> ```swift
> "Hello world".md5String//3e25960a79dbc69b674cd4ec67a72c62
> ```
```swift
public static func timeFormatString(_ seconds: Double) -> String
```
>Translate a date string(yyyy-MM-dd) to Date
>```swift
>let time = "2019-11-12"
>let dateTime = time.translatedDate//
>```
## Contact
* Email:peter1990lynn@gmail.com
* Weibo:[@PeterShi](https://weibo.com/u/2138535555)
## License
SwiftDevUtility is released under the MIT license. See [LICENSE](https://github.com/chkkassd/SwiftDevUtility/blob/master/LICENSE) for details.
