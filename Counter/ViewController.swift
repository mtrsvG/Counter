//
//  ViewController.swift
//  Counter
//
//  Created by Георгий Матросов on 25.04.2023.
//

import UIKit

var count = 0
var text = ""


class ViewController: UIViewController {
    
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    
    @IBAction func decreseCount(_ sender: Any) {
        decreseTheCount()
    }
    @IBAction func increaseCount(_ sender: Any) {
        increaseTheCount()
    }
    @IBAction func resetCount(_ sender: Any) {
        resetTheCount()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStartingView()
        // Do any additional setup after loading the view.
    }
    
    func setUpLabel (){
        counterLabel.text = String(count)
    }

    func increaseTheCount(){
        count += 1
        setUpLabel()
        text = getCurrentDateTime() + ": значение изменено на +1 \n"
        addInfoAboutAction(text)
    }
    
    func decreseTheCount() {
        if count == 0 {
            text = getCurrentDateTime() + ": попытка уменьшить значение счётчика ниже 0 \n"
            addInfoAboutAction(text)
        } else{
            count -= 1
            setUpLabel()
            text = getCurrentDateTime() + ": значение изменено на -1 \n"
            addInfoAboutAction(text)
        }
    }
    
    func resetTheCount(){
        count = 0
        setUpLabel()
        text = getCurrentDateTime() + ": значение сброшено \n"
        addInfoAboutAction(text)
    }
    
    func getCurrentDateTime() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return "\(dateFormatter.string(from: date))"
        
    }
    // Функция вывода информации в текстовое поле с ее автопрокруткой
    func addInfoAboutAction(_ text: String){
        historyTextView.text += text
        let range = NSRange(location: historyTextView.text.count - 1, length: 0)
        historyTextView.scrollRangeToVisible(range)
    }
}
extension ViewController{
    func setUpStartingView() {
        counterLabel.text = String(count)
        historyTextView.isEditable = false
        historyTextView.font = UIFont(name: "System", size: 10)
        historyTextView.text = "История изменений: \n"
    }
}

