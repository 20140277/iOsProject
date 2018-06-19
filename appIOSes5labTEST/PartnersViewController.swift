//
//  ProductDetailViewController.swift
//  appIOSes5labTEST
//
//  Created by Guillaume Henique on 12/06/2018.
//  Copyright © 2018 SAP. All rights reserved.
//


import SAPFiori
import SAPOData
import Foundation
import UIKit
import SAPOfflineOData
import SAPCommon


class PartnersViewController: UIViewController, UITableViewDataSource, SAPFioriLoadingIndicator {
    
    private let logger = Logger.shared(named: "PartnersViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var indexBusinessPartnerToShow: Int?
    @IBOutlet var tableView: UITableView!
    let objectCellId = "PartnerCellID"
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var gwsampleEntites: GWSAMPLEBASICEntities<OnlineODataProvider> {
        return self.appDelegate.gwsamplebasicEntities
    }
    private var gwsampleEntitesOffline: GWSAMPLEBASICEntities<OfflineODataProvider> {
        return self.appDelegate.gwsamplebasicEntitiesOffline
    }
    private var isStoreOpened = false

    private var businessPartnerSet: [BusinessPartner] = [BusinessPartner]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title="Partners"
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: objectCellId)
        tableView.dataSource=self
        updateTable()
        
    }
    
    // Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businessPartnerSet.count // return number of rows of data source
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objectCell = tableView.dequeueReusableCell(withIdentifier: objectCellId,
                                                       for: indexPath as IndexPath) as! FUIObjectTableViewCell
        let businessPartner = self.businessPartnerSet[indexPath.row]
 
       
        objectCell.subheadlineText = "\(businessPartner.companyName ?? "")"
        objectCell.footnoteText = "\(businessPartner.webAddress ?? "")"
        objectCell.descriptionText = "\(businessPartner.address?.city ?? "") - \(businessPartner.address?.country ?? "")"
     //   objectCell.detailImage =  HelperImages.imageFromCategory(category: businessPartner.category!) // TODO: Replace with your image
        //   objectCell.detailImage?.accessibilityIdentifier = ""
      //  let price: String = "\(product.price!.toString() ) EUR"
        objectCell.statusImage = FUIIconLibrary.system.me.withRenderingMode(.alwaysTemplate)
        objectCell.accessoryType = .disclosureIndicator
        objectCell.splitPercent = CGFloat(0.45)
       let tap = UITapGestureRecognizerCustom(target: self, action: #selector(self.handleKpiTap(_:)))
        objectCell.addGestureRecognizer(tap)
        tap.index = indexPath.row
        return objectCell
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
                    let query = DataQuery().selectAll().orderBy(BusinessPartner.businessPartnerID, SAPOData.SortOrder.ascending).top(20)
                    self.gwsampleEntitesOffline.fetchBusinessPartnerSet(matching: query) { partners, error in
                        guard let partners = partners else {
                            completionHandler(error!)
                            self.closeOfflineStore()
                            return
                        }
                        self.businessPartnerSet = partners
                        completionHandler(nil)
                        self.closeOfflineStore()
                    }
                    return
                }
                
                let query = DataQuery().selectAll().orderBy(BusinessPartner.businessPartnerID, SAPOData.SortOrder.ascending).top(20)
                self.gwsampleEntitesOffline.fetchBusinessPartnerSet(matching: query) { partners, error in
                    guard let partners = partners else {
                        completionHandler(error!)
                        self.closeOfflineStore()
                        return
                    }
                    self.businessPartnerSet = partners
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
        let query = DataQuery().selectAll().orderBy(BusinessPartner.businessPartnerID, SAPOData.SortOrder.ascending).top(20)
        self.gwsampleEntites.fetchBusinessPartnerSet(matching: query)
        { businessPartners, error in
            guard let businessPartners = businessPartners else {
                completionHandler(error!)
                return
            }
            self.businessPartnerSet = businessPartners
            completionHandler(nil)
        }
    }
 */
    @objc func handleKpiTap(_ sender:UITapGestureRecognizerCustom) {
        indexBusinessPartnerToShow = sender.index
        self.performSegue(withIdentifier: "showContactsOfBusinessPartner", sender: nil)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showContactsOfBusinessPartner" {
            if let contactViewController = segue.destination as? ContactViewController{
                contactViewController.boolContactsfromBusinessPartner = true
                contactViewController.receivedPartnerID = self.businessPartnerSet [self.indexBusinessPartnerToShow!].businessPartnerID
                contactViewController.receivedPartnerName = self.businessPartnerSet [self.indexBusinessPartnerToShow!].companyName
              
                
            }
            
        }
    }
    
}




