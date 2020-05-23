import UIKit
import PlaygroundSupport

public class StartViewController: UIViewController {
    
    let startButton = UIButton()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    public override func loadView() {
        super.loadView()
        
        let logoImageView = UIImageView()
        logoImageView.frame = CGRect(x: 143, y: 50, width: 447, height: 360)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "logo")
        
        view.addSubview(logoImageView)
        
        startButton.frame = CGRect(x: 294, y: 500, width: 146, height: 74)
        startButton.contentMode = .scaleAspectFit
        startButton.setTitle("startButton", for: .normal)
        startButton.setImage(UIImage(named: "startButton"), for: .normal)
        
        startButton.addTarget(self, action: #selector(startBuilding(_:)), for: .touchUpInside)
        
        view.addSubview(startButton)
    }
    
    @objc public func startBuilding(_ sender:UIButton){
        present(BuilderViewController(), animated: false, completion: nil)
    }

    public override func viewDidDisappear(_ animated: Bool) {
        for subview in view.subviews{
            subview.removeFromSuperview()
        }
    }
}

