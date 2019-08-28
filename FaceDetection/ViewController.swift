/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Contains the main app implementation using Vision.
*/

import UIKit
import AVKit
import Vision

class ViewController: UIViewController {


    @IBOutlet weak var captureImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let vc = CameraViewController(nibName: nil, bundle: nil)
        addChild(vc)
        
        //make sure that the child view controller's view is the right size
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        
        //you must call this at the end per Apple's documentation
        vc.didMove(toParent: self)
        
        vc.captureImage = {[weak self] image in
            
            // do what ever with the image
            self?.captureImageView.image = image
            vc.didMove(toParent: nil)
            vc.view.removeFromSuperview()
            vc.removeFromParent()
        }
    }

}
