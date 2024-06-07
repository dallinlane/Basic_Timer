import UIKit

extension MainViewController{
    struct Keys {
        static let timerValueKey = "firstKey"
        static let keyTwo = "secondKey"
    }
    
    func saveTimeIntArray(_ value:[Int]){
        timerIntArray = value
        defaults.setValue(timerIntArray, forKey: Keys.timerValueKey)
    }
    
    func loadTimerValue() {
        let timerVal = defaults.array(forKey: Keys.timerValueKey)
        timerIntArray = timerVal as? [Int] ?? [0,0,0]
    }
}
