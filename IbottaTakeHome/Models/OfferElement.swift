// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let offerElement = try OfferElement(json)

import Foundation

// MARK: - OfferElement
struct OfferElement: Codable, Model {
    let id: String?
    let url: String?
    let name, offerDescription, terms, currentValue: String?

    enum CodingKeys: String, CodingKey {
        case id, url, name
        case offerDescription = "description"
        case terms
        case currentValue = "current_value"
    }
}

// MARK: OfferElement convenience initializers and mutators

extension OfferElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(OfferElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String?? = nil,
        url: String?? = nil,
        name: String?? = nil,
        offerDescription: String?? = nil,
        terms: String?? = nil,
        currentValue: String?? = nil
    ) -> OfferElement {
        return OfferElement(
            id: id ?? self.id,
            url: url ?? self.url,
            name: name ?? self.name,
            offerDescription: offerDescription ?? self.offerDescription,
            terms: terms ?? self.terms,
            currentValue: currentValue ?? self.currentValue
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
