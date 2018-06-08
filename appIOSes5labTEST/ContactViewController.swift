//  Parts created by SAP Fiori for iOS Mentor
//  ContactViewController.swift
//  appIOSes5labTEST
//
//  Created by Guillaume Henique on 07/06/2018.
//  Copyright © 2018 SAP. All rights reserved.
//

import SAPFiori
import SAPOData
import Foundation

class ContactViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    let activities = [FUIActivityItem.phone, FUIActivityItem.videoCall, FUIActivityItem.message, FUIActivityItem.email,
                      FUIActivityItem.detail]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title="Contacts"
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 76
        tableView.register(FUIContactCell.self, forCellReuseIdentifier: FUIContactCell.reuseIdentifier)
        tableView.dataSource=self
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // return number of rows of data source
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactCell = tableView.dequeueReusableCell(withIdentifier: FUIContactCell.reuseIdentifier, for: indexPath)
            as! FUIContactCell
        
        contactCell.detailImage = UIImage() // TODO: Replace with your Image
        contactCell.headlineText = "Michael Krenkler"
        contactCell.subheadlineText = "Offense Player"
        contactCell.descriptionText = "Tiffany Road\nAntioch, Illinois,60002\n+1 224 9211250"
        contactCell.splitPercent = CGFloat(0.3)
        contactCell.activityControl.addActivities(activities)
        contactCell.activityControl.maxVisibleItems = 3
        contactCell.onActivitySelectedHandler = { activityItem in
            FUIToastMessage.show(message: "Activity button was clicked",
                                 icon: FUIIconLibrary.system.information,
                                 inView: tableView)
        }
        
        return contactCell
    }
}
