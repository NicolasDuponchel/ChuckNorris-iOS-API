import Foundation
import SwiftyJSON
import Moya_SwiftyJSONMapper

class ChuckNorrisResponse : NSObject, ALSwiftyJSONAble {
    var type: String
    var joke: Joke
    
    required init?(jsonData: JSON) {
        let type = jsonData["type"]
        let value = jsonData["value"]
        
        self.type = type.stringValue
        self.joke = value == JSON.null
            ? Joke(id: 0, text: "vide")
            : Joke(jsonData: value)
    }
}
