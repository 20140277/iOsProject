// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHAddressType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var addressType: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhAddressType.property(withName: "AddressType")

    public static var shorttext: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhAddressType.property(withName: "Shorttext")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhAddressType)
    }

    open var addressType: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHAddressType.addressType))
        }
        set(value) {
            self.setOptionalValue(for: VHAddressType.addressType, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<VHAddressType> {
        return ArrayConverter.convert(from.toArray(), Array<VHAddressType>())
    }

    open func copy() -> VHAddressType {
        return CastRequired<VHAddressType>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(addressType: String?) -> EntityKey {
        return EntityKey().with(name: "AddressType", value: StringValue.of(optional: addressType))
    }

    open var old: VHAddressType {
        return CastRequired<VHAddressType>.from(self.oldEntity)
    }

    open var shorttext: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHAddressType.shorttext))
        }
        set(value) {
            self.setOptionalValue(for: VHAddressType.shorttext, to: StringValue.of(optional: value))
        }
    }
}
