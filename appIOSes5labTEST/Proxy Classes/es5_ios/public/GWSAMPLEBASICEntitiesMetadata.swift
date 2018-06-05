// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

public class GWSAMPLEBASICEntitiesMetadata {
    public static var document: CSDLDocument = GWSAMPLEBASICEntitiesMetadata.resolve()

    private static func resolve() -> CSDLDocument {
        try! GWSAMPLEBASICEntitiesFactory.registerAll()
        GWSAMPLEBASICEntitiesMetadataParser.parsed.hasGeneratedProxies = true
        return GWSAMPLEBASICEntitiesMetadataParser.parsed
    }

    public class ComplexTypes {
        public static var ctAddress: ComplexType = GWSAMPLEBASICEntitiesMetadataParser.parsed.complexType(withName: "GWSAMPLE_BASIC.CT_Address")

        public static var ctString: ComplexType = GWSAMPLEBASICEntitiesMetadataParser.parsed.complexType(withName: "GWSAMPLE_BASIC.CT_String")
    }

    public class EntityTypes {
        public static var businessPartner: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.BusinessPartner")

        public static var contact: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.Contact")

        public static var product: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.Product")

        public static var salesOrder: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.SalesOrder")

        public static var salesOrderLineItem: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.SalesOrderLineItem")

        public static var vhAddressType: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_AddressType")

        public static var vhBPRole: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_BPRole")

        public static var vhCategory: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_Category")

        public static var vhCountry: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_Country")

        public static var vhCurrency: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_Currency")

        public static var vhLanguage: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_Language")

        public static var vhProductTypeCode: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_ProductTypeCode")

        public static var vhSex: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_Sex")

        public static var vhUnitLength: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_UnitLength")

        public static var vhUnitQuantity: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_UnitQuantity")

        public static var vhUnitWeight: EntityType = GWSAMPLEBASICEntitiesMetadataParser.parsed.entityType(withName: "GWSAMPLE_BASIC.VH_UnitWeight")
    }

    public class EntitySets {
        public static var businessPartnerSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "BusinessPartnerSet")

        public static var contactSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "ContactSet")

        public static var productSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "ProductSet")

        public static var salesOrderLineItemSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "SalesOrderLineItemSet")

        public static var salesOrderSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "SalesOrderSet")

        public static var vhAddressTypeSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_AddressTypeSet")

        public static var vhBPRoleSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_BPRoleSet")

        public static var vhCategorySet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_CategorySet")

        public static var vhCountrySet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_CountrySet")

        public static var vhCurrencySet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_CurrencySet")

        public static var vhLanguageSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_LanguageSet")

        public static var vhProductTypeCodeSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_ProductTypeCodeSet")

        public static var vhSexSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_SexSet")

        public static var vhUnitLengthSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_UnitLengthSet")

        public static var vhUnitQuantitySet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_UnitQuantitySet")

        public static var vhUnitWeightSet: EntitySet = GWSAMPLEBASICEntitiesMetadataParser.parsed.entitySet(withName: "VH_UnitWeightSet")
    }

    public class ActionImports {
        public static var regenerateAllData: DataMethod = GWSAMPLEBASICEntitiesMetadataParser.parsed.dataMethod(withName: "RegenerateAllData")

        public static var salesOrderCancel: DataMethod = GWSAMPLEBASICEntitiesMetadataParser.parsed.dataMethod(withName: "SalesOrder_Cancel")

        public static var salesOrderConfirm: DataMethod = GWSAMPLEBASICEntitiesMetadataParser.parsed.dataMethod(withName: "SalesOrder_Confirm")

        public static var salesOrderGoodsIssueCreated: DataMethod = GWSAMPLEBASICEntitiesMetadataParser.parsed.dataMethod(withName: "SalesOrder_GoodsIssueCreated")

        public static var salesOrderInvoiceCreated: DataMethod = GWSAMPLEBASICEntitiesMetadataParser.parsed.dataMethod(withName: "SalesOrder_InvoiceCreated")
    }
}
