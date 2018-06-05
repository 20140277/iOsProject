// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class GWSAMPLEBASICEntities<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = GWSAMPLEBASICEntitiesMetadata.document
    }

    @available(swift, deprecated: 4.0, renamed: "fetchBusinessPartnerSet")
    open func businessPartnerSet(query: DataQuery = DataQuery()) throws -> Array<BusinessPartner> {
        return try self.fetchBusinessPartnerSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchBusinessPartnerSet")
    open func businessPartnerSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<BusinessPartner>?, Error?) -> Void) {
        self.fetchBusinessPartnerSet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchContactSet")
    open func contactSet(query: DataQuery = DataQuery()) throws -> Array<Contact> {
        return try self.fetchContactSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchContactSet")
    open func contactSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Contact>?, Error?) -> Void) {
        self.fetchContactSet(matching: query, completionHandler: completionHandler)
    }

    open func fetchBusinessPartner(matching query: DataQuery) throws -> BusinessPartner {
        return try CastRequired<BusinessPartner>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.businessPartnerSet)).requiredEntity())
    }

    open func fetchBusinessPartner(matching query: DataQuery, completionHandler: @escaping (BusinessPartner?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: BusinessPartner = try self.fetchBusinessPartner(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchBusinessPartnerSet(matching query: DataQuery = DataQuery()) throws -> Array<BusinessPartner> {
        return try BusinessPartner.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.businessPartnerSet)).entityList())
    }

    open func fetchBusinessPartnerSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<BusinessPartner>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<BusinessPartner> = try self.fetchBusinessPartnerSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchContact(matching query: DataQuery) throws -> Contact {
        return try CastRequired<Contact>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.contactSet)).requiredEntity())
    }

    open func fetchContact(matching query: DataQuery, completionHandler: @escaping (Contact?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Contact = try self.fetchContact(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchContactSet(matching query: DataQuery = DataQuery()) throws -> Array<Contact> {
        return try Contact.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.contactSet)).entityList())
    }

    open func fetchContactSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Contact>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Contact> = try self.fetchContactSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProduct(matching query: DataQuery) throws -> Product {
        return try CastRequired<Product>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.productSet)).requiredEntity())
    }

    open func fetchProduct(matching query: DataQuery, completionHandler: @escaping (Product?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Product = try self.fetchProduct(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductSet(matching query: DataQuery = DataQuery()) throws -> Array<Product> {
        return try Product.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.productSet)).entityList())
    }

    open func fetchProductSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Product>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<Product> = try self.fetchProductSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrder(matching query: DataQuery) throws -> SalesOrder {
        return try CastRequired<SalesOrder>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.salesOrderSet)).requiredEntity())
    }

    open func fetchSalesOrder(matching query: DataQuery, completionHandler: @escaping (SalesOrder?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: SalesOrder = try self.fetchSalesOrder(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderLineItem(matching query: DataQuery) throws -> SalesOrderLineItem {
        return try CastRequired<SalesOrderLineItem>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.salesOrderLineItemSet)).requiredEntity())
    }

    open func fetchSalesOrderLineItem(matching query: DataQuery, completionHandler: @escaping (SalesOrderLineItem?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: SalesOrderLineItem = try self.fetchSalesOrderLineItem(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderLineItemSet(matching query: DataQuery = DataQuery()) throws -> Array<SalesOrderLineItem> {
        return try SalesOrderLineItem.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.salesOrderLineItemSet)).entityList())
    }

    open func fetchSalesOrderLineItemSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SalesOrderLineItem>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<SalesOrderLineItem> = try self.fetchSalesOrderLineItemSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderSet(matching query: DataQuery = DataQuery()) throws -> Array<SalesOrder> {
        return try SalesOrder.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.salesOrderSet)).entityList())
    }

    open func fetchSalesOrderSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SalesOrder>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<SalesOrder> = try self.fetchSalesOrderSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHAddressType(matching query: DataQuery) throws -> VHAddressType {
        return try CastRequired<VHAddressType>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhAddressTypeSet)).requiredEntity())
    }

    open func fetchVHAddressType(matching query: DataQuery, completionHandler: @escaping (VHAddressType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHAddressType = try self.fetchVHAddressType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHAddressTypeSet(matching query: DataQuery = DataQuery()) throws -> Array<VHAddressType> {
        return try VHAddressType.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhAddressTypeSet)).entityList())
    }

    open func fetchVHAddressTypeSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHAddressType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHAddressType> = try self.fetchVHAddressTypeSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHBPRole(matching query: DataQuery) throws -> VHBPRole {
        return try CastRequired<VHBPRole>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhBPRoleSet)).requiredEntity())
    }

    open func fetchVHBPRole(matching query: DataQuery, completionHandler: @escaping (VHBPRole?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHBPRole = try self.fetchVHBPRole(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHBPRoleSet(matching query: DataQuery = DataQuery()) throws -> Array<VHBPRole> {
        return try VHBPRole.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhBPRoleSet)).entityList())
    }

    open func fetchVHBPRoleSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHBPRole>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHBPRole> = try self.fetchVHBPRoleSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHCategory(matching query: DataQuery) throws -> VHCategory {
        return try CastRequired<VHCategory>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCategorySet)).requiredEntity())
    }

    open func fetchVHCategory(matching query: DataQuery, completionHandler: @escaping (VHCategory?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHCategory = try self.fetchVHCategory(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHCategorySet(matching query: DataQuery = DataQuery()) throws -> Array<VHCategory> {
        return try VHCategory.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCategorySet)).entityList())
    }

    open func fetchVHCategorySet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHCategory>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHCategory> = try self.fetchVHCategorySet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHCountry(matching query: DataQuery) throws -> VHCountry {
        return try CastRequired<VHCountry>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCountrySet)).requiredEntity())
    }

    open func fetchVHCountry(matching query: DataQuery, completionHandler: @escaping (VHCountry?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHCountry = try self.fetchVHCountry(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHCountrySet(matching query: DataQuery = DataQuery()) throws -> Array<VHCountry> {
        return try VHCountry.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCountrySet)).entityList())
    }

    open func fetchVHCountrySet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHCountry>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHCountry> = try self.fetchVHCountrySet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHCurrency(matching query: DataQuery) throws -> VHCurrency {
        return try CastRequired<VHCurrency>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCurrencySet)).requiredEntity())
    }

    open func fetchVHCurrency(matching query: DataQuery, completionHandler: @escaping (VHCurrency?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHCurrency = try self.fetchVHCurrency(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHCurrencySet(matching query: DataQuery = DataQuery()) throws -> Array<VHCurrency> {
        return try VHCurrency.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCurrencySet)).entityList())
    }

    open func fetchVHCurrencySet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHCurrency>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHCurrency> = try self.fetchVHCurrencySet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHLanguage(matching query: DataQuery) throws -> VHLanguage {
        return try CastRequired<VHLanguage>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhLanguageSet)).requiredEntity())
    }

    open func fetchVHLanguage(matching query: DataQuery, completionHandler: @escaping (VHLanguage?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHLanguage = try self.fetchVHLanguage(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHLanguageSet(matching query: DataQuery = DataQuery()) throws -> Array<VHLanguage> {
        return try VHLanguage.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhLanguageSet)).entityList())
    }

    open func fetchVHLanguageSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHLanguage>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHLanguage> = try self.fetchVHLanguageSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHProductTypeCode(matching query: DataQuery) throws -> VHProductTypeCode {
        return try CastRequired<VHProductTypeCode>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhProductTypeCodeSet)).requiredEntity())
    }

    open func fetchVHProductTypeCode(matching query: DataQuery, completionHandler: @escaping (VHProductTypeCode?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHProductTypeCode = try self.fetchVHProductTypeCode(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHProductTypeCodeSet(matching query: DataQuery = DataQuery()) throws -> Array<VHProductTypeCode> {
        return try VHProductTypeCode.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhProductTypeCodeSet)).entityList())
    }

    open func fetchVHProductTypeCodeSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHProductTypeCode>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHProductTypeCode> = try self.fetchVHProductTypeCodeSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHSex(matching query: DataQuery) throws -> VHSex {
        return try CastRequired<VHSex>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhSexSet)).requiredEntity())
    }

    open func fetchVHSex(matching query: DataQuery, completionHandler: @escaping (VHSex?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHSex = try self.fetchVHSex(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHSexSet(matching query: DataQuery = DataQuery()) throws -> Array<VHSex> {
        return try VHSex.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhSexSet)).entityList())
    }

    open func fetchVHSexSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHSex>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHSex> = try self.fetchVHSexSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHUnitLength(matching query: DataQuery) throws -> VHUnitLength {
        return try CastRequired<VHUnitLength>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitLengthSet)).requiredEntity())
    }

    open func fetchVHUnitLength(matching query: DataQuery, completionHandler: @escaping (VHUnitLength?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHUnitLength = try self.fetchVHUnitLength(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHUnitLengthSet(matching query: DataQuery = DataQuery()) throws -> Array<VHUnitLength> {
        return try VHUnitLength.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitLengthSet)).entityList())
    }

    open func fetchVHUnitLengthSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHUnitLength>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHUnitLength> = try self.fetchVHUnitLengthSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHUnitQuantity(matching query: DataQuery) throws -> VHUnitQuantity {
        return try CastRequired<VHUnitQuantity>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitQuantitySet)).requiredEntity())
    }

    open func fetchVHUnitQuantity(matching query: DataQuery, completionHandler: @escaping (VHUnitQuantity?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHUnitQuantity = try self.fetchVHUnitQuantity(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHUnitQuantitySet(matching query: DataQuery = DataQuery()) throws -> Array<VHUnitQuantity> {
        return try VHUnitQuantity.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitQuantitySet)).entityList())
    }

    open func fetchVHUnitQuantitySet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHUnitQuantity>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHUnitQuantity> = try self.fetchVHUnitQuantitySet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHUnitWeight(matching query: DataQuery) throws -> VHUnitWeight {
        return try CastRequired<VHUnitWeight>.from(self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitWeightSet)).requiredEntity())
    }

    open func fetchVHUnitWeight(matching query: DataQuery, completionHandler: @escaping (VHUnitWeight?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: VHUnitWeight = try self.fetchVHUnitWeight(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVHUnitWeightSet(matching query: DataQuery = DataQuery()) throws -> Array<VHUnitWeight> {
        return try VHUnitWeight.array(from: self.executeQuery(query.fromDefault(GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitWeightSet)).entityList())
    }

    open func fetchVHUnitWeightSet(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHUnitWeight>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<VHUnitWeight> = try self.fetchVHUnitWeightSet(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductSet")
    open func productSet(query: DataQuery = DataQuery()) throws -> Array<Product> {
        return try self.fetchProductSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductSet")
    open func productSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Product>?, Error?) -> Void) {
        self.fetchProductSet(matching: query, completionHandler: completionHandler)
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: GWSAMPLEBASICEntitiesMetadataParser.options)
            GWSAMPLEBASICEntitiesMetadataChanges.merge(metadata: self.metadata)
        }
    }

    open func regenerateAllData(noOfSalesOrders: Int?, query: DataQuery = DataQuery()) throws -> CTString? {
        return try CastOptional<CTString>.from(self.executeQuery(query.invoke(GWSAMPLEBASICEntitiesMetadata.ActionImports.regenerateAllData, ParameterList(capacity: (1 as Int)).with(name: "NoOfSalesOrders", value: IntValue.of(optional: noOfSalesOrders)))).result)
    }

    open func regenerateAllData(noOfSalesOrders: Int?, query: DataQuery = DataQuery(), completionHandler: @escaping (CTString?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: CTString? = try self.regenerateAllData(noOfSalesOrders: noOfSalesOrders, query: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func salesOrderCancel(salesOrderID: String?, query: DataQuery = DataQuery()) throws -> SalesOrder? {
        return try CastOptional<SalesOrder>.from(self.executeQuery(query.invoke(GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderCancel, ParameterList(capacity: (1 as Int)).with(name: "SalesOrderID", value: StringValue.of(optional: salesOrderID)))).result)
    }

    open func salesOrderCancel(salesOrderID: String?, query: DataQuery = DataQuery(), completionHandler: @escaping (SalesOrder?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: SalesOrder? = try self.salesOrderCancel(salesOrderID: salesOrderID, query: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func salesOrderConfirm(salesOrderID: String?, query: DataQuery = DataQuery()) throws -> SalesOrder? {
        return try CastOptional<SalesOrder>.from(self.executeQuery(query.invoke(GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderConfirm, ParameterList(capacity: (1 as Int)).with(name: "SalesOrderID", value: StringValue.of(optional: salesOrderID)))).result)
    }

    open func salesOrderConfirm(salesOrderID: String?, query: DataQuery = DataQuery(), completionHandler: @escaping (SalesOrder?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: SalesOrder? = try self.salesOrderConfirm(salesOrderID: salesOrderID, query: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func salesOrderGoodsIssueCreated(salesOrderID: String?, query: DataQuery = DataQuery()) throws -> SalesOrder? {
        return try CastOptional<SalesOrder>.from(self.executeQuery(query.invoke(GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderGoodsIssueCreated, ParameterList(capacity: (1 as Int)).with(name: "SalesOrderID", value: StringValue.of(optional: salesOrderID)))).result)
    }

    open func salesOrderGoodsIssueCreated(salesOrderID: String?, query: DataQuery = DataQuery(), completionHandler: @escaping (SalesOrder?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: SalesOrder? = try self.salesOrderGoodsIssueCreated(salesOrderID: salesOrderID, query: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func salesOrderInvoiceCreated(salesOrderID: String?, query: DataQuery = DataQuery()) throws -> SalesOrder? {
        return try CastOptional<SalesOrder>.from(self.executeQuery(query.invoke(GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderInvoiceCreated, ParameterList(capacity: (1 as Int)).with(name: "SalesOrderID", value: StringValue.of(optional: salesOrderID)))).result)
    }

    open func salesOrderInvoiceCreated(salesOrderID: String?, query: DataQuery = DataQuery(), completionHandler: @escaping (SalesOrder?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: SalesOrder? = try self.salesOrderInvoiceCreated(salesOrderID: salesOrderID, query: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderLineItemSet")
    open func salesOrderLineItemSet(query: DataQuery = DataQuery()) throws -> Array<SalesOrderLineItem> {
        return try self.fetchSalesOrderLineItemSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderLineItemSet")
    open func salesOrderLineItemSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SalesOrderLineItem>?, Error?) -> Void) {
        self.fetchSalesOrderLineItemSet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderSet")
    open func salesOrderSet(query: DataQuery = DataQuery()) throws -> Array<SalesOrder> {
        return try self.fetchSalesOrderSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderSet")
    open func salesOrderSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SalesOrder>?, Error?) -> Void) {
        self.fetchSalesOrderSet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHAddressTypeSet")
    open func vhAddressTypeSet(query: DataQuery = DataQuery()) throws -> Array<VHAddressType> {
        return try self.fetchVHAddressTypeSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHAddressTypeSet")
    open func vhAddressTypeSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHAddressType>?, Error?) -> Void) {
        self.fetchVHAddressTypeSet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHBPRoleSet")
    open func vhBPRoleSet(query: DataQuery = DataQuery()) throws -> Array<VHBPRole> {
        return try self.fetchVHBPRoleSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHBPRoleSet")
    open func vhBPRoleSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHBPRole>?, Error?) -> Void) {
        self.fetchVHBPRoleSet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHCategorySet")
    open func vhCategorySet(query: DataQuery = DataQuery()) throws -> Array<VHCategory> {
        return try self.fetchVHCategorySet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHCategorySet")
    open func vhCategorySet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHCategory>?, Error?) -> Void) {
        self.fetchVHCategorySet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHCountrySet")
    open func vhCountrySet(query: DataQuery = DataQuery()) throws -> Array<VHCountry> {
        return try self.fetchVHCountrySet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHCountrySet")
    open func vhCountrySet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHCountry>?, Error?) -> Void) {
        self.fetchVHCountrySet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHCurrencySet")
    open func vhCurrencySet(query: DataQuery = DataQuery()) throws -> Array<VHCurrency> {
        return try self.fetchVHCurrencySet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHCurrencySet")
    open func vhCurrencySet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHCurrency>?, Error?) -> Void) {
        self.fetchVHCurrencySet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHLanguageSet")
    open func vhLanguageSet(query: DataQuery = DataQuery()) throws -> Array<VHLanguage> {
        return try self.fetchVHLanguageSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHLanguageSet")
    open func vhLanguageSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHLanguage>?, Error?) -> Void) {
        self.fetchVHLanguageSet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHProductTypeCodeSet")
    open func vhProductTypeCodeSet(query: DataQuery = DataQuery()) throws -> Array<VHProductTypeCode> {
        return try self.fetchVHProductTypeCodeSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHProductTypeCodeSet")
    open func vhProductTypeCodeSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHProductTypeCode>?, Error?) -> Void) {
        self.fetchVHProductTypeCodeSet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHSexSet")
    open func vhSexSet(query: DataQuery = DataQuery()) throws -> Array<VHSex> {
        return try self.fetchVHSexSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHSexSet")
    open func vhSexSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHSex>?, Error?) -> Void) {
        self.fetchVHSexSet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHUnitLengthSet")
    open func vhUnitLengthSet(query: DataQuery = DataQuery()) throws -> Array<VHUnitLength> {
        return try self.fetchVHUnitLengthSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHUnitLengthSet")
    open func vhUnitLengthSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHUnitLength>?, Error?) -> Void) {
        self.fetchVHUnitLengthSet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHUnitQuantitySet")
    open func vhUnitQuantitySet(query: DataQuery = DataQuery()) throws -> Array<VHUnitQuantity> {
        return try self.fetchVHUnitQuantitySet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHUnitQuantitySet")
    open func vhUnitQuantitySet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHUnitQuantity>?, Error?) -> Void) {
        self.fetchVHUnitQuantitySet(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHUnitWeightSet")
    open func vhUnitWeightSet(query: DataQuery = DataQuery()) throws -> Array<VHUnitWeight> {
        return try self.fetchVHUnitWeightSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchVHUnitWeightSet")
    open func vhUnitWeightSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<VHUnitWeight>?, Error?) -> Void) {
        self.fetchVHUnitWeightSet(matching: query, completionHandler: completionHandler)
    }
}
