import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var joke: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onNewJokeRequested() { getJoke() }
    
    func getJoke() {
        _ = ChuckNorrisService()
            .getJoke()
            .subscribe(
                onSuccess: { response in self.joke.text = response.joke.text },
                onError: { error in self.joke.text = error.localizedDescription })
    }
}

