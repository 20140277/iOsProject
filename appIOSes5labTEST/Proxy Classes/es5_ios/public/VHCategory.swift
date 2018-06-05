// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class VHCategory: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var category: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCategory.property(withName: "Category")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.vhCategory)
    }

    open class func array(from: EntityValueList) -> Array<VHCategory> {
        return ArrayConverter.convert(from.toArray(), Array<VHCategory>())
    }

    open var category: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VHCategory.category))
        }
        set(value) {
            self.setOptionalValue(for: VHCategory.category, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> VHCategory {
        return CastRequired<VHCategory>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(category: String?) -> EntityKey {
        return EntityKey().with(name: "Category", value: StringValue.of(optional: category))
    }

    open var old: VHCategory {
        return CastRequired<VHCategory>.from(self.oldEntity)
    }
}
