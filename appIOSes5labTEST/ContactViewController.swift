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
import SAPCommon
import SAPOfflineOData

class ContactViewController: UIViewController, UITableViewDataSource, SAPFioriLoadingIndicator {
    
    // Fake pictures for contacts
    var men: [UIImage] = [#imageLiteral(resourceName: "man1"),#imageLiteral(resourceName: "man2"),#imageLiteral(resourceName: "man3"),#imageLiteral(resourceName: "man4"),#imageLiteral(resourceName: "man5"),#imageLiteral(resourceName: "man6"),#imageLiteral(resourceName: "man7"),#imageLiteral(resourceName: "man8"),#imageLiteral(resourceName: "man9"),#imageLiteral(resourceName: "man10"),#imageLiteral(resourceName: "man11"),#imageLiteral(resourceName: "man12"),#imageLiteral(resourceName: "man13"),#imageLiteral(resourceName: "man14"),#imageLiteral(resourceName: "man16"),#imageLiteral(resourceName: "man17")]
    var women:[UIImage] = [#imageLiteral(resourceName: "woman1"),#imageLiteral(resourceName: "woman2"),#imageLiteral(resourceName: "woman3"),#imageLiteral(resourceName: "woman4"),#imageLiteral(resourceName: "woman6"),#imageLiteral(resourceName: "woman7"),#imageLiteral(resourceName: "woman5"),#imageLiteral(resourceName: "woman8"),#imageLiteral(resourceName: "woman9"),#imageLiteral(resourceName: "woman10"),#imageLiteral(resourceName: "woman11"),#imageLiteral(resourceName: "woman12"),#imageLiteral(resourceName: "woman13"),#imageLiteral(resourceName: "woman14")]

    
    private let logger = Logger.shared(named: "ContactViewControllerLogger")
    var boolContactsfromBusinessPartner: Bool = false // to determine if the segue comes from PartnerViewController (by default set to false)
    @IBOutlet var tableView: UITableView!
    var receivedPartnerID: String?
    var receivedPartnerName: String?
    let activities = [FUIActivityItem.phone, FUIActivityItem.videoCall, FUIActivityItem.message, FUIActivityItem.email,
                      FUIActivityItem.detail]
    
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var gwsampleEntites: GWSAMPLEBASICEntities<OnlineODataProvider> {
        return self.appDelegate.gwsamplebasicEntities
    }
    private var gwsampleEntitesOffline: GWSAMPLEBASICEntities<OfflineODataProvider> {
        return self.appDelegate.gwsamplebasicEntitiesOffline
    }
    private var isStoreOpened = false

    var loadingIndicator: FUILoadingIndicatorView?
    private var contactSet: [Contact] = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 76
        tableView.register(FUIContactCell.self, forCellReuseIdentifier: FUIContactCell.reuseIdentifier)
        tableView.dataSource=self
        
        if(self.boolContactsfromBusinessPartner == false)
        {
            self.navigationItem.title="Contacts "
        }
        else{
            self.navigationItem.title="Contacts - \(receivedPartnerName ?? "")"
        }
        
        updateTable()
               
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactSet.count// return number of rows of data source
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactCell = tableView.dequeueReusableCell(withIdentifier: FUIContactCell.reuseIdentifier, for: indexPath)
            as! FUIContactCell
        
        let contact = self.contactSet[indexPath.row]
        
        contactCell.detailImage = imageContact(index: indexPath.row) // TODO: Replace with your Image
        contactCell.headlineText = "\(contact.firstName ?? "") \(contact.lastName ?? "")"
        contactCell.subheadlineText = contact.emailAddress
        
        contactCell.descriptionText = contact.title
        contactCell.splitPercent = CGFloat(0.75)
        contactCell.activityControl.addActivities(activities)
        contactCell.activityControl.maxVisibleItems = 3
        contactCell.onActivitySelectedHandler = { activityItem in
            FUIToastMessage.show(message: "Activity button was clicked",
                                 icon: FUIIconLibrary.system.information,
                                 inView: tableView)
        }
        
        return contactCell
    }
    
    func updateTable() {
        self.showFioriLoadingIndicator()
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                self.hideFioriLoadingIndicator()
            }
        })
    }
    
    private func loadData(completionHandler: @escaping () -> Void) {
        
        self.requestEntities { error in
            defer {
                completionHandler()
            }
            
            if let error = error {
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorLoadingData", value: "Loading data failed!", comment: "XTIT: Title of loading data error pop up."), message: error.localizedDescription, preferredStyle: .alert)
                
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            OperationQueue.main.addOperation({
                self.tableView.reloadData()
            })
        }
        
        
    }
    
    func requestEntities(completionHandler: @escaping (Error?) -> Void) {
        // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
        gwsampleEntitesOffline.open { error in
            guard error == nil else {
                return;
            }
            
            self.isStoreOpened = true
            
            self.gwsampleEntitesOffline.download { error in
                guard error == nil else {
                    var query = DataQuery().selectAll().top(20)
                    
                    if(self.boolContactsfromBusinessPartner == true)
                    {
                        query = DataQuery().selectAll().filter(Contact.businessPartnerID == self.receivedPartnerID!)
                    }
                    self.gwsampleEntitesOffline.fetchContactSet(matching: query) { contacts, error in
                        guard let contacts = contacts else {
                            completionHandler(error!)
                            self.closeOfflineStore()
                            return
                        }
                        self.contactSet = contacts
                        completionHandler(nil)
                        self.closeOfflineStore()
                    }
                    return
                }
                
                var query = DataQuery().selectAll().top(20)
                
                if(self.boolContactsfromBusinessPartner == true)
                {
                    query = DataQuery().selectAll().filter(Contact.businessPartnerID == self.receivedPartnerID!)
                }
                self.gwsampleEntitesOffline.fetchContactSet(matching: query) { contacts, error in
                    guard let contacts = contacts else {
                        completionHandler(error!)
                        self.closeOfflineStore()
                        return
                    }
                    self.contactSet = contacts
                    completionHandler(nil)
                    self.closeOfflineStore()
                }
            }
        }
    }
    
    func closeOfflineStore() {
        if isStoreOpened {
            do {
                try gwsampleEntitesOffline.close()
                isStoreOpened = false
            } catch {
                logger.error("Offline Store closing failed")
            }
        }
        logger.info("Offline Store closed")
    }
    
   /*
    func requestEntities(completionHandler: @escaping (Error?) -> Void) {
        
       
        
            // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
        
        
        var query = DataQuery().selectAll().top(20)
        
        if(self.boolContactsfromBusinessPartner == true)
        {
            query = DataQuery().selectAll().filter(Contact.businessPartnerID == self.receivedPartnerID!)
        }
        
        self.gwsampleEntites.fetchContactSet(matching: query)
        { contacts, error in
            guard let contacts = contacts else {
                completionHandler(error!)
                return
            }
            self.contactSet = contacts
            completionHandler(nil)
        }
        
        
    }
 */
    func imageContact(index: Int) -> UIImage? {
        if(self.contactSet[index].sex == "M")
        {
            return men[index % 16]
        }
        else{
            return women[index % 14]
        }
    }
    
    func setContactSet(contacts: [Contact])
    {
        self.contactSet = contacts
    }
    
    
}
