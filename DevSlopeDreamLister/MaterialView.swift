//
//  MaterialView.swift
//  DevSlopeDreamLister
//
//  Created by Chou Vue on 10/17/17.
//  Copyright © 2017 VUE. All rights reserved.
//

import UIKit

//As a Bool you can not add it inside so you will have to add it outside here
//Initializing it as "FALSE" so that by "DEFAULT" it won`t be selecting the "MATERIAL DESIGN OPTION" for this
private var materialKey = false

//Making this an "EXTENSION" instead of a "CLASS"
//This make it that anything that inherit from UIView, you will also have the ability to add the styling you wish to add.
extension UIView
{
    //This is a toggling or an option or something that we can select inside of storyboard
    //Setting this as a "BOOL" so that the user can select whether or not to be using "THIS MATERIAL DESIGN"
    @IBInspectable var materialDesign: Bool
    {
        //Getters Syntax
        get
        {
            //This will get "AFTER" the "SETTER SYNTAX" have run
            return materialKey
        }
        //Setter Syntax
        set
        {
            //This will set the current vaule (materialkey) be whatever the user set as the new value
            materialKey = newValue
            
            if materialKey
            {
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 3.0
                self.layer.shadowOpacity = 0.8
                self.layer.shadowRadius = 3.0
                self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                self.layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).cgColor
            }
            else
            {
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = nil
            }
        }
    }
}
