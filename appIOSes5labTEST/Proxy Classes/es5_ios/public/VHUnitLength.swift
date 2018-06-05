// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHUnitLength: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var msehi: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitLength.property(withName: "Msehi")

    public static var msehl: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitLength.property(withName: "Msehl")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitLength)
    }

    open class func array(from: EntityValueList) -> Array<VHUnitLength> {
        return ArrayConverter.convert(from.toArray(), Array<VHUnitLength>())
    }

    open func copy() -> VHUnitLength {
        return CastRequired<VHUnitLength>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(msehi: String?) -> EntityKey {
        return EntityKey().with(name: "Msehi", value: StringValue.of(optional: msehi))
    }

    open var msehi: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHUnitLength.msehi))
        }
        set(value) {
            self.setOptionalValue(for: VHUnitLength.msehi, to: StringValue.of(optional: value))
        }
    }

    open var msehl: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHUnitLength.msehl))
        }
        set(value) {
            self.setOptionalValue(for: VHUnitLength.msehl, to: StringValue.of(optional: value))
        }
    }

    open var old: VHUnitLength {
        return CastRequired<VHUnitLength>.from(self.oldEntity)
    }
}
