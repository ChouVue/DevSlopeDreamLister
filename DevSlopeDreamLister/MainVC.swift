//
//  MainVC.swift
//  DevSlopeDreamLister
//
//  Created by Chou Vue on 10/16/17.
//  Copyright © 2017 VUE. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate
{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 0
    }
    
    func attemptFetch()
    {
        //Creating Fetch Request variable
                                        //Here we are telling it what we are going to be fetching
                                                //Here we are telling it what to go fetch
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        
        //This is to help sort Item out
                                            //"created" is from our time stamp from our data model from "Item"
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
    
        //This will expect an array because you can have more than 1
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        //Fetch result can fail, so do a Do and Catch syntax incase
        do
        {
            try controller.performFetch()
        }
        catch
        {
            let error = error as NSError
            print("\(error)")
        }
    }

    //This method here is for when the table view is about to update,
    //This will start to listen for changes and will handle that for you
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
        tableView.beginUpdates()
    }
    
    //This func is for: When the content has been change....(do this)
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
        tableView.endUpdates()
    }
    
    //This is for when were gonna be making change, whether its "insertion", "deletion", or "modification"
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    {
        //Switching the type of "for type: NSFetchedResultsChangeType"
        switch(type)
        {
            //Adding a new one, so it should equal a new variable
            case.insert:
                if let indexPath = newIndexPath
                {
                    tableView.insertRows(at: [indexPath], with: .fade)
                }
                break
            //Deleting an existing one, so it should equal it self
            case.delete:
                if let indexPath = indexPath
                {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                break
            //Updating an existing path so equal to it self
            case.update:
                if let indexPath = indexPath
                {
                    let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                    //Update the cell data
                }
                break
            //1.) Deleting it out of it current place
            //2.) Then insert it to it new place
            case.move:
                if let indexPath = indexPath
                {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                if let indexPath = newIndexPath
                {
                    tableView.insertRows(at: [indexPath], with: .fade)
                }
                break
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

