import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timerPicker: UIPickerView!
    @IBOutlet weak var confirmButton: UIButton!
    
    var pickerValues = PickerFunction()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 10.0
        
        // This initiates the timerPicker, both the dataSource and delegate are definied in the PickerGenerator File
        timerPicker.dataSource = self
        timerPicker.delegate = self
        
        pickerValues.setSelectedInitialRow(picker: timerPicker)
        // This allows the user to cancel modifying the pomodoro timer and performs a segue back to the MainViewController when the user taps anywhere on the screen. This method is defined in the ScreenGestures File
        makeScreenTappable()
    }
    
}





