//
//  ViewController.swift
//  EurekaDropdown
//
//  Created by Awais Ansari on 12/09/17.
//  Copyright © 2017 Tagrem. All rights reserved.
//

import UIKit
import Eureka

class ViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAForm()
        
       var rect = self.tableView.frame
        rect.origin.y = 30
        self.tableView.frame = rect
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func createAForm()
    {
        form +++ AWSection("Personal Info").getSection(withTag: "Personal Info", tableView: self.tableView!, expanded: false)
            
            <<< TextRow(){ row in
                row.title = "First Name"
                row.value = "Awais"
                
            }
            <<< TextRow(){ row in
                row.title = "Last Name"
                row.value = "Ansari"
                
            }
        
            <<< EmailRow(){
                row in
                row.title = "Email"
                row.value = "awais@tagrem.com"
        }
        
         +++ AWSection().getSection(withTag: "Address", tableView: self.tableView!, expanded: true)
            
            <<< TextRow(){ row in
                row.title = "Address1"
                row.value = "205, Gloriya Apartments"
                
            }
            <<< TextRow(){ row in
                row.title = "Address2"
                row.value = "Shivaji Nagar"
                
            }
            
            <<< EmailRow(){
                row in
                row.title = "Address3"
                row.value = "Near Railway Station"
                
                
        }
            <<< TextRow(){ row in
                row.title = "City"
                row.value = "Pune"
                
        }
            <<< TextRow(){ row in
                row.title = "Country"
                row.value = "India"
                
        }



//DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(0), execute: {
//    self.tableView?.reloadData()

//})

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return AWSection.getCountForRowsinSection(form: form, section: section)
    }


}

