// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class CTString: ComplexValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var string: Property = GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctString.property(withName: "String")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.ComplexTypes.ctString)
    }

    open func copy() -> CTString {
        return CastRequired<CTString>.from(self.copyComplex())
    }

    open override var isProxy: Bool {
        return true
    }

    open var old: CTString {
        return CastRequired<CTString>.from(self.oldComplex)
    }

    open var string: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CTString.string))
        }
        set(value) {
            self.setOptionalValue(for: CTString.string, to: StringValue.of(optional: value))
        }
    }
}
