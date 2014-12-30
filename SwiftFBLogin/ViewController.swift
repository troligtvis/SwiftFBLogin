//
//  ViewController.swift
//  SwiftFBLogin
//
//  Created by Kj Drougge on 2014-12-30.
//  Copyright (c) 2014 kj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet var fbLoginView: FBLoginView!
    @IBOutlet var profilePictureView: FBProfilePictureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        self.profilePictureView.profileID = "ca.abernathy"
    }
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        println("Login")
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        println("Username: \(user.name)")
        self.profilePictureView.profileID = user.objectID
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        println("Logout")
        self.profilePictureView.profileID = nil
    }
    
    func loginView(loginView: FBLoginView!, handleError error: NSError!) {
        println("Error: \(error.localizedDescription)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

