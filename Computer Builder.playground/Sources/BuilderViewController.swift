import UIKit
import SpriteKit
import PlaygroundSupport

public class BuilderViewController: UIViewController{
    
    let titleImageView: UIImageView = UIImageView()
    
    let nextButton: UIButton = UIButton()
    let doneButton: UIButton = UIButton()
    let resetButton: UIButton = UIButton()

    let leftButton: UIButton = UIButton()
    let rightButton: UIButton = UIButton()
        
    var computerSKView: SKView = SKView()
    var computerScene: ComputerScene = ComputerScene()
    
    var selectedImage :String = String()
    var selectedItemIndex = 1
    
    var computerStep = ComputerBuildingSteps.Case
    
    enum ComputerBuildingSteps {
        case Case
        case Motherboard
        case Cooler
        case RAM
        case Card
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    public override func loadView() {
        super.loadView()
        
        computerSKView.frame = CGRect(x: 0, y: 0, width: 734, height: 840)
        computerSKView.backgroundColor = .clear
        computerScene = ComputerScene()
        computerScene.backgroundColor = .clear
        computerSKView.preferredFramesPerSecond = 30
        computerSKView.presentScene(computerScene)
        view.addSubview(computerSKView)
        
        titleImageView.frame = CGRect(x: 207, y: 0, width: 320, height: 80)
        titleImageView.contentMode = .scaleAspectFit
        titleImageView.image = UIImage(named: "Title/case")
        
        nextButton.frame = CGRect(x: 532, y: 0, width: 200, height: 50)
        nextButton.contentMode = .scaleAspectFit
        nextButton.setImage(UIImage(named: "next"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextBuildStep), for: .touchUpInside)
        
        resetButton.frame = CGRect(x: 10, y: 0, width: 200, height: 50)
        resetButton.contentMode = .scaleAspectFit
        resetButton.setImage(UIImage(named: "reset"), for: .normal)
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        
        leftButton.frame = CGRect(x: 10, y: 410, width: 20, height: 20)
        leftButton.contentMode = .scaleAspectFit
        leftButton.setImage(UIImage(named: "left"), for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
        
        rightButton.frame = CGRect(x: 702, y: 410, width: 20, height: 20)
        rightButton.contentMode = .scaleAspectFit
        rightButton.setImage(UIImage(named: "right"), for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)

        view.addSubview(titleImageView)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(nextButton)
        view.addSubview(resetButton)
    }
    
    @objc public func resetButtonPressed(sender:UIButton){
        Narration.narrationSingleton.narrate(string: "No problem . Just start fresh !")

        present(StartViewController(), animated: false, completion: nil)
    }
    
    @objc public func doneButtonPressed(sender:UIButton){
        Narration.narrationSingleton.narrate(string: "Wow ! That build looks top notch !")
    }
    
    @objc public func leftButtonPressed(){
        if selectedItemIndex > 0 {
            selectedItemIndex -= 1
            computerScene.selectedItemIndex = self.selectedItemIndex
        }
    }
    
    @objc public func rightButtonPressed(){
        let limit : Int
        if computerStep == .Case {
            limit = 4
        }
        else if computerStep == .Motherboard {
            limit = 3
        }
        else if computerStep == .Cooler {
            limit = 1
        }
        else if computerStep == .RAM {
            limit = 2
        }
        else if computerStep == .Card {
            limit = 2
        }
        else {
            limit = 1
        }
        if selectedItemIndex < limit{
            selectedItemIndex += 1
            computerScene.selectedItemIndex = self.selectedItemIndex
        }
        
    }
    
    @objc public func nextBuildStep() {
        switch computerStep {
            
        case .Case:
            titleImageView.image = UIImage(named: "Title/motherboard")
            computerStep = .Motherboard
            
        case .Motherboard :
            titleImageView.image = UIImage(named: "Title/cooler")
            computerStep = .Cooler
            
        case .Cooler :
            titleImageView.image = UIImage(named: "Title/ram")
            computerStep = .RAM
            
        case .RAM :
            titleImageView.image = UIImage(named: "Title/card")
            computerStep = .Card
            
        case .Card :
            titleImageView.image = UIImage(named: "Title/final")
            nextButton.removeFromSuperview()
            leftButton.removeFromSuperview()
            rightButton.removeFromSuperview()
            
            doneButton.frame = CGRect(x: 532, y: 0, width: 200, height: 50)
            doneButton.contentMode = .scaleAspectFit
            doneButton.setImage(UIImage(named: "done"), for: .normal)
            doneButton.addTarget(self, action: #selector(doneButtonPressed(sender:)), for: .touchUpInside)
            
            view.addSubview(doneButton)
        }
        
        selectedItemIndex = 1
        computerScene.next()
        
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        for subview in view.subviews{
            subview.removeFromSuperview()
        }
        
    }
    
}





