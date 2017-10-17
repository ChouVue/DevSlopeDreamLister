//
//  Item+CoreDataClass.swift
//  DevSlopeDreamLister
//
//  Created by Chou Vue on 10/16/17.
//  Copyright © 2017 VUE. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject
{
    
    //Easy Quick Way To "TIME STAMP" Your Item
    public override func awakeFromInsert()
    {
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
    
    
}
