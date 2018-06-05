// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class SalesOrderLineItem: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var salesOrderID: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "SalesOrderID")

    public static var itemPosition: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "ItemPosition")

    public static var productID: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "ProductID")

    public static var note: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "Note")

    public static var noteLanguage: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "NoteLanguage")

    public static var currencyCode: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "CurrencyCode")

    public static var grossAmount: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "GrossAmount")

    public static var netAmount: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "NetAmount")

    public static var taxAmount: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "TaxAmount")

    public static var deliveryDate: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "DeliveryDate")

    public static var quantity: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "Quantity")

    public static var quantityUnit: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "QuantityUnit")

    public static var toHeader: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "ToHeader")

    public static var toProduct: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem.property(withName: "ToProduct")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrderLineItem)
    }

    open class func array(from: EntityValueList) -> Array<SalesOrderLineItem> {
        return ArrayConverter.convert(from.toArray(), Array<SalesOrderLineItem>())
    }

    open func copy() -> SalesOrderLineItem {
        return CastRequired<SalesOrderLineItem>.from(self.copyEntity())
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderLineItem.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var deliveryDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: SalesOrderLineItem.deliveryDate))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.deliveryDate, to: value)
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderLineItem.grossAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open var itemPosition: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderLineItem.itemPosition))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.itemPosition, to: StringValue.of(optional: value))
        }
    }

    open class func key(salesOrderID: String?, itemPosition: String?) -> EntityKey {
        return EntityKey().with(name: "SalesOrderID", value: StringValue.of(optional: salesOrderID)).with(name: "ItemPosition", value: StringValue.of(optional: itemPosition))
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderLineItem.netAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var note: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderLineItem.note))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.note, to: StringValue.of(optional: value))
        }
    }

    open var noteLanguage: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderLineItem.noteLanguage))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.noteLanguage, to: StringValue.of(optional: value))
        }
    }

    open var old: SalesOrderLineItem {
        return CastRequired<SalesOrderLineItem>.from(self.oldEntity)
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderLineItem.productID))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.productID, to: StringValue.of(optional: value))
        }
    }

    open var quantity: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderLineItem.quantity))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.quantity, to: DecimalValue.of(optional: value))
        }
    }

    open var quantityUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderLineItem.quantityUnit))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.quantityUnit, to: StringValue.of(optional: value))
        }
    }

    open var salesOrderID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderLineItem.salesOrderID))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.salesOrderID, to: StringValue.of(optional: value))
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderLineItem.taxAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.taxAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var toHeader: SalesOrder? {
        get {
            return CastOptional<SalesOrder>.from(self.optionalValue(for: SalesOrderLineItem.toHeader))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.toHeader, to: value)
        }
    }

    open var toProduct: Product? {
        get {
            return CastOptional<Product>.from(self.optionalValue(for: SalesOrderLineItem.toProduct))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrderLineItem.toProduct, to: value)
        }
    }
}
