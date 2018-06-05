// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHSex: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var sex: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhSex.property(withName: "Sex")

    public static var shorttext: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhSex.property(withName: "Shorttext")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhSex)
    }

    open class func array(from: EntityValueList) -> Array<VHSex> {
        return ArrayConverter.convert(from.toArray(), Array<VHSex>())
    }

    open func copy() -> VHSex {
        return CastRequired<VHSex>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(sex: String?) -> EntityKey {
        return EntityKey().with(name: "Sex", value: StringValue.of(optional: sex))
    }

    open var old: VHSex {
        return CastRequired<VHSex>.from(self.oldEntity)
    }

    open var sex: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHSex.sex))
        }
        set(value) {
            self.setOptionalValue(for: VHSex.sex, to: StringValue.of(optional: value))
        }
    }

    open var shorttext: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHSex.shorttext))
        }
        set(value) {
            self.setOptionalValue(for: VHSex.shorttext, to: StringValue.of(optional: value))
        }
    }
}
