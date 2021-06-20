# Readme

## Description
This repository contains useful extensions on Foundation, UIKit and SwiftUI

## Usage
### Chaining
Combination of [`@dynamicMemberLookup`](https://docs.swift.org/swift-book/ReferenceManual/Attributes.html) with `KeyPath`es and `callAsFunction` (or subscripts) allows to change objects with one expression
```swift
let label = UILabel().chain
.text("Text")
.textColor(.red)
.font(.system(24))
.apply()
```
### Date extensions
`Date` struct provides very little functionality, any operations with dates must be implemented through `Calendar` in very unintuitive, complex and difficult to remember ways.
To simplify operations with dates, this library provides a simple and intuitive syntax.

#### Some examples
```swift
let afterTomorrow: Date = .today + 2.days
//or .today + .days(2)
//or Date.today.adding(2 * .day)
let difference = date2 - date1
let daysBetweenDates = difference.days
//or date2.interval(of: .day, from: date1)
let weeksBetweenDates = difference.weeks
```
```swift
let hours = Date().component(.hour)
//or Date().hour()
let someDate = Date(year: 1994, month: 10, day: 4) 
```
```swift
let startOfMonth = Date().start(of: .month)
let lastMonth = Date().end(of: .year)
let lastDay = Date().end(of: .year, accuracy: .day)
let nextYear = Date().next(.year)
let nextLeapYear = Date().nearest([.month: 2, .day: 29], in: .future)?.start(of: .year)
```
```swift
let monthLenght = Date().count(of: .day, in: .month)
for month in (date1...date2).each(.month) {...}
```
```swift
let weekdayName = Date().name(of: .weekday)
if let date = Date(from: dateString, format: "dd.MM.yyyy") {...}
let dateString = Date().string("dd.MM.yyyy")
let iso860String = Date().iso860
let defaultDateString = Date().string(date: .long, time: .short)
let relativeDateString = Date().string("dd.MM.yyyy",
relative: [
.day(0): "Today, HH:mm",
.day(-1): "Yesterday",
.week(0): "EEEE",       
.year(0): "dd.MM"
]
)
```
Any function contains additional parameters with default values such as: 
```swift
calendar: Calendar = .default
locale: Locale = .default
timezone: TimeZone = .default
```
where `Calendar.default`, `Locale.default` and `TimeZone.default` - static variables that you can change.
So you can use custom `Calendar` in each function
```swift
let dayOfMonth = Date().position(of: .day, in: .month, calendar: customCalendar)
```
Or you can set your own `default` value for all functions
```swift
Calendar.default = customCalendar
```
## Installation
1.  [CocoaPods](https://cocoapods.org)

Add the following line to your Podfile:
```ruby
pod 'VD'
```
and run `pod update` from the podfile directory first.

2. [Swift Package Manager](https://github.com/apple/swift-package-manager)

Create a `Package.swift` file.
```swift
// swift-tools-version:5.0
import PackageDescription

let package = Package(
name: "SomeProject",
dependencies: [
.package(url: "https://github.com/dankinsoid/VDKit.git", from: "1.63.0")
],
targets: [
.target(name: "SomeProject", dependencies: ["VDKit"])
]
)
```
```ruby
$ swift build
```

## Author

dankinsoid, voidilov@gmail.com

## License

VDAnimation is available under the MIT license. See the LICENSE file for more info.
