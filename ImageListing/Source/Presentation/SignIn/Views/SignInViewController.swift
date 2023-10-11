//
//  ViewController.swift
//  ImageListing
//
//  Created by Hieu Tran Trung on 11/10/2023.
//

import UIKit
import RxSwift
import RxCocoa

class SignInViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnSignIn: UIButton!
    
    @IBOutlet weak var lblErrorMessage: UILabel!
    
    ///
    ///
    ///
    var viewModel: SignInViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set delegate
        tfEmail.delegate = self
        tfPassword.delegate = self
        
        //init viewmodel
        viewModel = SignInViewModel()
        
        //  subscribe result of variable isValid in ViewModel then handle button login is enable or not?
        _ = viewModel.isValid.subscribe({ [weak self] isValid in
            guard let strongSelf = self, let isValid = isValid.element else { return }
            strongSelf.btnSignIn.isEnabled = isValid
            strongSelf.btnSignIn.backgroundColor = isValid ? UIColor.red : UIColor.gray
        })
    }

    @IBAction func onTapSignIn(_ sender: Any) {
        let myViewController = ImageListingViewController()
        
        navigationController?.pushViewController(myViewController, animated: true)
    }
    
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch tfEmail {
        case self.tfEmail:
            self.viewModel.isValidUsername.subscribe({ [weak self] isValid in
                self?.lblErrorMessage.text = isValid.element! ? "Valid username" : "Invalid email"
            }).disposed(by: disposeBag)
        case self.tfPassword:
            viewModel.isValidPassword.subscribe({ [weak self] isValid in
                self?.lblErrorMessage.text = isValid.element! ? "Valid password" : "Invalid password"
            }).disposed(by: disposeBag)
        default:
            return
        }
    }
}
