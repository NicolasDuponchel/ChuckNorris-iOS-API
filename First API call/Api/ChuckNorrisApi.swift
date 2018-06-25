import Foundation
import Moya

enum ChuckNorrisApi : TargetType {
    case random()
    case withName(firstName: String, lastName: String)
    
    var baseURL: URL { return URL(string: "http://api.icndb.com/jokes")! }
    var path: String { return "/random" }
    var method: Moya.Method { return .get }
    var sampleData: Data { return Data() }
    var headers: [String : String]? { return ["Accept-Language":"fr-fr"] }
    var parameterEncoding: Moya.ParameterEncoding { return URLEncoding.default }
    
    var task: Task {
        switch self {
        case .random():
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .withName(let firstName, let lastName):
            let params: [String: Any] = ["firstName": firstName, "lastName": lastName]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
}

