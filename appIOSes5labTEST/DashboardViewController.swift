//  SAP Fiori for iOS Mentor
//  SAP Cloud Platform SDK for iOS Code Example
//  KPI Header
//  Copyright © 2017 SAP SE or an SAP affiliate company. All rights reserved.


import SAPFiori

class DashboardViewController: UITableViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var updateButton: UIButton!
    
    
    //var oDataModel: GWSAMPLEBASICEntitiesDataAccess?

    
    var kpiHeader: FUIKPIHeader!
    var delegate: AppDelegate!
    let cellReuseIdentifier = "FUITimelineCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initExampleData()
        initTimeLineView()
     }
  
    
    func initExampleData() {
        
        let kpiView1 = FUIKPIView()
        let kpiView1Metric = FUIKPIMetricItem(string: "2")
        kpiView1.items = [kpiView1Metric]
        kpiView1.captionlabel.text = "Customers Assisted"
        
        let kpiView2 = FUIKPIView()
        let kpiView2Metric = FUIKPIMetricItem(string: "5")
        kpiView2.items = [kpiView2Metric]
        kpiView2.captionlabel.text = "Still in Store Waiting For Checkout"
        
        let kpiView3 = FUIKPIView()
        let kpiView3Metric = FUIKPIMetricItem(string: "4")
        kpiView3.items = [kpiView3Metric]
        kpiView3.captionlabel.text = "Orders"
        
        let kpiView4 = FUIKPIView()
        let kpiView4Unit = FUIKPIUnitItem(string: "$")
        let kpiView4Metric = FUIKPIMetricItem(string: "294")
        kpiView4.items = [kpiView4Unit, kpiView4Metric]
        kpiView4.captionlabel.text = "Average Spend Per Calendar Year"
        kpiView4.captionlabel.numberOfLines = 2
        
        kpiHeader = FUIKPIHeader(items: [kpiView1, kpiView2, kpiView3, kpiView4])
        
        tableView.tableHeaderView = kpiHeader
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let timeLineCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! FUITimelineCell
            timeLineCell.timelineWidth = CGFloat(95.0)
            timeLineCell.headlineText = "Test \(indexPath)"
            timeLineCell.subheadlineText = "Test_SubLineText"
            timeLineCell.nodeImage = FUITimelineNode.complete
            timeLineCell.eventText = "10:00 A.M."
        
        return timeLineCell
    }
    
    func initTimeLineView(){
        tableView.register(FUITimelineCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = UIColor.preferredFioriColor(forStyle: .backgroundBase)
        tableView.separatorStyle = .none
    }
    
}




