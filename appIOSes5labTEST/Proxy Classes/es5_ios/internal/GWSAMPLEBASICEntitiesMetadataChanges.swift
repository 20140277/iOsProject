// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

internal class GWSAMPLEBASICEntitiesMetadataChanges: ObjectBase {
    override init() {
    }

    class func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        GWSAMPLEBASICEntitiesMetadata.document = metadata
        GWSAMPLEBASICEntitiesMetadataChanges.merge1(metadata: metadata)
        try! GWSAMPLEBASICEntitiesFactory.registerAll()
    }

    private class func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress = metadata.complexType(withName: "GWSAMPLE_BASIC.CT_Address")
        }
        if !GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctString.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctString = metadata.complexType(withName: "GWSAMPLE_BASIC.CT_String")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner = metadata.entityType(withName: "GWSAMPLE_BASIC.BusinessPartner")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact = metadata.entityType(withName: "GWSAMPLE_BASIC.Contact")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.product = metadata.entityType(withName: "GWSAMPLE_BASIC.Product")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder = metadata.entityType(withName: "GWSAMPLE_BASIC.SalesOrder")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem = metadata.entityType(withName: "GWSAMPLE_BASIC.SalesOrderLineItem")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhAddressType.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhAddressType = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_AddressType")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhBPRole.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhBPRole = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_BPRole")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCategory.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCategory = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_Category")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCountry.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCountry = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_Country")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCurrency.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCurrency = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_Currency")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhLanguage.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhLanguage = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_Language")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhProductTypeCode.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhProductTypeCode = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_ProductTypeCode")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhSex.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhSex = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_Sex")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitLength.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitLength = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_UnitLength")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitQuantity.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitQuantity = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_UnitQuantity")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitWeight.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitWeight = metadata.entityType(withName: "GWSAMPLE_BASIC.VH_UnitWeight")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.businessPartnerSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.businessPartnerSet = metadata.entitySet(withName: "BusinessPartnerSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.contactSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.contactSet = metadata.entitySet(withName: "ContactSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.productSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.productSet = metadata.entitySet(withName: "ProductSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.salesOrderLineItemSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.salesOrderLineItemSet = metadata.entitySet(withName: "SalesOrderLineItemSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.salesOrderSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.salesOrderSet = metadata.entitySet(withName: "SalesOrderSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhAddressTypeSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhAddressTypeSet = metadata.entitySet(withName: "VH_AddressTypeSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhBPRoleSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhBPRoleSet = metadata.entitySet(withName: "VH_BPRoleSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCategorySet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCategorySet = metadata.entitySet(withName: "VH_CategorySet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCountrySet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCountrySet = metadata.entitySet(withName: "VH_CountrySet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCurrencySet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhCurrencySet = metadata.entitySet(withName: "VH_CurrencySet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhLanguageSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhLanguageSet = metadata.entitySet(withName: "VH_LanguageSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhProductTypeCodeSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhProductTypeCodeSet = metadata.entitySet(withName: "VH_ProductTypeCodeSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhSexSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhSexSet = metadata.entitySet(withName: "VH_SexSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitLengthSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitLengthSet = metadata.entitySet(withName: "VH_UnitLengthSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitQuantitySet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitQuantitySet = metadata.entitySet(withName: "VH_UnitQuantitySet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitWeightSet.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.EntitySets.vhUnitWeightSet = metadata.entitySet(withName: "VH_UnitWeightSet")
        }
        if !GWSAMPLEBASICEntitiesMetadata.ActionImports.regenerateAllData.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.ActionImports.regenerateAllData = metadata.dataMethod(withName: "RegenerateAllData")
        }
        if !GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderCancel.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderCancel = metadata.dataMethod(withName: "SalesOrder_Cancel")
        }
        if !GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderConfirm.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderConfirm = metadata.dataMethod(withName: "SalesOrder_Confirm")
        }
        if !GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderGoodsIssueCreated.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderGoodsIssueCreated = metadata.dataMethod(withName: "SalesOrder_GoodsIssueCreated")
        }
        if !GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderInvoiceCreated.isRemoved {
            GWSAMPLEBASICEntitiesMetadata.ActionImports.salesOrderInvoiceCreated = metadata.dataMethod(withName: "SalesOrder_InvoiceCreated")
        }
        if !CTAddress.city.isRemoved {
            CTAddress.city = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "City")
        }
        if !CTAddress.postalCode.isRemoved {
            CTAddress.postalCode = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "PostalCode")
        }
        if !CTAddress.street.isRemoved {
            CTAddress.street = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "Street")
        }
        if !CTAddress.building.isRemoved {
            CTAddress.building = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "Building")
        }
        if !CTAddress.country.isRemoved {
            CTAddress.country = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "Country")
        }
        if !CTAddress.addressType.isRemoved {
            CTAddress.addressType = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "AddressType")
        }
        if !CTString.string.isRemoved {
            CTString.string = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctString.property(withName: "String")
        }
        if !BusinessPartner.address.isRemoved {
            BusinessPartner.address = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "Address")
        }
        if !BusinessPartner.businessPartnerID.isRemoved {
            BusinessPartner.businessPartnerID = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "BusinessPartnerID")
        }
        if !BusinessPartner.companyName.isRemoved {
            BusinessPartner.companyName = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "CompanyName")
        }
        if !BusinessPartner.webAddress.isRemoved {
            BusinessPartner.webAddress = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "WebAddress")
        }
        if !BusinessPartner.emailAddress.isRemoved {
            BusinessPartner.emailAddress = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "EmailAddress")
        }
        if !BusinessPartner.phoneNumber.isRemoved {
            BusinessPartner.phoneNumber = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "PhoneNumber")
        }
        if !BusinessPartner.faxNumber.isRemoved {
            BusinessPartner.faxNumber = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "FaxNumber")
        }
        if !BusinessPartner.legalForm.isRemoved {
            BusinessPartner.legalForm = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "LegalForm")
        }
        if !BusinessPartner.currencyCode.isRemoved {
            BusinessPartner.currencyCode = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "CurrencyCode")
        }
        if !BusinessPartner.businessPartnerRole.isRemoved {
            BusinessPartner.businessPartnerRole = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "BusinessPartnerRole")
        }
        if !BusinessPartner.createdAt.isRemoved {
            BusinessPartner.createdAt = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "CreatedAt")
        }
        if !BusinessPartner.changedAt.isRemoved {
            BusinessPartner.changedAt = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "ChangedAt")
        }
        if !BusinessPartner.toSalesOrders.isRemoved {
            BusinessPartner.toSalesOrders = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "ToSalesOrders")
        }
        if !BusinessPartner.toContacts.isRemoved {
            BusinessPartner.toContacts = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "ToContacts")
        }
        if !BusinessPartner.toProducts.isRemoved {
            BusinessPartner.toProducts = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "ToProducts")
        }
        if !Contact.address.isRemoved {
            Contact.address = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Address")
        }
        if !Contact.contactGuid.isRemoved {
            Contact.contactGuid = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "ContactGuid")
        }
        if !Contact.businessPartnerID.isRemoved {
            Contact.businessPartnerID = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "BusinessPartnerID")
        }
        if !Contact.title.isRemoved {
            Contact.title = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Title")
        }
        if !Contact.firstName.isRemoved {
            Contact.firstName = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "FirstName")
        }
        if !Contact.middleName.isRemoved {
            Contact.middleName = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "MiddleName")
        }
        if !Contact.lastName.isRemoved {
            Contact.lastName = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "LastName")
        }
        if !Contact.nickname.isRemoved {
            Contact.nickname = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Nickname")
        }
        if !Contact.initials.isRemoved {
            Contact.initials = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Initials")
        }
        if !Contact.sex.isRemoved {
            Contact.sex = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Sex")
        }
        if !Contact.phoneNumber.isRemoved {
            Contact.phoneNumber = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "PhoneNumber")
        }
        if !Contact.faxNumber.isRemoved {
            Contact.faxNumber = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "FaxNumber")
        }
        if !Contact.emailAddress.isRemoved {
            Contact.emailAddress = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "EmailAddress")
        }
        if !Contact.language.isRemoved {
            Contact.language = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Language")
        }
        if !Contact.dateOfBirth.isRemoved {
            Contact.dateOfBirth = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "DateOfBirth")
        }
        if !Contact.toBusinessPartner.isRemoved {
            Contact.toBusinessPartner = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "ToBusinessPartner")
        }
        if !Product.productID.isRemoved {
            Product.productID = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "ProductID")
        }
        if !Product.typeCode_.isRemoved {
            Product.typeCode_ = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "TypeCode")
        }
        if !Product.category.isRemoved {
            Product.category = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Category")
        }
        if !Product.name.isRemoved {
            Product.name = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Name")
        }
        if !Product.nameLanguage.isRemoved {
            Product.nameLanguage = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "NameLanguage")
        }
        if !Product.description.isRemoved {
            Product.description = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Description")
        }
        if !Product.descriptionLanguage.isRemoved {
            Product.descriptionLanguage = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "DescriptionLanguage")
        }
        if !Product.supplierID.isRemoved {
            Product.supplierID = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "SupplierID")
        }
        if !Product.supplierName.isRemoved {
            Product.supplierName = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "SupplierName")
        }
        if !Product.taxTarifCode.isRemoved {
            Product.taxTarifCode = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "TaxTarifCode")
        }
        if !Product.measureUnit.isRemoved {
            Product.measureUnit = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "MeasureUnit")
        }
        if !Product.weightMeasure.isRemoved {
            Product.weightMeasure = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "WeightMeasure")
        }
        if !Product.weightUnit.isRemoved {
            Product.weightUnit = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "WeightUnit")
        }
        if !Product.currencyCode.isRemoved {
            Product.currencyCode = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "CurrencyCode")
        }
        if !Product.price.isRemoved {
            Product.price = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Price")
        }
        if !Product.width.isRemoved {
            Product.width = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Width")
        }
        if !Product.depth.isRemoved {
            Product.depth = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Depth")
        }
        if !Product.height.isRemoved {
            Product.height = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Height")
        }
        if !Product.dimUnit.isRemoved {
            Product.dimUnit = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "DimUnit")
        }
        if !Product.createdAt.isRemoved {
            Product.createdAt = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "CreatedAt")
        }
        if !Product.changedAt.isRemoved {
            Product.changedAt = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "ChangedAt")
        }
        if !Product.toSalesOrderLineItems.isRemoved {
            Product.toSalesOrderLineItems = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "ToSalesOrderLineItems")
        }
        if !Product.toSupplier.isRemoved {
            Product.toSupplier = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "ToSupplier")
        }
        if !SalesOrder.salesOrderID.isRemoved {
            SalesOrder.salesOrderID = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "SalesOrderID")
        }
        if !SalesOrder.note.isRemoved {
            SalesOrder.note = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "Note")
        }
        if !SalesOrder.noteLanguage.isRemoved {
            SalesOrder.noteLanguage = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "NoteLanguage")
        }
        if !SalesOrder.customerID.isRemoved {
            SalesOrder.customerID = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "CustomerID")
        }
        if !SalesOrder.customerName.isRemoved {
            SalesOrder.customerName = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "CustomerName")
        }
        if !SalesOrder.currencyCode.isRemoved {
            SalesOrder.currencyCode = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "CurrencyCode")
        }
        if !SalesOrder.grossAmount.isRemoved {
            SalesOrder.grossAmount = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "GrossAmount")
        }
        if !SalesOrder.netAmount.isRemoved {
            SalesOrder.netAmount = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "NetAmount")
        }
        if !SalesOrder.taxAmount.isRemoved {
            SalesOrder.taxAmount = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "TaxAmount")
        }
        if !SalesOrder.lifecycleStatus.isRemoved {
            SalesOrder.lifecycleStatus = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "LifecycleStatus")
        }
        if !SalesOrder.lifecycleStatusDescription.isRemoved {
            SalesOrder.lifecycleStatusDescription = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "LifecycleStatusDescription")
        }
        if !SalesOrder.billingStatus.isRemoved {
            SalesOrder.billingStatus = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "BillingStatus")
        }
        if !SalesOrder.billingStatusDescription.isRemoved {
            SalesOrder.billingStatusDescription = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "BillingStatusDescription")
        }
        if !SalesOrder.deliveryStatus.isRemoved {
            SalesOrder.deliveryStatus = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "DeliveryStatus")
        }
        if !SalesOrder.deliveryStatusDescription.isRemoved {
            SalesOrder.deliveryStatusDescription = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "DeliveryStatusDescription")
        }
        if !SalesOrder.createdAt.isRemoved {
            SalesOrder.createdAt = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "CreatedAt")
        }
        if !SalesOrder.changedAt.isRemoved {
            SalesOrder.changedAt = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "ChangedAt")
        }
        if !SalesOrder.toBusinessPartner.isRemoved {
            SalesOrder.toBusinessPartner = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "ToBusinessPartner")
        }
        if !SalesOrder.toLineItems.isRemoved {
            SalesOrder.toLineItems = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "ToLineItems")
        }
        if !SalesOrderLineItem.salesOrderID.isRemoved {
            SalesOrderLineItem.salesOrderID = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "SalesOrderID")
        }
        if !SalesOrderLineItem.itemPosition.isRemoved {
            SalesOrderLineItem.itemPosition = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "ItemPosition")
        }
        if !SalesOrderLineItem.productID.isRemoved {
            SalesOrderLineItem.productID = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "ProductID")
        }
        if !SalesOrderLineItem.note.isRemoved {
            SalesOrderLineItem.note = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "Note")
        }
        if !SalesOrderLineItem.noteLanguage.isRemoved {
            SalesOrderLineItem.noteLanguage = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "NoteLanguage")
        }
        if !SalesOrderLineItem.currencyCode.isRemoved {
            SalesOrderLineItem.currencyCode = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "CurrencyCode")
        }
        if !SalesOrderLineItem.grossAmount.isRemoved {
            SalesOrderLineItem.grossAmount = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "GrossAmount")
        }
        if !SalesOrderLineItem.netAmount.isRemoved {
            SalesOrderLineItem.netAmount = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "NetAmount")
        }
        if !SalesOrderLineItem.taxAmount.isRemoved {
            SalesOrderLineItem.taxAmount = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "TaxAmount")
        }
        if !SalesOrderLineItem.deliveryDate.isRemoved {
            SalesOrderLineItem.deliveryDate = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "DeliveryDate")
        }
        if !SalesOrderLineItem.quantity.isRemoved {
            SalesOrderLineItem.quantity = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "Quantity")
        }
        if !SalesOrderLineItem.quantityUnit.isRemoved {
            SalesOrderLineItem.quantityUnit = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "QuantityUnit")
        }
        if !SalesOrderLineItem.toHeader.isRemoved {
            SalesOrderLineItem.toHeader = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "ToHeader")
        }
        if !SalesOrderLineItem.toProduct.isRemoved {
            SalesOrderLineItem.toProduct = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "ToProduct")
        }
        if !VHAddressType.addressType.isRemoved {
            VHAddressType.addressType = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhAddressType.property(withName: "AddressType")
        }
        if !VHAddressType.shorttext.isRemoved {
            VHAddressType.shorttext = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhAddressType.property(withName: "Shorttext")
        }
        if !VHBPRole.bpRole.isRemoved {
            VHBPRole.bpRole = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhBPRole.property(withName: "BpRole")
        }
        if !VHBPRole.shorttext.isRemoved {
            VHBPRole.shorttext = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhBPRole.property(withName: "Shorttext")
        }
        if !VHCategory.category.isRemoved {
            VHCategory.category = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCategory.property(withName: "Category")
        }
        if !VHCountry.land1.isRemoved {
            VHCountry.land1 = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCountry.property(withName: "Land1")
        }
        if !VHCountry.landx.isRemoved {
            VHCountry.landx = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCountry.property(withName: "Landx")
        }
        if !VHCountry.natio.isRemoved {
            VHCountry.natio = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCountry.property(withName: "Natio")
        }
        if !VHCurrency.waers.isRemoved {
            VHCurrency.waers = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCurrency.property(withName: "Waers")
        }
        if !VHCurrency.ltext.isRemoved {
            VHCurrency.ltext = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCurrency.property(withName: "Ltext")
        }
        if !VHLanguage.spras.isRemoved {
            VHLanguage.spras = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhLanguage.property(withName: "Spras")
        }
        if !VHLanguage.sptxt.isRemoved {
            VHLanguage.sptxt = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhLanguage.property(withName: "Sptxt")
        }
        if !VHProductTypeCode.typeCode_.isRemoved {
            VHProductTypeCode.typeCode_ = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhProductTypeCode.property(withName: "TypeCode")
        }
        if !VHProductTypeCode.shorttext.isRemoved {
            VHProductTypeCode.shorttext = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhProductTypeCode.property(withName: "Shorttext")
        }
        if !VHSex.sex.isRemoved {
            VHSex.sex = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhSex.property(withName: "Sex")
        }
        if !VHSex.shorttext.isRemoved {
            VHSex.shorttext = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhSex.property(withName: "Shorttext")
        }
        if !VHUnitLength.msehi.isRemoved {
            VHUnitLength.msehi = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitLength.property(withName: "Msehi")
        }
        if !VHUnitLength.msehl.isRemoved {
            VHUnitLength.msehl = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitLength.property(withName: "Msehl")
        }
        if !VHUnitQuantity.msehi.isRemoved {
            VHUnitQuantity.msehi = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitQuantity.property(withName: "Msehi")
        }
        if !VHUnitQuantity.msehl.isRemoved {
            VHUnitQuantity.msehl = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitQuantity.property(withName: "Msehl")
        }
        if !VHUnitWeight.msehi.isRemoved {
            VHUnitWeight.msehi = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitWeight.property(withName: "Msehi")
        }
        if !VHUnitWeight.msehl.isRemoved {
            VHUnitWeight.msehl = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitWeight.property(withName: "Msehl")
        }
    }
}
