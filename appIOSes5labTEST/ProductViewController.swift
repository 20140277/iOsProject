//
//  ProductViewController.swift
//  appIOSes5labTEST
//
//  Created by Guillaume Henique on 11/06/2018.
//  Copyright © 2018 SAP. All rights reserved.
//

//  SAP Fiori for iOS Mentor
//  SAP Cloud Platform SDK for iOS Code Example
//  Object Cell
//  Copyright © 2018 SAP SE or an SAP affiliate company. All rights reserved.


import SAPFiori
import SAPOData
import Foundation
import SAPOfflineOData

import SAPCommon


class ProductViewController: UIViewController, UITableViewDataSource, SAPFioriLoadingIndicator {
    
    //let scanButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.camera, target: self, action: #selector(pushScanner(_:)))
    var loadingIndicator: FUILoadingIndicatorView?
    private let logger = Logger.shared(named: "ProductViewControllerLogger")
    var indexProductToShow: Int?
    @IBOutlet var tableView: UITableView!
    let objectCellId = "ProductCellID"
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var gwsampleEntites: GWSAMPLEBASICEntities<OnlineODataProvider> {
        return self.appDelegate.gwsamplebasicEntities
    }
    private var gwsampleEntitesOffline: GWSAMPLEBASICEntities<OfflineODataProvider> {
        return self.appDelegate.gwsamplebasicEntitiesOffline
    }
    private var isStoreOpened = false

    private var productSet: [Product] = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title="Products"
        
        //self.navigationItem.rightBarButtonItem = scanButton
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: objectCellId)
        tableView.dataSource=self
        updateTable()
        
    }
    
    // Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productSet.count // return number of rows of data source
    }
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.indexProductToShow = indexPath.row
            self.performSegue(withIdentifier: "showProductDetail", sender: nil)
        }
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objectCell = tableView.dequeueReusableCell(withIdentifier: objectCellId,
                                                       for: indexPath as IndexPath) as! FUIObjectTableViewCell
        let product = self.productSet[indexPath.row]
        
       // objectCell.headlineText = "\(product.entityType ?? "")"
        objectCell.subheadlineText = "\(product.name ?? "")"
        objectCell.footnoteText = "\(product.category ?? "")"
        objectCell.descriptionText = "\(product.description ?? "")"
        // heobjectCell.detailImage = HelperImages.imageFromCategory(category: product.category!) // TODO: Replace with your image
     //   objectCell.detailImage?.accessibilityIdentifier = ""
        let price: String = "\(product.price!.toString() ) EUR"
        objectCell.statusText = price
        objectCell.accessoryType = .disclosureIndicator
        objectCell.splitPercent = CGFloat(0.3)
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
                    let query = DataQuery().selectAll().orderBy(Product.supplierID, SAPOData.SortOrder.ascending).top(20)
                    self.gwsampleEntitesOffline.fetchProductSet(matching: query) { products, error in
                        guard let products = products else {
                            completionHandler(error!)
                            self.closeOfflineStore()
                            return
                        }
                        self.productSet = products
                        completionHandler(nil)
                        self.closeOfflineStore()
                    }
                    return
                }
                
                let query = DataQuery().selectAll().orderBy(Product.supplierID, SAPOData.SortOrder.ascending).top(20)
                self.gwsampleEntites.fetchProductSet(matching: query) { products, error in
                    guard let products = products else {
                        completionHandler(error!)
                        self.closeOfflineStore()
                        return
                    }
                    self.productSet = products
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
        let query = DataQuery().selectAll().orderBy(Product.supplierID, SAPOData.SortOrder.ascending).top(20)
        self.gwsampleEntites.fetchProductSet(matching: query)
        { products, error in
            guard let products = products else {
                completionHandler(error!)
                return
            }
            self.productSet = products
            completionHandler(nil)
        }
    }
*/
   @objc func handleKpiTap(_ sender:UITapGestureRecognizerCustom) {
        indexProductToShow = sender.index
        self.performSegue(withIdentifier: "showProductDetails", sender: nil)
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetails" {
            if let productDetailViewController = segue.destination as? DetailProductViewController{
                productDetailViewController.currentIndex = self.indexProductToShow
                productDetailViewController.setProductSet(products: self.productSet)
           
            }
    
        }
    }
/*
        ///////////////////////////////////////////////////////////////////////////////////
//QR Code
   ///////////////////////////////////////////////////////////////////////////////////
    func barcodeScanViewController(_ barcodeScanViewController: FUIBarcodeScanViewController, didReceiveScanResult scanResult: FUIBarcodeScanResult?) {
        print("scan result: \(String(describing: scanResult?.scanResultString))")
        
        
        if let scanRes = scanResult?.scanResultString {
            if let scanDict = convertToDictionary(text: scanRes) {
                //Here, we have a dict that we got from our JSON QR Code
                //We expect it to be {"proxyClasses":"id"}
                //Example : {"Product":"id"}
                //Try to use the CollectionType enum ?
                let pKey = scanDict.first?.key ?? "empty"
                switch pKey {
                case "Product":
                    let scanEntityId = scanDict.first?.value ?? ""//This is a string
                    
                    if let found = self.productSet.first(where: {$0.productID == scanEntityId}) {
                        FUIToastMessage.show(message: "Success, loading product : \(scanEntityId)", withDuration: 1)
                        barcodeScanViewController.dismiss(animated: true, completion: nil)
                        var indexFound: Int = 0
                        while found != productSet[indexFound]
                        {
                            indexFound = indexFound+1
                        }
                        self.indexProductToShow = indexFound
                        self.performSegue(withIdentifier: "showProductDetails", sender: nil)
                    } else {
                        FUIToastMessage.show(message: "Product ID : \(scanEntityId) not found in catalog", withDuration: 3)
                    }
               /* case "SalesOrder":
                    let scanEntityId = scanDict.first?.value ?? ""//This is a string
                    
                    if let found = self.salesOrderSet.first(where: {$0.salesOrderID == scanEntityId}) {
                        FUIToastMessage.show(message: "Success, loading sales order : \(scanEntityId)", withDuration: 1)
                        barcodeScanViewController.dismiss(animated: true, completion: nil)
                        self.facture = found
                        self.performSegue(withIdentifier: "salesOrderDetailSegue", sender: nil)
                    } else {
                        FUIToastMessage.show(message: "Sales Order ID : \(scanEntityId) not found in catalog", withDuration: 3)
                    }
             */ default:
                    FUIToastMessage.show(message: "\(pKey) n'est pas une catégorie valide", withDuration: 3)
                }
            }
            else {
                FUIToastMessage.show(message: "Wrong QR format : {\"Product\":\"id\"} ", withDuration: 3)
            }
        }
        else {
            FUIToastMessage.show(message: "Wrong QR format : {\"Product\":\"id\"} ", withDuration: 3)        }
        
    }
    
    //https://stackoverflow.com/questions/30480672/how-to-convert-a-json-string-to-a-dictionary
    func convertToDictionary(text: String) -> [String: String]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: String]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
    // MARK: - SCANNER
    @objc func pushScanner(_ sender: UITapGestureRecognizer) {
        
        // https://experience.sap.com/fiori-design-ios/article/scan-view/
        
        //self.productToShow = self.productSet[0]
        //self.performSegue(withIdentifier: "productSegue", sender: nil)
        
        
        let scanViewController = FUIBarcodeScanViewController.createInstanceFromStoryboard()
        
        //        scanViewController.barcodeScanner.scanMode = .qr
        //        scanViewController.barcodeScanner.indicatorBorderColor = UIColor.red.cgColor
        //        scanViewController.barcodeScanner.indicatorBorderWidth = 20
        //        scanViewController.barcodeScanner.promptMessage = "Scan A QR Code"
        //        scanViewController.barcodeScanner.scanResultTransformer = { s in
        //            return "transformed"
        //        }
        scanViewController.delegate = self
        
        let navController = UINavigationController(rootViewController: scanViewController)
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    
   
    ///////////////////////////////////////////////////////////////////////////////////
    //QR Code
    ///////////////////////////////////////////////////////////////////////////////////
    
    
    
    
  */
    
    
    
}





