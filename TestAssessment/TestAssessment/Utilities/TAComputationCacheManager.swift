//
//  TAComputationCacheManager.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 30/05/24.
//

import Foundation

class TAComputationCacheManager
{
    static let shared = TAComputationCacheManager()
    
    private var cache = [String: String]()
    
    func performIntensiveComputation(for text: String) -> String {
       
        if let cachedResult = cache[text] {
            
            return cachedResult
        }
        
        let startTime = CFAbsoluteTimeGetCurrent()
        
        var result = text
        
        for _ in 0..<10000 {
           
            result = String(result.reversed())
        }
        
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        
        print("Time elapsed for computation: \(timeElapsed) seconds")
        
        cache[text] = result
        
        return result
    }
}
