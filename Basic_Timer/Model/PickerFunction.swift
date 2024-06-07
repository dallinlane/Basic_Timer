import UIKit

//MARK: - PickerValues Struct

//Stores selected values of each componenet in a picker View
struct PickerFunction {
    var hours:Int?
    var minutes:Int?
    var seconds:Int?
    
    mutating func setValues(hr:Int, min:Int, sec:Int) {
        hours = hr
        minutes = min
        seconds = sec
    }
    
    func getValues() -> [Int]{
        return [hours!,minutes!,seconds!]
    }
    
    func setSelectedInitialRow(picker: UIPickerView){
        let timeValues = getValues()
        picker.selectRow(timeValues[0], inComponent: 0, animated: false)
        picker.selectRow(timeValues[1], inComponent: 1, animated: false)
        picker.selectRow(timeValues[2], inComponent: 2, animated: false)
    }
    
    func getValue(picker: UIPickerView , row: Int) -> Int{
        return picker.selectedRow(inComponent: row)
    }
    
    mutating func nextSegue(for segue: UIStoryboardSegue, bool: Bool, picker: UIPickerView){
        if bool{
            let destVC = segue.destination as! MainViewController
            self.setValues(hr: getValue(picker: picker , row: 0), min: getValue(picker: picker , row: 1), sec: getValue(picker: picker, row: 2))
            destVC.timerLabel.text = destVC.getLabelText(getValues())
            destVC.saveTimeIntArray(getValues())
            destVC.timerDouble = destVC.returnTimerDouble()

        }
    }
    
}

//MARK: - Initialize Time Picker

extension TimerViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return Array(0...23).count
        }
        return Array(0...59).count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return String(Array(0...23)[row])
        }
        return String(Array(0...59)[row])
    }
    
}

