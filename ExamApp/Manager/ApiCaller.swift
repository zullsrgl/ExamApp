//
//  ApiCaller.swift
//  ExamApp
//
//  Created by Zülal Sarıoğlu on 23.02.2024.
//

import Foundation
import Alamofire

class ApiCaller  {
    static let shared = ApiCaller()
    
    func getQuestion (completion : (Result<[QuizResponse] , Error>) -> Void){
        guard let url = URL(string: "https://opentdb.com/api.php?amount=50") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard  let data = data , error == nil else {return}
            do {
                let result = try JSONDecoder().decode(QuizResponse.self, from: data)
                print("api caller okey \(result)")
                
            }catch {
                print("error : \(error)")
                
            }
        }
        task.resume()
    }
    
}
