//
//  CardsViewController.swift
//  Codepath-Lab9-Tinder
//
//  Created by Diana C on 4/4/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet weak var profileCardView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onImagePan(_ sender: Any) {
        let location = (sender as AnyObject).location(in: view)
        let translation = (sender as AnyObject).translation(in: view)
        
        if ((sender as AnyObject).state == .began) {
            cardInitialCenter = profileCardView.center
        } else if ((sender as AnyObject).state == .changed) {
            profileCardView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            if ((translation.x > 0 && location.y < cardInitialCenter.y) || (translation.x < 0 && location.y > cardInitialCenter.y)) {
                profileCardView.transform = profileCardView.transform.rotated(by: CGFloat(0.25 * M_PI / 180))
            } else {
                profileCardView.transform = profileCardView.transform.rotated(by: CGFloat(-0.25 * M_PI / 180))
            }
        } else if ((sender as AnyObject).state == .ended) {
            print(translation.x)
            if (translation.x > 50) {
                profileCardView.center = CGPoint(x: view.bounds.maxX + profileCardView.bounds.width, y: cardInitialCenter.y)
            } else if (translation.x < -50) {
                profileCardView.center = CGPoint(x: -(profileCardView.bounds.width), y: cardInitialCenter.y)
            } else {
                profileCardView.transform = CGAffineTransform.identity
                profileCardView.center = CGPoint(x: cardInitialCenter.x, y: cardInitialCenter.y)
            }
        }
    }
    
    @IBAction func onImageTap(_ sender: Any) {
        self.performSegue(withIdentifier: "profileDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileViewController = segue.destination as! ProfileViewController
        profileViewController.image = profileCardView.image
    }
}
