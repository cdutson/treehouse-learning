
protocol RaceDelegate {
    func raceDidStart()
    func raceStatus(lapNumber: Int, first: Any)
    func raceDidEnd(winner: Any)
}

struct Horse {
    func giddyUp() {}
}

struct Car {
    func vroomVroom() {}
}

struct RaceCar {
    func readySetGo() {}
}

class Race {
    var laps: Int = 0
    var delegate: RaceDelegate?
    
    func start() {
    }
    func updateProgress() {
}
    func end() {    }
}

class HorseRace: Race {
    let participants: [Horse]
    
    init(laps: Int, horses: [Horse]) {
        self.participants = horses
        super.init()
        self.laps = laps
    }
    
    override func start() {
        delegate?.raceDidStart()
    }
    
    override func updateProgress() {
        laps += 1
        delegate?.raceStatus(laps, first: Horse())
    }
    
    override func end() {
        delegate?.raceDidEnd(Horse())
    }

}

// Tracker

class Tracker: RaceDelegate {
    func raceDidStart() {
        print("Tracker notified that the race has started")
    }
    
    func raceDidEnd(winner: Any) {
        print("Tracker notified that the race has ended. The winner is \(winner)")
    }
    
    func raceStatus(lapNumber: Int, first: Any) {
        print("Tracker notified that race status has been updated. Current lap: \(lapNumber) & first place: \(first)")
    }
}

// Broadcast

class Broadcast: RaceDelegate {
    func raceDidStart() {
        print("Hey the race started")
    }
    
    func raceDidEnd(winner: Any) {
        print("Hey the race ended. The winner is \(winner)")
    }
    
    func raceStatus(lapNumber: Int, first: Any) {
        print("Another lap done.")
    }
}

// Usage

let participants: [Horse] = [Horse(), Horse(), Horse()]
let race = HorseRace(laps:4, horses: participants)

let tracker = Tracker()
race.delegate = tracker

race.start()
race.updateProgress()
race.end()

race.delegate = Broadcast()

race.end()

