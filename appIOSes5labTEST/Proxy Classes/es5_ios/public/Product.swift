// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Product: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var productID: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "ProductID")

    public static var typeCode_: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "TypeCode")

    public static var category: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Category")

    public static var name: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Name")

    public static var nameLanguage: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "NameLanguage")

    public static var description: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Description")

    public static var descriptionLanguage: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "DescriptionLanguage")

    public static var supplierID: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "SupplierID")

    public static var supplierName: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "SupplierName")

    public static var taxTarifCode: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "TaxTarifCode")

    public static var measureUnit: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "MeasureUnit")

    public static var weightMeasure: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "WeightMeasure")

    public static var weightUnit: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "WeightUnit")

    public static var currencyCode: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "CurrencyCode")

    public static var price: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Price")

    public static var width: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Width")

    public static var depth: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Depth")

    public static var height: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "Height")

    public static var dimUnit: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "DimUnit")

    public static var createdAt: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "CreatedAt")

    public static var changedAt: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "ChangedAt")

    public static var toSalesOrderLineItems: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "ToSalesOrderLineItems")

    public static var toSupplier: Property = GWSAMPLEBASICEntitiesMetadata.EntityTypes.product.property(withName: "ToSupplier")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: GWSAMPLEBASICEntitiesMetadata.EntityTypes.product)
    }

    open class func array(from: EntityValueList) -> Array<Product> {
        return ArrayConverter.convert(from.toArray(), Array<Product>())
    }

    open var category: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.category))
        }
        set(value) {
            self.setOptionalValue(for: Product.category, to: StringValue.of(optional: value))
        }
    }

    open var changedAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Product.changedAt))
        }
        set(value) {
            self.setOptionalValue(for: Product.changedAt, to: value)
        }
    }

    open func copy() -> Product {
        return CastRequired<Product>.from(self.copyEntity())
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Product.createdAt))
        }
        set(value) {
            self.setOptionalValue(for: Product.createdAt, to: value)
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.currencyCode))
        }
        set(value) {
            self.setOptionalValue(for: Product.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var depth: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.depth))
        }
        set(value) {
            self.setOptionalValue(for: Product.depth, to: DecimalValue.of(optional: value))
        }
    }

    open var description: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.description))
        }
        set(value) {
            self.setOptionalValue(for: Product.description, to: StringValue.of(optional: value))
        }
    }

    open var descriptionLanguage: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.descriptionLanguage))
        }
        set(value) {
            self.setOptionalValue(for: Product.descriptionLanguage, to: StringValue.of(optional: value))
        }
    }

    open var dimUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.dimUnit))
        }
        set(value) {
            self.setOptionalValue(for: Product.dimUnit, to: StringValue.of(optional: value))
        }
    }

    open var height: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.height))
        }
        set(value) {
            self.setOptionalValue(for: Product.height, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(productID: String?) -> EntityKey {
        return EntityKey().with(name: "ProductID", value: StringValue.of(optional: productID))
    }

    open var measureUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.measureUnit))
        }
        set(value) {
            self.setOptionalValue(for: Product.measureUnit, to: StringValue.of(optional: value))
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.name))
        }
        set(value) {
            self.setOptionalValue(for: Product.name, to: StringValue.of(optional: value))
        }
    }

    open var nameLanguage: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.nameLanguage))
        }
        set(value) {
            self.setOptionalValue(for: Product.nameLanguage, to: StringValue.of(optional: value))
        }
    }

    open var old: Product {
        return CastRequired<Product>.from(self.oldEntity)
    }

    open var price: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.price))
        }
        set(value) {
            self.setOptionalValue(for: Product.price, to: DecimalValue.of(optional: value))
        }
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.productID))
        }
        set(value) {
            self.setOptionalValue(for: Product.productID, to: StringValue.of(optional: value))
        }
    }

    open var supplierID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.supplierID))
        }
        set(value) {
            self.setOptionalValue(for: Product.supplierID, to: StringValue.of(optional: value))
        }
    }

    open var supplierName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.supplierName))
        }
        set(value) {
            self.setOptionalValue(for: Product.supplierName, to: StringValue.of(optional: value))
        }
    }

    open var taxTarifCode: Int? {
        get {
            return UnsignedByte.optional(self.optionalValue(for: Product.taxTarifCode))
        }
        set(value) {
            self.setOptionalValue(for: Product.taxTarifCode, to: UnsignedByte.of(optional: value))
        }
    }

    open var toSalesOrderLineItems: Array<SalesOrderLineItem> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: Product.toSalesOrderLineItems)).toArray(), Array<SalesOrderLineItem>())
        }
        set(value) {
            Product.toSalesOrderLineItems.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var toSupplier: BusinessPartner? {
        get {
            return CastOptional<BusinessPartner>.from(self.optionalValue(for: Product.toSupplier))
        }
        set(value) {
            self.setOptionalValue(for: Product.toSupplier, to: value)
        }
    }

    open var typeCode_: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.typeCode_))
        }
        set(value) {
            self.setOptionalValue(for: Product.typeCode_, to: StringValue.of(optional: value))
        }
    }

    open var weightMeasure: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.weightMeasure))
        }
        set(value) {
            self.setOptionalValue(for: Product.weightMeasure, to: DecimalValue.of(optional: value))
        }
    }

    open var weightUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Product.weightUnit))
        }
        set(value) {
            self.setOptionalValue(for: Product.weightUnit, to: StringValue.of(optional: value))
        }
    }

    open var width: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: Product.width))
        }
        set(value) {
            self.setOptionalValue(for: Product.width, to: DecimalValue.of(optional: value))
        }
    }
}
