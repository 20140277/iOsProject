// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHLanguage: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var spras: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhLanguage.property(withName: "Spras")

    public static var sptxt: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhLanguage.property(withName: "Sptxt")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhLanguage)
    }

    open class func array(from: EntityValueList) -> Array<VHLanguage> {
        return ArrayConverter.convert(from.toArray(), Array<VHLanguage>())
    }

    open func copy() -> VHLanguage {
        return CastRequired<VHLanguage>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(spras: String?) -> EntityKey {
        return EntityKey().with(name: "Spras", value: StringValue.of(optional: spras))
    }

    open var old: VHLanguage {
        return CastRequired<VHLanguage>.from(self.oldEntity)
    }

    open var spras: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHLanguage.spras))
        }
        set(value) {
            self.setOptionalValue(for: VHLanguage.spras, to: StringValue.of(optional: value))
        }
    }

    open var sptxt: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHLanguage.sptxt))
        }
        set(value) {
            self.setOptionalValue(for: VHLanguage.sptxt, to: StringValue.of(optional: value))
        }
    }
}
