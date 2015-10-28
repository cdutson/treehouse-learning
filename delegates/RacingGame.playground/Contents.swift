import Foundation

// Participants

struct Horse {
    func giddyUp() {}
}

struct Car {
    func vroomVroom() {}
}

struct RaceCar {
    func readySetGo() {}
}

// Tracker

class Tracker {
    var laps: Int = 0
    var startTime: NSDate?
    var lapFirst: Horse?
    var winner: Horse?
}

// Races

class Race {
    var laps: Int = 0
    let raceTracker: Tracker = Tracker()
    
    func start() {}
    func updateProgress() {}
    func end() {}
}

class HorseRace: Race {
    let participants: [Horse]
    
    init(laps: Int, horses: [Horse]) {
        self.participants = horses
        super.init()
        self.laps = laps
    }
    
    override func start() {
        print("Starting Race!")
        raceTracker.startTime = NSDate()
        for horse in participants {
            horse.giddyUp()
        }
    }
    
    override func updateProgress() {
        raceTracker.laps += 1
        raceTracker.lapFirst = participants.first
        print("Progress updated")
    }
    
    override func end() {
        print("And the winner is...\(participants.first)")
        raceTracker.winner = participants.first
    }
}

// Usage

let horse1 = Horse()
let horse2 = Horse()
let horse3 = Horse()

let race = HorseRace(laps: 4, horses: [horse1, horse2, horse3])

race.start()
race.updateProgress()
race.end()
