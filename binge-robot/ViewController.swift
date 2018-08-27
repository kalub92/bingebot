//
//  ViewController.swift
//  binge-robot
//
//  Created by Caleb Stultz on 8/27/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showsLabel: UILabel!
    @IBOutlet weak var randomShowLabel: UILabel!
    @IBOutlet weak var bingebotSpokenLabel: UILabel!
    @IBOutlet weak var addShowTextField: UITextField!
    @IBOutlet weak var addShowBtn: UIButton!
    @IBOutlet weak var randomShowStackView: UIStackView!
    @IBOutlet weak var addShowStackView: UIStackView!
    @IBOutlet weak var showsStackView: UIStackView!
    
    var shows: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showsStackView.isHidden = true
        randomShowStackView.isHidden = true
        randomShowLabel.isHidden = true
        bingebotSpokenLabel.isHidden = true
    }
    
    func updateShowsLabel() {
        showsLabel.text = shows.joined(separator: ", ")
    }

    @IBAction func randomBingeBtnWasPressed(_ sender: Any) {
        randomShowLabel.text = shows.randomElement()
        randomShowLabel.isHidden = false
        bingebotSpokenLabel.isHidden = false
    }
    
    @IBAction func addShowBtnWasPressed(_ sender: Any) {
        guard let showName = addShowTextField.text else { return }
        shows.append(showName)
        updateShowsLabel()
        showsStackView.isHidden = false
        addShowTextField.text = ""
        
        if shows.count > 1 {
            randomShowStackView.isHidden = false
            randomShowLabel.isHidden = true
            bingebotSpokenLabel.isHidden = true
        }
    }
}

