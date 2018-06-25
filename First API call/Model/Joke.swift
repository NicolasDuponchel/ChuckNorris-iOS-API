import Foundation
import SwiftyJSON
import Moya_SwiftyJSONMapper

class Joke : NSObject, ALSwiftyJSONAble {
    var id: Int = 0
    var text: String = "vide"
    
    required init(jsonData: JSON) {
        id = jsonData["id"].intValue
        text = jsonData["joke"].string!
    }
}
