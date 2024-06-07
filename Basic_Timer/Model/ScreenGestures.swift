import UIKit

//MARK: - MainViewController - UITapGestureRecognizer

//This extension makes the timerLabel tappable in the MainViewController, and performs a segue to the TimerViewController when the timerLabel is pressed

// empty UnwindToMain method is used by the TimerViewController as a segue back to the MainViewController

extension MainViewController{
    func makeTappable(){
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        timerLabel.addGestureRecognizer(labelTap)
        timerLabel.isUserInteractionEnabled = true
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer){
        DispatchQueue.main.async { // Used Simply to allow the system to wait and prevent a crash
            self.timer.invalidate()
            self.timerOn = false
            self.setButtonText()
            self.performSegue(withIdentifier: "adjustTimer", sender: nil)
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timerOn = false
        if segue.identifier == "adjustTimer" {
            let destinationVC = segue.destination as! TimerViewController
            destinationVC.pickerValues.setValues(hr: timerIntArray[0], min: timerIntArray[1], sec: timerIntArray[2])
        }
    }
    
    @IBAction func unwindToMain(_ sender: UIStoryboardSegue){
        
    }
    
}

//MARK: - TimerViewController - UITapGestureRecognizer

// This extension performs a segue to the MainViewController via passing updated data through the prepare method when pressing the Confirm button. This extension also allows will revert back to the MainViewController if the user taps any blank area on the screen.

extension TimerViewController{
    func makeScreenTappable() {
        
        let viewTapped = UITapGestureRecognizer(target: self, action: #selector(self.screenTapped(_:)))
        view.addGestureRecognizer(viewTapped)
        view.isUserInteractionEnabled = true
    }
    
    @objc func screenTapped(_ sender: UITapGestureRecognizer){
        DispatchQueue.main.async { // Used Simply to allow the system to wait and prevent a crash
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        pickerValues.nextSegue(for: segue, bool: true, picker: timerPicker)
    }
}


