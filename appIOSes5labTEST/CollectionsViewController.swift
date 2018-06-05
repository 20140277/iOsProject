//
// CollectionsViewController.swift
// appIOSes5labTEST
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/06/18
//

import Foundation
import SAPFiori
import SAPOData

protocol EntityUpdaterDelegate {
    func entityHasChanged(_ entity: EntityValue?)
}

protocol EntitySetUpdaterDelegate {
    func entitySetHasChanged()
}

class CollectionsViewController: FUIFormTableViewController {
    private var collections = CollectionType.all

    // Variable to store the selected index path
    private var selectedIndex: IndexPath?

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var isPresentedInSplitView: Bool {
        return !(self.splitViewController?.isCollapsed ?? true)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeSelection()
    }

    override func viewWillTransition(to _: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            let isNotInSplitView = !self.isPresentedInSplitView
            self.tableView.visibleCells.forEach { cell in
                // To refresh the disclosure indicator of each cell
                cell.accessoryType = isNotInSplitView ? .disclosureIndicator : .none
            }
            self.makeSelection()
        })
    }

    // MARK: - UITableViewDelegate

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.collections.count
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = self.collections[indexPath.row].rawValue
        cell.accessoryType = !self.isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        self.collectionSelected(at: indexPath)
    }

    // CollectionType selection helper

    private func collectionSelected(at: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard
        var masterViewController: UIViewController!
        switch self.collections[at.row] {
        case .productSet:
            let productSetStoryBoard = UIStoryboard(name: "ProductSet", bundle: nil)
            masterViewController = productSetStoryBoard.instantiateViewController(withIdentifier: "ProductSetMaster")
            masterViewController.navigationItem.title = "ProductSet"
        case .salesOrderSet:
            let salesOrderSetStoryBoard = UIStoryboard(name: "SalesOrderSet", bundle: nil)
            masterViewController = salesOrderSetStoryBoard.instantiateViewController(withIdentifier: "SalesOrderSetMaster")
            masterViewController.navigationItem.title = "SalesOrderSet"
        case .vhCountrySet:
            let vHCountrySetStoryBoard = UIStoryboard(name: "VHCountrySet", bundle: nil)
            masterViewController = vHCountrySetStoryBoard.instantiateViewController(withIdentifier: "VHCountrySetMaster")
            masterViewController.navigationItem.title = "VHCountrySet"
        case .vhbpRoleSet:
            let vHBPRoleSetStoryBoard = UIStoryboard(name: "VHBPRoleSet", bundle: nil)
            masterViewController = vHBPRoleSetStoryBoard.instantiateViewController(withIdentifier: "VHBPRoleSetMaster")
            masterViewController.navigationItem.title = "VHBPRoleSet"
        case .vhUnitQuantitySet:
            let vHUnitQuantitySetStoryBoard = UIStoryboard(name: "VHUnitQuantitySet", bundle: nil)
            masterViewController = vHUnitQuantitySetStoryBoard.instantiateViewController(withIdentifier: "VHUnitQuantitySetMaster")
            masterViewController.navigationItem.title = "VHUnitQuantitySet"
        case .vhUnitWeightSet:
            let vHUnitWeightSetStoryBoard = UIStoryboard(name: "VHUnitWeightSet", bundle: nil)
            masterViewController = vHUnitWeightSetStoryBoard.instantiateViewController(withIdentifier: "VHUnitWeightSetMaster")
            masterViewController.navigationItem.title = "VHUnitWeightSet"
        case .vhSexSet:
            let vHSexSetStoryBoard = UIStoryboard(name: "VHSexSet", bundle: nil)
            masterViewController = vHSexSetStoryBoard.instantiateViewController(withIdentifier: "VHSexSetMaster")
            masterViewController.navigationItem.title = "VHSexSet"
        case .contactSet:
            let contactSetStoryBoard = UIStoryboard(name: "ContactSet", bundle: nil)
            masterViewController = contactSetStoryBoard.instantiateViewController(withIdentifier: "ContactSetMaster")
            masterViewController.navigationItem.title = "ContactSet"
        case .vhProductTypeCodeSet:
            let vHProductTypeCodeSetStoryBoard = UIStoryboard(name: "VHProductTypeCodeSet", bundle: nil)
            masterViewController = vHProductTypeCodeSetStoryBoard.instantiateViewController(withIdentifier: "VHProductTypeCodeSetMaster")
            masterViewController.navigationItem.title = "VHProductTypeCodeSet"
        case .salesOrderLineItemSet:
            let salesOrderLineItemSetStoryBoard = UIStoryboard(name: "SalesOrderLineItemSet", bundle: nil)
            masterViewController = salesOrderLineItemSetStoryBoard.instantiateViewController(withIdentifier: "SalesOrderLineItemSetMaster")
            masterViewController.navigationItem.title = "SalesOrderLineItemSet"
        case .vhUnitLengthSet:
            let vHUnitLengthSetStoryBoard = UIStoryboard(name: "VHUnitLengthSet", bundle: nil)
            masterViewController = vHUnitLengthSetStoryBoard.instantiateViewController(withIdentifier: "VHUnitLengthSetMaster")
            masterViewController.navigationItem.title = "VHUnitLengthSet"
        case .vhLanguageSet:
            let vHLanguageSetStoryBoard = UIStoryboard(name: "VHLanguageSet", bundle: nil)
            masterViewController = vHLanguageSetStoryBoard.instantiateViewController(withIdentifier: "VHLanguageSetMaster")
            masterViewController.navigationItem.title = "VHLanguageSet"
        case .businessPartnerSet:
            let businessPartnerSetStoryBoard = UIStoryboard(name: "BusinessPartnerSet", bundle: nil)
            masterViewController = businessPartnerSetStoryBoard.instantiateViewController(withIdentifier: "BusinessPartnerSetMaster")
            masterViewController.navigationItem.title = "BusinessPartnerSet"
        case .vhCategorySet:
            let vHCategorySetStoryBoard = UIStoryboard(name: "VHCategorySet", bundle: nil)
            masterViewController = vHCategorySetStoryBoard.instantiateViewController(withIdentifier: "VHCategorySetMaster")
            masterViewController.navigationItem.title = "VHCategorySet"
        case .vhCurrencySet:
            let vHCurrencySetStoryBoard = UIStoryboard(name: "VHCurrencySet", bundle: nil)
            masterViewController = vHCurrencySetStoryBoard.instantiateViewController(withIdentifier: "VHCurrencySetMaster")
            masterViewController.navigationItem.title = "VHCurrencySet"
        case .vhAddressTypeSet:
            let vHAddressTypeSetStoryBoard = UIStoryboard(name: "VHAddressTypeSet", bundle: nil)
            masterViewController = vHAddressTypeSetStoryBoard.instantiateViewController(withIdentifier: "VHAddressTypeSetMaster")
            masterViewController.navigationItem.title = "VHAddressTypeSet"
        case .none:
            masterViewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }

    // MARK: - Handle highlighting of selected cell

    private func makeSelection() {
        if let selectedIndex = selectedIndex {
            self.tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            self.tableView.scrollToRow(at: selectedIndex, at: .none, animated: true)
        } else {
            self.selectDefault()
        }
    }

    private func selectDefault() {
        // Automatically select first element if we have two panels (iPhone plus and iPad only)
        if self.splitViewController!.isCollapsed || self.appDelegate.gwsamplebasicEntities == nil {
            return
        }
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        self.collectionSelected(at: indexPath)
    }
}
