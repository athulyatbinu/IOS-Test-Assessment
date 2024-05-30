//
//  TADataManager.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 29/05/24.
//

import Foundation

import Alamofire

class TADataManager:NSObject
{
    //MARK: - Declarations -
    
    static let shared = TADataManager()
    
    //MARK: - Funcation to Handle Posts Data Request -
    
    func getPosts(page:Int = 1) async throws -> [TAPost]
    {
        let headers :  HTTPHeaders = ["content-type": "application/json"]
        
        let url = APIConstants.TAAPI_baseUrl + APIConstants.TAAPI_posts
        
        let params = [APIConstants.kPageKey : page,
                      
                      APIConstants.kLimitKey:APIConstants.kLimitValue] as [String:Any]
        
        return try await withCheckedThrowingContinuation { continuation in
            
            AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default,headers: headers).response { response in
                
                if let data = response.data, let posts = try? JSONDecoder().decode([TAPost].self, from: data)
                {
                    continuation.resume(returning: posts)
                }
                else{
                    
                    continuation.resume(throwing:TAError.runtimeError(Strings.str_Default_APIError))
                }
            }.resume()
        }

    }
}
