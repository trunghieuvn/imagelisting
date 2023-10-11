//
//  ViewController.swift
//  ImageListing
//
//  Created by Hieu Tran Trung on 11/10/2023.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTapSignIn(_ sender: Any) {
        let myViewController = ImageListingViewController()
        
        navigationController?.pushViewController(myViewController, animated: true)
    }
    
}

