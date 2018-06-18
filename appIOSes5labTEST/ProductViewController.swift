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

class ProductViewController: UIViewController, UITableViewDataSource, SAPFioriLoadingIndicator {
    
  //  var tabTransition:[Int] = [Int]()
    var loadingIndicator: FUILoadingIndicatorView?
    var indexProductToShow: Int?
    @IBOutlet var tableView: UITableView!
    let objectCellId = "ProductCellID"
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var gwsampleEntites: GWSAMPLEBASICEntities<OnlineODataProvider> {
        return self.appDelegate.gwsamplebasicEntities
    }
    private var productSet: [Product] = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title="Products"
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
        objectCell.detailImage = HelperImages.imageFromCategory(category: product.category!) // TODO: Replace with your image
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
    
}





