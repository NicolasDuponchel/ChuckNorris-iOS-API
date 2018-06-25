import Foundation
import Moya
import RxSwift

class ChuckNorrisService {
    static let shared = ChuckNorrisService()
    let provider : MoyaProvider<ChuckNorrisApi>
    
    init() {
        provider = MoyaProvider<ChuckNorrisApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }
    
    func getJoke() -> Single<ChuckNorrisResponse> {
        return Single.create { single in
            self.provider.request(.random()){
                result in
                switch result {
                case .success(let response):
                    do {
                        try single(.success(response.map(to: ChuckNorrisResponse.self)))
                    } catch { single(.error(error)) }
                case .failure(let error):
                    single(.error(error))
                }
            }
            return Disposables.create()
        }
    }
    
    func getJoke(firstName: String, lastName: String) -> Single<ChuckNorrisResponse> {
        return Single.create { single in
            self.provider.request(.withName(firstName: firstName, lastName: lastName)){
                result in
                switch result {
                case .success(let response):
                    do {
                        try single(.success(response.map(to: ChuckNorrisResponse.self)))
                    } catch { single(.error(error)) }
                case .failure(let error):
                    single(.error(error))
                }
                
            }
            return Disposables.create()
        }
    }
    
}
