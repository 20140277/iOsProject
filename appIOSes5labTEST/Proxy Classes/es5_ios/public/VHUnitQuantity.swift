// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHUnitQuantity: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var msehi: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitQuantity.property(withName: "Msehi")

    public static var msehl: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitQuantity.property(withName: "Msehl")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitQuantity)
    }

    open class func array(from: EntityValueList) -> Array<VHUnitQuantity> {
        return ArrayConverter.convert(from.toArray(), Array<VHUnitQuantity>())
    }

    open func copy() -> VHUnitQuantity {
        return CastRequired<VHUnitQuantity>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(msehi: String?) -> EntityKey {
        return EntityKey().with(name: "Msehi", value: StringValue.of(optional: msehi))
    }

    open var msehi: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHUnitQuantity.msehi))
        }
        set(value) {
            self.setOptionalValue(for: VHUnitQuantity.msehi, to: StringValue.of(optional: value))
        }
    }

    open var msehl: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHUnitQuantity.msehl))
        }
        set(value) {
            self.setOptionalValue(for: VHUnitQuantity.msehl, to: StringValue.of(optional: value))
        }
    }

    open var old: VHUnitQuantity {
        return CastRequired<VHUnitQuantity>.from(self.oldEntity)
    }
}
