import UIKit


class MainViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    var timerOn = false
    
    let defaults = UserDefaults.standard
    
    
    var timerIntArray:[Int] = [0,0,0]
    var timerDouble:Double = 0.0
    var timer = Timer()
    var oneSecond = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatt()
        
        makeTappable()
        
        loadTimerValue()
        timerDouble = returnTimerDouble()
        timerLabel.text = getLabelText(timerIntArray)
        
        
        
    }
    
}

//MARK: - <#Title#>
extension MainViewController{
    @IBAction func startTimer(_ sender: UIButton) {
        timer.invalidate()
        timerOn = !timerOn
        setButtonText()
        
        if timerOn{
            timerAction()
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
        
        
    }
    
    @objc func timerAction(){
        if timerOn {
            if timerDouble >= 0.001{
                timerDouble -= 0.001
                updateTimerLabel()
            }else{
                startButton.setTitle("Start", for: UIControl.State.normal)
                
                timer.invalidate()
            }
        }
        
        
        timerLabel.text = getLabelText(timerIntArray)
        
    }
    func updateTimerLabel(){
        oneSecond -= 0.001
        
        if oneSecond < 0{
            oneSecond = 1.0
            
            if timerIntArray[2] <= 0{
                if timerIntArray[1] >= 1{
                    timerIntArray[1] -= 1
                    timerIntArray[2] = 59
                }else if timerIntArray[0] >= 1{
                    timerIntArray[0] -= 1
                    timerIntArray[1] = 59
                    timerIntArray[2] = 59
                }
            }else{ timerIntArray[2] -= 1 }
        }
        
    }
    
    func returnTimerDouble() -> Double{
        return Double((timerIntArray[0]*60*60)+(timerIntArray[1]*60)+timerIntArray[2])
    }
}




//MARK: - <#Title#>
extension MainViewController{
    func setButtonText(){
        if timerOn{
            startButton.setTitle("Pause", for: UIControl.State.normal)
        }
        else{
            startButton.setTitle("Start", for: UIControl.State.normal)
        }
    }
    
    func formatt(){
        startButton.layer.cornerRadius = 10.0
        timerLabel.layer.cornerRadius = 10.0
        timerLabel.layer.masksToBounds = true
        timerLabel.adjustsFontSizeToFitWidth = true
    }
    
    func getLabelText(_ timeArray:[Int]) -> String{
        var zeroArray = [":",":"]
        if timeArray[1] < 10 {
            zeroArray[0] = ":0"
        }
        if timeArray[2] < 10 {
            zeroArray[1] = ":0"
        }
        
        let labelText = String(timeArray[0]) + zeroArray[0] + String(timeArray[1]) + zeroArray[1] + String(timeArray[2])
        return labelText
    }
}



