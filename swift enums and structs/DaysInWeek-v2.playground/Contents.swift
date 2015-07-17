// DaysInWeek

import UIKit

enum Day: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday
    case Saturday, Sunday
}

func DaysTillWeekend(day: Day) -> Int {
    return Day.Saturday.rawValue - day.rawValue
}


DaysTillWeekend(Day.Monday)
DaysTillWeekend(Day.Friday)
DaysTillWeekend(Day.Sunday)

if let firstDayOfWeek = Day(rawValue: 1) {
    DaysTillWeekend(firstDayOfWeek)
}

