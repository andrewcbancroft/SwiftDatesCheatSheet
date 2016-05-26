import UIKit

/*: 
# Overview
This is a cheat sheet for working with dates, date formatters, and date components.

*/

//: # Today's Date

let today = NSDate()
let thisTimeTomrrow = NSDate(timeIntervalSinceNow: 86400)
let thisTimeYesterday = NSDate(timeIntervalSinceNow: -86400)

/*: 
# Date Formatting
Working with NSDateFormatter to convert dates to stings and vice-versa
*/

//: ## Converting dates to strings
let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

print(dateFormatter.stringFromDate(today))

dateFormatter.dateFormat = "MMM dd, yyyy"

print(dateFormatter.stringFromDate(today))


//: ## Converting strings to dates

// Consider what might potentially come back from an API of some sort and set a dateFormatter's dateFormat property appropriately...

dateFormatter.dateFormat = "yyyy-MM-dd"
var stringFromApi = "2016-01-01"
var date = dateFormatter.dateFromString(stringFromApi)

stringFromApi = "May 26, 2016"
date = dateFormatter.dateFromString(stringFromApi)

/* Notice how the format set to the date formatter (yyyy-MM-dd) differs from the format that came back from the API (MMM dd, yyyy), which resulted in `date` being nil.
*/

/*:
# Date Components
Working with NSCalendar and NSCalendarUnit to work with components of dates.
*/

//: ## Getting date components
var calendarUnitFlags: NSCalendarUnit = [.Year, .Month, .Day, .Hour, .Minute, .Second]
var dateComponents = NSCalendar.currentCalendar().components(calendarUnitFlags, fromDate: NSDate())
dateComponents.year
dateComponents.month
dateComponents.day
dateComponents.hour
dateComponents.minute
dateComponents.second

// Observe how leaving out .Hour, .Minute, and .Second affects the values of those components of a date:
calendarUnitFlags = [.Year, .Month, .Day]
dateComponents = NSCalendar.currentCalendar().components(calendarUnitFlags, fromDate: NSDate())
dateComponents.year
dateComponents.month
dateComponents.day
dateComponents.hour
dateComponents.minute
dateComponents.second

//: ## Setting date component values

dateComponents.year = dateComponents.year + 1
dateComponents.month = 1
dateComponents.day = 1
dateComponents.hour = 0
dateComponents.minute = 0
dateComponents.second = 0

//: ## Creating dates from components
let newDate = NSCalendar.currentCalendar().dateFromComponents(dateComponents)



