//
// CollectionType.swift
// appIOSes5labTEST
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/06/18
//

import Foundation

enum CollectionType: String {
    case productSet = "ProductSet"
    case salesOrderSet = "SalesOrderSet"
    case vhCountrySet = "VHCountrySet"
    case vhbpRoleSet = "VHBPRoleSet"
    case vhUnitQuantitySet = "VHUnitQuantitySet"
    case vhUnitWeightSet = "VHUnitWeightSet"
    case vhSexSet = "VHSexSet"
    case contactSet = "ContactSet"
    case vhProductTypeCodeSet = "VHProductTypeCodeSet"
    case salesOrderLineItemSet = "SalesOrderLineItemSet"
    case vhUnitLengthSet = "VHUnitLengthSet"
    case vhLanguageSet = "VHLanguageSet"
    case businessPartnerSet = "BusinessPartnerSet"
    case vhCategorySet = "VHCategorySet"
    case vhCurrencySet = "VHCurrencySet"
    case vhAddressTypeSet = "VHAddressTypeSet"
    case none = ""

    static let all = [
        productSet, salesOrderSet, vhCountrySet, vhbpRoleSet, vhUnitQuantitySet, vhUnitWeightSet, vhSexSet, contactSet, vhProductTypeCodeSet, salesOrderLineItemSet, vhUnitLengthSet, vhLanguageSet, businessPartnerSet, vhCategorySet, vhCurrencySet, vhAddressTypeSet,
    ]
}
