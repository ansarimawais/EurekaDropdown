//
//  AWSection.swift
//  Indition CRM
//
//  Created by Awais Ansari on 22/08/17.
//  Copyright © 2017 Tagrem. All rights reserved.
//

import UIKit
import Eureka

class AWSection: Section {

    var tableView:UITableView?
    var isExpanded = false
    var imageView:UIImageView!

    func getSection(withTag tag: String, tableView:UITableView, expanded:Bool) -> Section
    {
        print("tagggggg \(String(describing: self.tag)) ")
        
        self.tableView = tableView
        
            self.header = {
                
                let width = tableView.frame.size.width
                
                var header = HeaderFooterView<UIView>(.callback({ view1 in
                    let mview = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 30))
                    mview.backgroundColor = .clear
                    
                    self.tableView = tableView
                   
                    let view = UIButton()

                    
                    if expanded
                    {
                        self.imageView = UIImageView(image: #imageLiteral(resourceName: "downArrow"))
                        view.isSelected = true
                        
                    }
                    else
                    {
                        self.imageView = UIImageView(image: #imageLiteral(resourceName: "rightArrow"))
                        view.isSelected = false
                        
                    }

                    self.imageView.frame = CGRect(x: width - 15 - 10, y: 30/2-15/2, width: 15, height: 15)

                    self.imageView.contentMode = .scaleAspectFit
                    view.isSelected = expanded
                    self.isExpanded = expanded
                    view.accessibilityHint = "\(String(describing: self.form?.index(of: self)!))"

                    view.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
                    let label = UILabel(frame: CGRect(x: 10, y: 0, width: (width), height: 30))
                    label.textColor = .lightGray
                    label.text = tag
                    label.backgroundColor = .clear
                    self.header?.title = tag
                    self.tag = tag
//                    self.isExpanded = isExpanded
                    
                    view.addTarget(self, action: #selector(self.expandOrCollapse(_:)), for: .touchUpInside)
                    view.addSubview(label)
                    
                    view.addSubview(self.imageView)

                    tableView.reloadData()
                    return view
                }))
                header.height = { 30 }
                return header
            }()
        
        return self
    }
    
    
    @objc func expandOrCollapse(_ button:UIButton)
    {
        button.isSelected = !button.isSelected
        
        self.isExpanded  = button.isSelected
        

        imageView.image = nil

        UIView.performWithoutAnimation {
            
            self.tableView?.reloadSections(IndexSet(integer: (self.index)!), with: .automatic)

            if !button.isSelected
            {
                imageView.image = #imageLiteral(resourceName: "rightArrow")
            }
            else
            {
                imageView.image = #imageLiteral(resourceName: "downArrow")
            }
            
        }
        
    }
    
    class func getCountForRowsinSection(form:Form, section:Int) -> Int
    {        
        for sect in form.allSections
        {
            if sect.index == section
            { 
                if sect is AWSection
                {
                    if (sect as! AWSection).isExpanded
                    {
                        return sect.count
                    }
                    else
                    {
                        return 0
                    }
                }
                return sect.count
            }
        }
        return 0
    }
}
