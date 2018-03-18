import UIKit

class ViewController: UIViewController {
    //START
    //Switchers
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var yellowView: UIView!
    //Track which side the view is on AND transitions
    var switchedView = false
    @IBAction func switchView(_ sender: UIBarButtonItem)
    {
        switchedView = !switchedView
        let fromView = switchedView ? blueView : yellowView
        let toView = switchedView ? yellowView : blueView
        UIView.transition(from: fromView!, to: toView!, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews])
    }
    //Buttons
    //Blue
    @IBAction func PressMeButton(_ sender: Any)
    {
        //BlueAlert
        let alert = UIAlertController(title: "Blue View Button Pressed", message: "You pressed the button on the blue view", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yep, I did.", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true)
    }
    //Yellow
    @IBAction func PressMeTooButton(_ sender: Any)
    {
        //YellowAlert
        let alert2 = UIAlertController(title: "Yellow View Button Pressed", message: "You pressed the button on the yellow view", preferredStyle: UIAlertControllerStyle.alert)
        alert2.addAction(UIAlertAction(title: "Yep, I did.", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert2, animated: true)
    }
    //END
}
