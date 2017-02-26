//
//  ViewController.swift
//  Locus
//
//  Created by Vivek Mahendra on 2/25/17.
//  Copyright © 2017 Vivek Mahendra. All rights reserved.
//

import UIKit
import Google

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var error: NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil{
            print(error)
            return
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil{
            print(error)
            return
        }
        print(user.profile.email)
        print(user.profile.familyName)
        print(user.profile.name)
        
    }


}

