//
//  ExamViewController.swift
//  ExamApp
//
//  Created by Zülal Sarıoğlu on 23.02.2024.
//

import UIKit

class ExamViewController: UIViewController {

    @IBOutlet weak var btnExit: UIButton! {
        didSet {
            btnExit.layer.cornerRadius = btnExit.frame.height / 2
        }
    }
    @IBOutlet weak var btnNext: UIButton! {
        didSet {
            btnNext.layer.cornerRadius = btnExit.frame.height / 2
        }
    }
    @IBOutlet weak var collectionViewQuestion: UICollectionView!
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        collectionViewQuestion.delegate = self
        collectionViewQuestion.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 60, left: 60, bottom: 60, right: 60)
        layout.itemSize = CGSize(width: view.frame.size.width/3.3,
                                 height: view.frame.size.height/5.5)
        
        collectionViewQuestion.collectionViewLayout = layout
        collectionViewQuestion.register(UINib(nibName: "QuestionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QuestionCollectionViewCell")
        
 
        
    
        
    }
    
}


extension ExamViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionViewCell", for: indexPath) as! QuestionCollectionViewCell
        
        return cell
    }
    

}
