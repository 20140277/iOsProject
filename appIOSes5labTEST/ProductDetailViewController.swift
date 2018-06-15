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


class ProductDetailViewController: UIViewController, SAPFioriLoadingIndicator {
    

    
    @IBOutlet weak var myImageView: FUIImageView!

    
    @IBOutlet weak var myTableView: UITableView!
    var loadingIndicator: FUILoadingIndicatorView?
    var currentValue : String?
    var objectHeader: FUIObjectHeader!
    private var productSet: [Product] = [Product]()
    var currentIndex : Int?
   
    @IBOutlet var myDetailView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.register(FUIObjectTableViewCell.self, forCellReuseIdentifier: FUIObjectTableViewCell.reuseIdentifier)
        
        objectHeader = FUIObjectHeader()
        myTableView.tableHeaderView = objectHeader
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.separatorStyle = .none
        myDetailView.isUserInteractionEnabled = true
        //Swipe recognition
        ////////////////////////
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        myDetailView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        myDetailView.addGestureRecognizer(swipeLeft)
        ////////////////////////
        
        updateView()
    }
    
    @objc func swipeGesture(sender: UISwipeGestureRecognizer){
        if let swipeGesture = sender as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.right:
                self.currentIndex = self.currentIndex! - 1
                if(self.currentIndex! < 0)
                {
                    self.currentIndex = (productSet.count - 1)
                }
                updateView()
            case UISwipeGestureRecognizerDirection.left:
                self.currentIndex = ((self.currentIndex! + 1)%productSet.count)
                updateView()
            default:
                break
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // return number of rows of data source
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    func updateView(){
        
        myTableView.rowHeight = UITableViewAutomaticDimension
        self.navigationItem.title = "Product Detail   \(currentIndex! + 1) / \(productSet.count) "
        let product = productSet[currentIndex!]
        
        if let objectHeader = myTableView.tableHeaderView as? FUIObjectHeader{
            objectHeader.headlineText = "\(product.name ?? "")"
            objectHeader.subheadlineText = "\(product.category!)"
            
            
            objectHeader.tags = [FUITag(title: "Entity"),FUITag(title: "Product")]
            objectHeader.bodyText = "\(product.description ?? "")"
            objectHeader.bodyLabel.numberOfLines = 7
            
            objectHeader.statusText = "\(product.price!.toString() ) EUR"
            
       //   myImageView.image = resizeImage(image: HelperImages.imageFromCategory(category: "\(product.category ?? "")")!,newHeight:350)
        
            
            
        }
        
    }
    
    func resizeImage(image: UIImage, newHeight: CGFloat) -> UIImage {
        
        let scale = newHeight / image.size.height
        let newWidth = image.size.width * scale
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        
        
        image.draw(in: CGRect(x: 0, y: 0,width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

    
    func setProductSet(products: [Product])
    {
        self.productSet = products
    }
    
}
