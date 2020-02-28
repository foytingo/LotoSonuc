//
//  SonucManager.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 27.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import Foundation

struct SonucManager {
    
    static let shared = SonucManager()
    
    let baseuUrl = "http://www.mpi.gov.tr/sonuclar/cekilisler/"
    
    func getDates(for gameName: String, completed: @escaping (Result<[[String : String]],LSError>) ->Void){
        
        let endPoint = "http://www.mpi.gov.tr/sonuclar/listCekilisleriTarihleri.php?tur=" + gameName
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidGameNameOrDate))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
               
                if let json = (try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))) as? [[String : String]] {
                    completed(.success(json))
                }
            } catch{
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
        
        
        
    }
    
    func getSonuc(for gameName:String, date dateValue:String, completed: @escaping (Result<SonucData,LSError>) ->Void){
        
        let endPoint = baseuUrl + gameName + dateValue + ".json"
        print(endPoint)
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidGameNameOrDate))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(SonucData.self, from: data)
                completed(.success(decodedData))
            } catch{
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
        
    }
}
