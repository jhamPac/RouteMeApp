//
//  ViewController.swift
//  ClientSide
//
//  Created by Ace_Rimmer on 4/20/16.
//  Copyright © 2016 Ace_Rimmer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var currentLocationField: UITextField!
    @IBOutlet weak var destinationLocationField: UITextField!
    
    @IBOutlet var textfields: [UITextField]!
    
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    @IBAction func sendRequest(sender: UIButton)
    {
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        for textfield in textfields
        {
            textfield.delegate = self
        }
        
        submitButton.layer.cornerRadius = submitButton.frame.size.width / 2
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField)
    {
        animateViewMoving(true, moveValue: 75)
    }
    func textFieldDidEndEditing(textField: UITextField)
    {
        animateViewMoving(false, moveValue: 75)
    }
    
    func animateViewMoving (up: Bool, moveValue : CGFloat)
    {
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = up ? -moveValue : moveValue
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
}

