// DaysInWeek

import UIKit

enum Day: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday
    case Saturday, Sunday
    
    init() {
        self = .Monday
    }
    
    func DaysTillWeekend() -> Int {
        return Day.Saturday.rawValue - self.rawValue
    }
    
    func DayString() -> String {
        switch self {
            case .Monday:
                return "Monday"
            case .Tuesday:
                return "Tuesday"
            case .Wednesday:
                return "Wednesday"
            case .Thursday:
                return "Thursday"
            case .Friday:
                return "Friday"
            case .Saturday:
                return "Saturday"
            case .Sunday:
                return "Sunday"
            default:
                return "Other day"
        }
    }
}

var today = Day()
today.DaysTillWeekend()
today.DayString()

