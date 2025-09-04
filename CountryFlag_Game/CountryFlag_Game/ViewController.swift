import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countres = [String]()
    var correctAnswer = 0
    var score = 0
    var totalQuestions = 10
    var numberOfQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countres += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        

        askQuestion()
        }
    
    func askQuestion(action: UIAlertAction? = nil) {
        countres.shuffle()
        button1.setImage(UIImage(named: countres[0]), for: .normal)
        button2.setImage(UIImage(named: countres[1]), for: .normal)
        button3.setImage(UIImage(named: countres[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        
        navigationItem.title = countres[correctAnswer].uppercased()
        navigationItem.prompt = "Score: \(score)"
        
        if numberOfQuestion == totalQuestions {
            let finalAlert = UIAlertController(title: "Game Over", message: "Your total score is \(score)/\(totalQuestions)", preferredStyle: .alert)
            finalAlert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: askQuestion))
            present(finalAlert, animated: true)
            numberOfQuestion = 0
            score = 0
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
        } else {
            score -= 1
            title = "Wrong! That's the flag of \(countres[sender.tag].uppercased())"
        }
        
        numberOfQuestion += 1
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}

