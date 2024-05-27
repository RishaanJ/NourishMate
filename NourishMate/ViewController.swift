//
//  ViewController.swift
//  NourishMate
//
//  Created by Rishaan Jain on 5/25/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CamButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    var capturedImage: UIImage?

    
    

    @IBOutlet weak var frame2: UIView!
    @IBOutlet weak var frame: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CamButton.layer.cornerRadius = 0.5 * CamButton.bounds.size.width
        CamButton.clipsToBounds = true
        
        frame.layer.cornerRadius = 10
        frame2.layer.cornerRadius = 10
    
    }

    @IBAction func cameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
        HapticsManager.shared.vibrate(for: .warning)
    }

    @IBAction func badgeBtn(_ sender: Any) {
        HapticsManager.shared.vibrate(for: .warning)
    }
    
    @IBAction func homeBtn(_ sender: Any) {
        HapticsManager.shared.vibrate(for: .warning)
    }
    
    
    @IBAction func ReadMore1Clicked(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://www.health.harvard.edu/diseases-and-conditions/healthy-eating-for-blood-sugar-control")! as URL)
    }
    
    @IBAction func ReadMore2Clicked(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "https://www.health.harvard.edu/mind-and-mood/probiotics-may-help-boost-mood-and-cognitive-function")! as URL)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CameraSegue",
           let destinationVC = segue.destination as? Destination {
            destinationVC.ImageFromOg = capturedImage
        }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        capturedImage = image
        performSegue(withIdentifier: "CameraSegue", sender: self)
    }
    

}
