protocol AdvancedLifeSupport {
    func PerformCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assesSituation() {
        print("Can you tell me, what happened ?")
    }
    
    func medicalEmergency() {
        delegate?.PerformCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func PerformCPR() {
        print("30 chesst compressions, per minute.")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func PerformCPR() {
        print("30 chesst compressions, per minute.")
    }
    func useStethescope() {
        print("Listening for heart sounds.")
    }
}

class Surgeon: Doctor {
    override func PerformCPR() {
        super.PerformCPR()
            print("Sign Stay Alive, by BeeJees !")
        
    }
}

let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)
let angela = Surgeon(handler: emilio)

emilio.assesSituation()
emilio.medicalEmergency()

