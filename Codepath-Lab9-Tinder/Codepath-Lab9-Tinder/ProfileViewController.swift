//
//  ProfileViewController.swift
//  Codepath-Lab9-Tinder
//
//  Created by Diana C on 4/4/17.
//  Copyright © 2017 Diana C. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var profilePicView: UIImageView!
    @IBOutlet weak var navbarImageView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePicView.image = image
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.onTap))
        navbarImageView.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNavbarTap(_ sender: Any) {
        self.dismiss(animated: true) { 
            print("dismissed")
        }
    }
    
    func onTap() {
        self.dismiss(animated: true) { 
            print("dismissed")
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
