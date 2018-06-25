import Foundation
import Moya

enum ChuckNorrisApi {
    case random(firstName: String, lastName: String)
}

enum ChuckNorrisApiError : Error {
    case invalideStatusCode
}

extension ChuckNorrisApi : TargetType {
    var baseURL: URL {
        return URL(string: "http://api.icndb.com/jokes")!
    }
    
    var path: String {
        switch self {
        case .random(_, _):
            return "/random"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .random(_, _):
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .random(let firstName, let lastName):
            var params: [String: Any] = [:]
            params["firstName"] = firstName
            params["lastName"] = lastName
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    // Optional here
    var headers: [String : String]? {
        return ["Accept-Language":"fr-fr"]
    }
    
    // Optional here
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .random(_, _):
            return URLEncoding.default
        }
    }
    
}
