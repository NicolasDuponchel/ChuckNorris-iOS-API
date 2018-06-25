import Foundation
import Moya
import RxSwift

class ChuckNorrisService {
    static let shared = ChuckNorrisService()
    
    //Provider Moya
    let provider : MoyaProvider<ChuckNorrisApi>
    
    init() {
        provider = MoyaProvider<ChuckNorrisApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }
    
    
    //MARK: API
    func getJoke(firstName: String, lastName: String) -> Single<ChuckNorrisResponse> {
        return Single.create { single in
            self.provider.request(.random(firstName: firstName, lastName: lastName)){
                result in
                switch result {
                
                case .success(let response):
                    if (200 ... 300).contains(response.statusCode) {
                        do {
                            try single(.success(response.map(to: ChuckNorrisResponse.self)))
                        } catch {
                            print("fail to parse response")
                            single(.error(error))
                        }
                    } else {
                        single(.error(ChuckNorrisApiError.invalideStatusCode))
                    }
                    
                case .failure(let error):
                    single(.error(error))
                }
                
                
            }
            return Disposables.create()
        }
    }
    
}
