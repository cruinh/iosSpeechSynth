import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

class SiriConsoleController : UIViewController, UITextFieldDelegate {
    let synthesizer = AVSpeechSynthesizer()
    let textField = UITextField()
    let textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        textField.placeholder = "Type what you want to say to Siri."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1))
        textField.leftViewMode = .always
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textView)
        view.addSubview(textField)
        var viewsDict = ["textField":textField, "textView":textView]
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[textView]-0-|", options: [], metrics: nil, views: viewsDict))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[textField]-0-|", options: [], metrics: nil, views: viewsDict))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[textView]-0-[textField(50)]-0-|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(constraints)
        
        view.backgroundColor = .white
        textView.backgroundColor = .lightGray
    }
    
    private func speak(_ string: String?) {
        guard let string = string else { return }
        let utterance = AVSpeechUtterance(string: string)
        synthesizer.speak(utterance)
        textView.text = textView.text + "\n" + string
        textField.text = nil
    }
    
    var q_and_a : [String:String] = [
        "how are you" : "I'm fine, thanks",
        
        "whats up" : "I'm just chillin'.  Got a job for me?"
    ]
    
    private func formResponse(toQuestion question:String?) -> String? {
        guard let question = question else { return "I'm sorry. Could you repeat that?" }
        for q in q_and_a.keys {
            if question.lowercased().contains(q) {
                return q_and_a[q]
            }
        }
        return "I'm sorry. Could you repeat that?"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        speak(formResponse(toQuestion: textField.text))
        return false
    }
}

class AI {
    var mood : Float = 0.8
    
}

let navController = UINavigationController(rootViewController: SiriConsoleController())
PlaygroundPage.current.liveView = SiriConsoleController()//navController
