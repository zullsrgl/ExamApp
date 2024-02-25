//
//  QuestionCollectionViewCell.swift
//  ExamApp
//
//  Created by Zülal Sarıoğlu on 23.02.2024.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var btnQuestion: UIButton! {
        didSet{
            btnQuestion.titleLabel?.font = UIFont(name: "Arial", size: 24)
            btnQuestion.tintColor = .white
            btnQuestion.layer.cornerRadius = 24
       
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func touchUpInsideQuestion(_ sender: Any) {
    }
}
