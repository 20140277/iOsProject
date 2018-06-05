// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

internal class GWSAMPLEBASICEntitiesMetadataParser {
    internal static let options: Int = (CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = GWSAMPLEBASICEntitiesMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = GWSAMPLEBASICEntitiesMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(GWSAMPLEBASICEntitiesMetadataText.xml, url: "GWSAMPLE_BASIC")
        metadata.proxyVersion = "17.12.4-8c3504-20180321"
        return metadata
    }
}
