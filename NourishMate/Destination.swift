//
//  Destination.swift
//  NourishMate
//
//  Created by Rishaan Jain on 5/25/24.
//

import UIKit

class Destination: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var Gradelabel: UILabel!
    var ImageFromOg: UIImage?
    
    var Carbs: String?
    var Sugar: String?
    var overall: String?
    var Protein: String?
    var Fat: String?
    func randomLetter() -> String {
        let letters = ["A", "B", "C", "D"]
        let randomIndex = Int(arc4random_uniform(UInt32(letters.count)))
        return letters[randomIndex]
    }

    
    
    @IBOutlet weak var totalGradee: UIImageView!
    @IBOutlet weak var totalGrade: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToShow = ImageFromOg {
            imageView.image = imageToShow
        }
        var randomGrade = randomLetter()
        if randomGrade == "A"{
            totalGradee.image = UIImage(named: "Image 1")
        }
        if randomGrade == "B"{
            totalGradee.image = UIImage(named: "Image 1")
        }
        
        if randomGrade == "C"{
            totalGradee.image = UIImage(named: "Image 2")
        }
        if randomGrade == "D"{
            totalGradee.image = UIImage(named: "Image 2")
        }
        Gradelabel.text = randomLetter()
        
    }
}
