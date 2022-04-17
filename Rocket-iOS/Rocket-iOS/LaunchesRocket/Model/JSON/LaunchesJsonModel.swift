import Foundation

struct LaunchesJsonModel: Decodable {
    var name: String?
    var date_utc: String?
    var rocket: String?
    var success: Bool?
}
