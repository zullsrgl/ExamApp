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
    
    //MARK: ViewDidLoad
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        ApiCaller.shared.getQuestion { result in
            switch result {
            case.success(let data) :
                print("başarılı : \(data)")
            case.failure(let error):
                print("error : \(error)")
            }
            
        }
    }
    @IBAction func tuchUpInsideExit(_ sender: Any) {
        //alert message
        let alert = UIAlertController(title: "Exit The Exam", message: "Are you sure?", preferredStyle: .actionSheet)
        let exitAction = UIAlertAction(title: "Exit", style: .default) { _ in
            if  let navigationController = self.navigationController {
                navigationController.popToRootViewController(animated: true)
            }
            else {
                self.dismiss(animated: true, completion: nil)
            }
            
        }
        alert.addAction(exitAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUpInsideNext(_ sender: Any) {
        //next question
    
    }
}


extension ExamViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionViewCell", for: indexPath) as! QuestionCollectionViewCell
  
        cell.btnQuestion.setTitle("cevap:  \(indexPath.item)", for: .normal)
        return cell
    }
    

}
