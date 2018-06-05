// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class CTAddress: ComplexValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var city: Property = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "City")

    public static var postalCode: Property = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "PostalCode")

    public static var street: Property = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "Street")

    public static var building: Property = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "Building")

    public static var country: Property = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "Country")

    public static var addressType: Property = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress.property(withName: "AddressType")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctAddress)
    }

    open var addressType: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CTAddress.addressType))
        }
        set(value) {
            self.setOptionalValue(for: CTAddress.addressType, to: StringValue.of(optional: value))
        }
    }

    open var building: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CTAddress.building))
        }
        set(value) {
            self.setOptionalValue(for: CTAddress.building, to: StringValue.of(optional: value))
        }
    }

    open var city: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CTAddress.city))
        }
        set(value) {
            self.setOptionalValue(for: CTAddress.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> CTAddress {
        return CastRequired<CTAddress>.from(self.copyComplex())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CTAddress.country))
        }
        set(value) {
            self.setOptionalValue(for: CTAddress.country, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open var old: CTAddress {
        return CastRequired<CTAddress>.from(self.oldComplex)
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CTAddress.postalCode))
        }
        set(value) {
            self.setOptionalValue(for: CTAddress.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var street: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CTAddress.street))
        }
        set(value) {
            self.setOptionalValue(for: CTAddress.street, to: StringValue.of(optional: value))
        }
    }
}
