// DaysInWeek

import UIKit

enum Day {
    case Monday, Tuesday, Wednesday, Thursday, Friday
    case Saturday, Sunday
}

func WeekdayOrWeekend(dayOfWeek: Day) -> String {
    switch dayOfWeek {
        case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday:
            return "It's a weekday"
        case .Saturday, .Sunday:
            return "It's the weekend"
        default:
            return "Not a valid day"
    }
}

var today = Day.Monday

WeekdayOrWeekend(Day.Monday)
WeekdayOrWeekend(Day.Saturday)
WeekdayOrWeekend(today)