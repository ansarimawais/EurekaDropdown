# EurekaDropdown
![stack Overflow](http://linklyapps.in/images/eureka.gif)

Allows to expand and collapse sections of Eureka forms

just drag and drop the AWSection.swift in your project and call below 


       
       +++ AWSection().getSection(withTag: "Address", tableView: self.tableView!, expanded: true)
       
       and implement below UITableViewDelegate function in your class
       
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return AWSection.getCountForRowsinSection(form: form, section: section)
    }
    
    
    for up and down images drag and drop in your Asset. Done

