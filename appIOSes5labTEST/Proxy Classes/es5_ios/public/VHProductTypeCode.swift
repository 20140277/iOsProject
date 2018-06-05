// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHProductTypeCode: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var typeCode_: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhProductTypeCode.property(withName: "TypeCode")

    public static var shorttext: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhProductTypeCode.property(withName: "Shorttext")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhProductTypeCode)
    }

    open class func array(from: EntityValueList) -> Array<VHProductTypeCode> {
        return ArrayConverter.convert(from.toArray(), Array<VHProductTypeCode>())
    }

    open func copy() -> VHProductTypeCode {
        return CastRequired<VHProductTypeCode>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(typeCode_: String?) -> EntityKey {
        return EntityKey().with(name: "TypeCode", value: StringValue.of(optional: typeCode_))
    }

    open var old: VHProductTypeCode {
        return CastRequired<VHProductTypeCode>.from(self.oldEntity)
    }

    open var shorttext: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHProductTypeCode.shorttext))
        }
        set(value) {
            self.setOptionalValue(for: VHProductTypeCode.shorttext, to: StringValue.of(optional: value))
        }
    }

    open var typeCode_: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHProductTypeCode.typeCode_))
        }
        set(value) {
            self.setOptionalValue(for: VHProductTypeCode.typeCode_, to: StringValue.of(optional: value))
        }
    }
}
