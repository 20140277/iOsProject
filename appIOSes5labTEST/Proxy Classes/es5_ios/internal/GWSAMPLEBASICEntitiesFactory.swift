// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

internal class GWSAMPLEBASICEntitiesFactory {
    static func registerAll() throws {
        GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.registerFactory(ObjectFactory.with(create: { CTAddress(withDefaults: false) }, createWithDecoder: { d in try CTAddress(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctString.registerFactory(ObjectFactory.with(create: { CTString(withDefaults: false) }, createWithDecoder: { d in try CTString(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.registerFactory(ObjectFactory.with(create: { BusinessPartner(withDefaults: false) }, createWithDecoder: { d in try BusinessPartner(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.registerFactory(ObjectFactory.with(create: { Contact(withDefaults: false) }, createWithDecoder: { d in try Contact(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.registerFactory(ObjectFactory.with(create: { Product(withDefaults: false) }, createWithDecoder: { d in try Product(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.registerFactory(ObjectFactory.with(create: { SalesOrder(withDefaults: false) }, createWithDecoder: { d in try SalesOrder(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.registerFactory(ObjectFactory.with(create: { SalesOrderLineItem(withDefaults: false) }, createWithDecoder: { d in try SalesOrderLineItem(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhAddressType.registerFactory(ObjectFactory.with(create: { VHAddressType(withDefaults: false) }, createWithDecoder: { d in try VHAddressType(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhBPRole.registerFactory(ObjectFactory.with(create: { VHBPRole(withDefaults: false) }, createWithDecoder: { d in try VHBPRole(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCategory.registerFactory(ObjectFactory.with(create: { VHCategory(withDefaults: false) }, createWithDecoder: { d in try VHCategory(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCountry.registerFactory(ObjectFactory.with(create: { VHCountry(withDefaults: false) }, createWithDecoder: { d in try VHCountry(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCurrency.registerFactory(ObjectFactory.with(create: { VHCurrency(withDefaults: false) }, createWithDecoder: { d in try VHCurrency(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhLanguage.registerFactory(ObjectFactory.with(create: { VHLanguage(withDefaults: false) }, createWithDecoder: { d in try VHLanguage(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhProductTypeCode.registerFactory(ObjectFactory.with(create: { VHProductTypeCode(withDefaults: false) }, createWithDecoder: { d in try VHProductTypeCode(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhSex.registerFactory(ObjectFactory.with(create: { VHSex(withDefaults: false) }, createWithDecoder: { d in try VHSex(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitLength.registerFactory(ObjectFactory.with(create: { VHUnitLength(withDefaults: false) }, createWithDecoder: { d in try VHUnitLength(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitQuantity.registerFactory(ObjectFactory.with(create: { VHUnitQuantity(withDefaults: false) }, createWithDecoder: { d in try VHUnitQuantity(from: d) }))
        GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitWeight.registerFactory(ObjectFactory.with(create: { VHUnitWeight(withDefaults: false) }, createWithDecoder: { d in try VHUnitWeight(from: d) }))
        GWSAMPLEBASICEntitiesStaticResolver.resolve()
    }
}
