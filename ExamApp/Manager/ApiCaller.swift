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

    func getQuestion (completion : @escaping (Result<[QuizQuestion] , Error>) -> Void){
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard  let data = data , error == nil else {return}
            do {
                let result = try JSONDecoder().decode(QuizResponse.self, from: data)
              // print("api caller okey (result)")
                completion(Result.success(result.results))
            }catch {
                print("error : (error)")
                completion(Result.failure(error))
            }
        }
        task.resume()
    }

}
