// DaysInWeek

import UIKit

enum Day: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday
    case Saturday, Sunday
    
    func DaysTillWeekend() -> Int {
        return Day.Saturday.rawValue - self.rawValue
    }
}



var today = Day.Monday

today.DaysTillWeekend()

today = .Friday

today.DaysTillWeekend()

var holiday = Day.Saturday
holiday.DaysTillWeekend()