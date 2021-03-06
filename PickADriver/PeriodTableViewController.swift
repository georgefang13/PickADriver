//
//  PeriodTableViewController.swift
//  PickADriver
//
//  Created by George Fang on 3/31/21.
//

import UIKit

let savedNamesUserDefaultKey = "names"

class PeriodTableViewController: UITableViewController {

    var selectedPeriod = "0"
    
    var names: [String:[String]] = [:]
        
        //[["Period1", "Felix", "Steven", "Elvis", "Sam", "Nathan", "Toren", "George", "Aiden"], ["Period2","Felix", "Steven", "Elvis", "Sam", "Nathan", "Toren", "George", "Aiden"], ["Period3","Felix", "Steven", "Elvis", "Sam", "Nathan", "Toren", "George", "Aiden"], ["Period4","Felix", "Steven", "Elvis", "Sam", "Nathan", "Toren", "George", "Aiden"], ["Period5","Felix", "Steven", "Elvis", "Sam", "Nathan", "Toren", "George", "Aiden"], ["Period6","Felix", "Steven", "Elvis", "Sam", "Nathan", "Toren", "George", "Aiden"], ["Period7","Felix", "Steven", "Elvis", "Sam", "Nathan", "Toren", "George", "Aiden"], ["Period8","Felix", "Steven", "Elvis", "Sam", "Nathan", "Toren", "George", "Aiden"]]
    
    var selectedNames: [String] = [] //empty array of strings
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selectedPeriod = String(indexPath.row + 1)
        selectedNames = names[selectedPeriod] ?? [] //?? lets you put a default value, called the nil coalessing opperator
        performSegue(withIdentifier: "PeriodToNames", sender: nil) //row is selected, the segue is performed
        
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let namesTableVC = segue.destination as? NamesTableViewController {
            namesTableVC.names = selectedNames
            namesTableVC.period = selectedPeriod
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        if let  savedNames = UserDefaults.standard.value(forKey: savedNamesUserDefaultKey) as? [String:[String]]
        {
            names = savedNames
        }
        else
        {
            let empty: [String:[String]] = [:]
            UserDefaults.standard.set(empty, forKey: savedNamesUserDefaultKey)
        }
    }
    

}
