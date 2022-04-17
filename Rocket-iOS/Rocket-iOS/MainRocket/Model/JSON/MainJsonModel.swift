import Foundation

struct MainJsonModel: Decodable {
    var flickr_images: [String?]

    var name: String?
    var id: String?

    var height: HeightRocket?
    var diameter: DiameterRocket?
    var mass: MassRocket?
    var payload_weights: [PayloadWeights?]

    var first_flight: String?
    var country: String?
    var cost_per_launch: Int?

    var first_stage: FirstStage?
    var second_stage: SecondStage?
}

struct HeightRocket: Decodable {
    var meters: Double?
    var feet: Double?
}

struct DiameterRocket: Decodable {
    var meters: Double?
    var feet: Double?
}

struct MassRocket: Decodable {
    var kg: Int?
    var lb: Int?
}

struct PayloadWeights: Decodable {
    var kg: Int?
    var lb: Int?
}

struct FirstStage: Decodable {
    var engines: Int?
    var fuel_amount_tons: Double?
    var burn_time_sec: Double?
}

struct SecondStage: Decodable {
    var engines: Int?
    var fuel_amount_tons: Double?
    var burn_time_sec: Double?
}
