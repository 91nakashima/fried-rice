import UIKit
import SwiftUI
import Capacitor

class MyViewController: CAPBridgeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func toNativePage () {
        //        let view = UIHostingController(rootView: Test())
        //        self.present(view, animated: true, completion: nil)
        
        let secondViewController: SecondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("secondVC") as! SecondViewController
        // アニメーションを設定する.
        //secondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        // 値渡ししたい時 hoge -> piyo
        //secondViewController.piyo = self.hoge
        // Viewの移動する.
        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
}
