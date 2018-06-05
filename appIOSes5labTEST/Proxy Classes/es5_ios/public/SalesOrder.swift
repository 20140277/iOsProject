// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class SalesOrder: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var salesOrderID: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "SalesOrderID")

    public static var note: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "Note")

    public static var noteLanguage: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "NoteLanguage")

    public static var customerID: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "CustomerID")

    public static var customerName: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "CustomerName")

    public static var currencyCode: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "CurrencyCode")

    public static var grossAmount: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "GrossAmount")

    public static var netAmount: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "NetAmount")

    public static var taxAmount: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "TaxAmount")

    public static var lifecycleStatus: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "LifecycleStatus")

    public static var lifecycleStatusDescription: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "LifecycleStatusDescription")

    public static var billingStatus: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "BillingStatus")

    public static var billingStatusDescription: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "BillingStatusDescription")

    public static var deliveryStatus: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "DeliveryStatus")

    public static var deliveryStatusDescription: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "DeliveryStatusDescription")

    public static var createdAt: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "CreatedAt")

    public static var changedAt: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "ChangedAt")

    public static var toBusinessPartner: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "ToBusinessPartner")

    public static var toLineItems: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder.property(withName: "ToLineItems")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.salesOrder)
    }

    open class func array(from: EntityValueList) -> Array<SalesOrder> {
        return ArrayConverter.convert(from.toArray(), Array<SalesOrder>())
    }

    open var billingStatus: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.billingStatus))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.billingStatus, to: StringValue.of(optional: value))
        }
    }

    open var billingStatusDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.billingStatusDescription))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.billingStatusDescription, to: StringValue.of(optional: value))
        }
    }

    open var changedAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: SalesOrder.changedAt))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.changedAt, to: value)
        }
    }

    open func copy() -> SalesOrder {
        return CastRequired<SalesOrder>.from(self.copyEntity())
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: SalesOrder.createdAt))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.createdAt, to: value)
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var customerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.customerID))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.customerID, to: StringValue.of(optional: value))
        }
    }

    open var customerName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.customerName))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.customerName, to: StringValue.of(optional: value))
        }
    }

    open var deliveryStatus: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.deliveryStatus))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.deliveryStatus, to: StringValue.of(optional: value))
        }
    }

    open var deliveryStatusDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.deliveryStatusDescription))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.deliveryStatusDescription, to: StringValue.of(optional: value))
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrder.grossAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(salesOrderID: String?) -> EntityKey {
        return EntityKey().with(name: "SalesOrderID", value: StringValue.of(optional: salesOrderID))
    }

    open var lifecycleStatus: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.lifecycleStatus))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.lifecycleStatus, to: StringValue.of(optional: value))
        }
    }

    open var lifecycleStatusDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.lifecycleStatusDescription))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.lifecycleStatusDescription, to: StringValue.of(optional: value))
        }
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrder.netAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var note: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.note))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.note, to: StringValue.of(optional: value))
        }
    }

    open var noteLanguage: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.noteLanguage))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.noteLanguage, to: StringValue.of(optional: value))
        }
    }

    open var old: SalesOrder {
        return CastRequired<SalesOrder>.from(self.oldEntity)
    }

    open var salesOrderID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrder.salesOrderID))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.salesOrderID, to: StringValue.of(optional: value))
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrder.taxAmount))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.taxAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var toBusinessPartner: BusinessPartner? {
        get {
            return CastOptional<BusinessPartner>.from(self.optionalValue(for: SalesOrder.toBusinessPartner))
        }
        set(value) {
            self.setOptionalValue(for: SalesOrder.toBusinessPartner, to: value)
        }
    }

    open var toLineItems: Array<SalesOrderLineItem> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: SalesOrder.toLineItems)).toArray(), Array<SalesOrderLineItem>())
        }
        set(value) {
            SalesOrder.toLineItems.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }
}
