// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHUnitWeight: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var msehi: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitWeight.property(withName: "Msehi")

    public static var msehl: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitWeight.property(withName: "Msehl")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhUnitWeight)
    }

    open class func array(from: EntityValueList) -> Array<VHUnitWeight> {
        return ArrayConverter.convert(from.toArray(), Array<VHUnitWeight>())
    }

    open func copy() -> VHUnitWeight {
        return CastRequired<VHUnitWeight>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(msehi: String?) -> EntityKey {
        return EntityKey().with(name: "Msehi", value: StringValue.of(optional: msehi))
    }

    open var msehi: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHUnitWeight.msehi))
        }
        set(value) {
            self.setOptionalValue(for: VHUnitWeight.msehi, to: StringValue.of(optional: value))
        }
    }

    open var msehl: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHUnitWeight.msehl))
        }
        set(value) {
            self.setOptionalValue(for: VHUnitWeight.msehl, to: StringValue.of(optional: value))
        }
    }

    open var old: VHUnitWeight {
        return CastRequired<VHUnitWeight>.from(self.oldEntity)
    }
}
