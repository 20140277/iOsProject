// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHBPRole: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var bpRole: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhBPRole.property(withName: "BpRole")

    public static var shorttext: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhBPRole.property(withName: "Shorttext")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhBPRole)
    }

    open class func array(from: EntityValueList) -> Array<VHBPRole> {
        return ArrayConverter.convert(from.toArray(), Array<VHBPRole>())
    }

    open var bpRole: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHBPRole.bpRole))
        }
        set(value) {
            self.setOptionalValue(for: VHBPRole.bpRole, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> VHBPRole {
        return CastRequired<VHBPRole>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(bpRole: String?) -> EntityKey {
        return EntityKey().with(name: "BpRole", value: StringValue.of(optional: bpRole))
    }

    open var old: VHBPRole {
        return CastRequired<VHBPRole>.from(self.oldEntity)
    }

    open var shorttext: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHBPRole.shorttext))
        }
        set(value) {
            self.setOptionalValue(for: VHBPRole.shorttext, to: StringValue.of(optional: value))
        }
    }
}
