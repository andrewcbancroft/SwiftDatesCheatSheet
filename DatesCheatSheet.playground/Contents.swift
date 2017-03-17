import UIKit

/*:
 # Overview
 This is a cheat sheet for working with dates, date formatters, and date components.
 Updated to Swift 3 - iOS 10 by MDWdev (Melissa Webster)
 on March 17, 2017
 
 */

//: # Today's Date

let today = Date()
let thisTimeTomorrow = Date(timeIntervalSinceNow: 86400)
let thisTimeYesterday = Date(timeIntervalSinceNow: -86400)

/*:
 # Date Formatting
 Working with NSDateFormatter to convert dates to stings and vice-versa
 */

//: ## Converting dates to strings
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

print(dateFormatter.string(from: today))

dateFormatter.dateFormat = "MMM dd, yyyy"

print(dateFormatter.string(from: today))


//: ## Converting strings to dates

// Consider what might potentially come back from an API of some sort and set a dateFormatter's dateFormat property appropriately...

dateFormatter.dateFormat = "yyyy-MM-dd"
var stringFromApi = "2016-01-01"
var date = dateFormatter.date(from: stringFromApi)

stringFromApi = "May 26, 2016"
date = dateFormatter.date(from: stringFromApi)

/* Notice how the format set to the date formatter (yyyy-MM-dd) differs from the format that came back from the API (MMM dd, yyyy), which resulted in `date` being nil.
 */

/*:
 # Date Components
 Working with NSCalendar and NSCalendarUnit to work with components of dates.
 */

//: ## Getting date components
//var calendarUnitFlags: NSCalendar.Unit = [.year, .month, .day, .hour, .minute, .second]
var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
dateComponents.year
dateComponents.month
dateComponents.day
dateComponents.hour
dateComponents.minute
dateComponents.second

// Observe how leaving out .Hour, .Minute, and .Second affects the values of those components of a date:
var dateComponents2 = Calendar.current.dateComponents([.year, .month, .day], from: Date())
dateComponents2.year
dateComponents2.month
dateComponents2.day
dateComponents2.hour
dateComponents2.minute
dateComponents2.second

//: ## Setting date component values

dateComponents2.year = dateComponents2.year! + 1
dateComponents2.month = 1
dateComponents2.day = 1
dateComponents2.hour = 0
dateComponents2.minute = 0
dateComponents2.second = 0

//: ## Creating dates from components
//let newDate = NSCalendar.currentCalendar().dateFromComponents(dateComponents2)
let newDate = Calendar.current.date(from: dateComponents2)



