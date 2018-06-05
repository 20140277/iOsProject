// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHCountry: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var land1: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCountry.property(withName: "Land1")

    public static var landx: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCountry.property(withName: "Landx")

    public static var natio: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCountry.property(withName: "Natio")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCountry)
    }

    open class func array(from: EntityValueList) -> Array<VHCountry> {
        return ArrayConverter.convert(from.toArray(), Array<VHCountry>())
    }

    open func copy() -> VHCountry {
        return CastRequired<VHCountry>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(land1: String?) -> EntityKey {
        return EntityKey().with(name: "Land1", value: StringValue.of(optional: land1))
    }

    open var land1: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHCountry.land1))
        }
        set(value) {
            self.setOptionalValue(for: VHCountry.land1, to: StringValue.of(optional: value))
        }
    }

    open var landx: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHCountry.landx))
        }
        set(value) {
            self.setOptionalValue(for: VHCountry.landx, to: StringValue.of(optional: value))
        }
    }

    open var natio: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHCountry.natio))
        }
        set(value) {
            self.setOptionalValue(for: VHCountry.natio, to: StringValue.of(optional: value))
        }
    }

    open var old: VHCountry {
        return CastRequired<VHCountry>.from(self.oldEntity)
    }
}
