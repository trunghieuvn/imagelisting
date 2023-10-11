//
//  SignInViewModel.swift
//  ImageListing
//
//  Created by Hieu Tran Trung on 11/10/2023.
//

import Foundation
import RxSwift
import RxCocoa

class SignInViewModel {
     var usernameText = BehaviorSubject<String>(value: "")
     var passwordText = BehaviorSubject<String>(value: "")
     
     var isValidUsername: Observable<Bool> {
         return self.usernameText.asObservable().map { username in
             username.count >= 6
         }
     }
     
     var isValidPassword: Observable<Bool> {
         return self.passwordText.asObservable().map {
             password in
             password.count >= 6
         }
     }
     
     var isValid: Observable<Bool> {
         return Observable.combineLatest(isValidUsername, isValidPassword) {$0 && $1}
     }
}
