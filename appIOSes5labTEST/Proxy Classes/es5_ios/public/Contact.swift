// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Contact: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var address: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Address")

    public static var contactGuid: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "ContactGuid")

    public static var businessPartnerID: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "BusinessPartnerID")

    public static var title: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Title")

    public static var firstName: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "FirstName")

    public static var middleName: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "MiddleName")

    public static var lastName: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "LastName")

    public static var nickname: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Nickname")

    public static var initials: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Initials")

    public static var sex: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Sex")

    public static var phoneNumber: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "PhoneNumber")

    public static var faxNumber: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "FaxNumber")

    public static var emailAddress: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "EmailAddress")

    public static var language: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "Language")

    public static var dateOfBirth: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "DateOfBirth")

    public static var toBusinessPartner: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact.property(withName: "ToBusinessPartner")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.contact)
    }

    open var address: CTAddress? {
        get {
            return CastOptional<CTAddress>.from(self.optionalValue(for: Contact.address))
        }
        set(value) {
            self.setOptionalValue(for: Contact.address, to: value)
        }
    }

    open class func array(from: EntityValueList) -> Array<Contact> {
        return ArrayConverter.convert(from.toArray(), Array<Contact>())
    }

    open var businessPartnerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.businessPartnerID))
        }
        set(value) {
            self.setOptionalValue(for: Contact.businessPartnerID, to: StringValue.of(optional: value))
        }
    }

    open var contactGuid: GuidValue? {
        get {
            return GuidValue.castOptional(self.optionalValue(for: Contact.contactGuid))
        }
        set(value) {
            self.setOptionalValue(for: Contact.contactGuid, to: value)
        }
    }

    open func copy() -> Contact {
        return CastRequired<Contact>.from(self.copyEntity())
    }

    open var dateOfBirth: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Contact.dateOfBirth))
        }
        set(value) {
            self.setOptionalValue(for: Contact.dateOfBirth, to: value)
        }
    }

    open var emailAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.emailAddress))
        }
        set(value) {
            self.setOptionalValue(for: Contact.emailAddress, to: StringValue.of(optional: value))
        }
    }

    open var faxNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.faxNumber))
        }
        set(value) {
            self.setOptionalValue(for: Contact.faxNumber, to: StringValue.of(optional: value))
        }
    }

    open var firstName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.firstName))
        }
        set(value) {
            self.setOptionalValue(for: Contact.firstName, to: StringValue.of(optional: value))
        }
    }

    open var initials: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.initials))
        }
        set(value) {
            self.setOptionalValue(for: Contact.initials, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(contactGuid: GuidValue?) -> EntityKey {
        return EntityKey().with(name: "ContactGuid", value: contactGuid)
    }

    open var language: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.language))
        }
        set(value) {
            self.setOptionalValue(for: Contact.language, to: StringValue.of(optional: value))
        }
    }

    open var lastName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.lastName))
        }
        set(value) {
            self.setOptionalValue(for: Contact.lastName, to: StringValue.of(optional: value))
        }
    }

    open var middleName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.middleName))
        }
        set(value) {
            self.setOptionalValue(for: Contact.middleName, to: StringValue.of(optional: value))
        }
    }

    open var nickname: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.nickname))
        }
        set(value) {
            self.setOptionalValue(for: Contact.nickname, to: StringValue.of(optional: value))
        }
    }

    open var old: Contact {
        return CastRequired<Contact>.from(self.oldEntity)
    }

    open var phoneNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.phoneNumber))
        }
        set(value) {
            self.setOptionalValue(for: Contact.phoneNumber, to: StringValue.of(optional: value))
        }
    }

    open var sex: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.sex))
        }
        set(value) {
            self.setOptionalValue(for: Contact.sex, to: StringValue.of(optional: value))
        }
    }

    open var title: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Contact.title))
        }
        set(value) {
            self.setOptionalValue(for: Contact.title, to: StringValue.of(optional: value))
        }
    }

    open var toBusinessPartner: BusinessPartner? {
        get {
            return CastOptional<BusinessPartner>.from(self.optionalValue(for: Contact.toBusinessPartner))
        }
        set(value) {
            self.setOptionalValue(for: Contact.toBusinessPartner, to: value)
        }
    }
}
