import Foundation
import SwiftyJSON
import Moya_SwiftyJSONMapper

class ChuckNorrisResponse : NSObject, ALSwiftyJSONAble {
    var type: String
    var joke: Joke
    
    required init?(jsonData: JSON) {
        type = jsonData["type"].stringValue
        joke = Joke(jsonData: jsonData["value"])
    }
}
