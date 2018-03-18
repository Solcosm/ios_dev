//Single View Gradient Code
import UIKit

class ViewController06: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        let GradientTop = UIColor(red: 255/255, green: 180/255, blue: 179/255, alpha: 1.0)
        //let GradientBottom = UIColor.white.cgColor
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = view.frame
        gradient.colors = [GradientTop.cgColor, GradientTop.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
    }
}
