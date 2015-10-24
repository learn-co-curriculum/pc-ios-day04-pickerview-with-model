//
//  ViewController.swift
//  week4A
//
//  Created by Flatiron School on 10/24/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerData = ["Sports", "Geography", "Politics"]
    let factsDict = ["Sports": "Hank Aaron is the all-time Home run leader", "Geography": "The Capital of Hungary is Budapest", "Politics": "The new Prime Minister of Canada is a former school teacher." ]
//    var factsArray = [Fact]?
    var myFacts: [Fact]?
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myPicker.dataSource = self
        myPicker.delegate = self

        let sportsFact = Fact(content: "the yankees are the greatest baseball team", category: "Sports")
        let geographyFact = Fact(content: "washington dc is the capital of USA", category: "Geography")
        let politicsFact = Fact(content: "george washington was the first president of USA", category: "Politics")

        myFacts = [sportsFact, geographyFact, politicsFact]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myFacts!.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let fact = myFacts![row]
        let category = fact.category
        return category
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let fact = myFacts![row]
        let content = fact.content
        appear(myLabel)
        myLabel.text = content
        dissapear(myLabel)
    }
    
    func dissapear(label: UILabel){
        UIView.animateWithDuration(1.0, animations: {
            label.alpha = 0
        })
    }

    func appear(label: UILabel){
        UIView.animateWithDuration(1.0, animations: {
            label.alpha = 1
        })
    }

}

