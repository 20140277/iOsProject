// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class BusinessPartner: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var address: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "Address")

    public static var businessPartnerID: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "BusinessPartnerID")

    public static var companyName: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "CompanyName")

    public static var webAddress: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "WebAddress")

    public static var emailAddress: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "EmailAddress")

    public static var phoneNumber: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "PhoneNumber")

    public static var faxNumber: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "FaxNumber")

    public static var legalForm: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "LegalForm")

    public static var currencyCode: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "CurrencyCode")

    public static var businessPartnerRole: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "BusinessPartnerRole")

    public static var createdAt: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "CreatedAt")

    public static var changedAt: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "ChangedAt")

    public static var toSalesOrders: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "ToSalesOrders")

    public static var toContacts: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "ToContacts")

    public static var toProducts: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner.property(withName: "ToProducts")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.businessPartner)
    }

    open var address: CTAddress? {
        get {
            return CastOptional<CTAddress>.from(self.optionalValue(for: BusinessPartner.address))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.address, to: value)
        }
    }

    open class func array(from: EntityValueList) -> Array<BusinessPartner> {
        return ArrayConverter.convert(from.toArray(), Array<BusinessPartner>())
    }

    open var businessPartnerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BusinessPartner.businessPartnerID))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.businessPartnerID, to: StringValue.of(optional: value))
        }
    }

    open var businessPartnerRole: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BusinessPartner.businessPartnerRole))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.businessPartnerRole, to: StringValue.of(optional: value))
        }
    }

    open var changedAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: BusinessPartner.changedAt))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.changedAt, to: value)
        }
    }

    open var companyName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BusinessPartner.companyName))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.companyName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> BusinessPartner {
        return CastRequired<BusinessPartner>.from(self.copyEntity())
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: BusinessPartner.createdAt))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.createdAt, to: value)
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BusinessPartner.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var emailAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BusinessPartner.emailAddress))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.emailAddress, to: StringValue.of(optional: value))
        }
    }

    open var faxNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BusinessPartner.faxNumber))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.faxNumber, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(businessPartnerID: String?) -> EntityKey {
        return EntityKey().with(name: "BusinessPartnerID", value: StringValue.of(optional: businessPartnerID))
    }

    open var legalForm: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BusinessPartner.legalForm))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.legalForm, to: StringValue.of(optional: value))
        }
    }

    open var old: BusinessPartner {
        return CastRequired<BusinessPartner>.from(self.oldEntity)
    }

    open var phoneNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BusinessPartner.phoneNumber))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.phoneNumber, to: StringValue.of(optional: value))
        }
    }

    open var toContacts: Array<Contact> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: BusinessPartner.toContacts)).toArray(), Array<Contact>())
        }
        set(value) {
            BusinessPartner.toContacts.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var toProducts: Array<Product> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: BusinessPartner.toProducts)).toArray(), Array<Product>())
        }
        set(value) {
            BusinessPartner.toProducts.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var toSalesOrders: Array<SalesOrder> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: BusinessPartner.toSalesOrders)).toArray(), Array<SalesOrder>())
        }
        set(value) {
            BusinessPartner.toSalesOrders.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var webAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BusinessPartner.webAddress))
        }
        set(value) {
            self.setOptionalValue(for: BusinessPartner.webAddress, to: StringValue.of(optional: value))
        }
    }
}
