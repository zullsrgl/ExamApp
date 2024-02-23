//
//  ViewController.swift
//  ExamApp
//
//  Created by Zülal Sarıoğlu on 23.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnStart: UIButton! {
        didSet{
            btnStart.layer.cornerRadius = btnStart.frame.height / 2
        }
    }
    @IBOutlet weak var btnTopics: UIButton!{
        didSet {
            btnTopics.layer.cornerRadius = btnTopics.frame.height / 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startTouchUpInside(_ sender: Any) {
    }
    
    @IBAction func topicsTouchUpInside(_ sender: Any) {
    }
}

