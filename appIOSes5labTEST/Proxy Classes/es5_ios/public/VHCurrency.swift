// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHCurrency: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var waers: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCurrency.property(withName: "Waers")

    public static var ltext: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCurrency.property(withName: "Ltext")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCurrency)
    }

    open class func array(from: EntityValueList) -> Array<VHCurrency> {
        return ArrayConverter.convert(from.toArray(), Array<VHCurrency>())
    }

    open func copy() -> VHCurrency {
        return CastRequired<VHCurrency>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(waers: String?) -> EntityKey {
        return EntityKey().with(name: "Waers", value: StringValue.of(optional: waers))
    }

    open var ltext: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHCurrency.ltext))
        }
        set(value) {
            self.setOptionalValue(for: VHCurrency.ltext, to: StringValue.of(optional: value))
        }
    }

    open var old: VHCurrency {
        return CastRequired<VHCurrency>.from(self.oldEntity)
    }

    open var waers: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHCurrency.waers))
        }
        set(value) {
            self.setOptionalValue(for: VHCurrency.waers, to: StringValue.of(optional: value))
        }
    }
}
