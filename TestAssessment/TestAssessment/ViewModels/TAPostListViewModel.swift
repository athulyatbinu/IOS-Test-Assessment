//
//  TAPostListViewModel.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 30/05/24.
//

import Foundation

class TAPostListViewModel
{
    var postsArray:[TAPost]?
    
    var onErrorHandling : ((String) -> Void)?
    
    var page = 1
    
    func fetchData()
    {
        Task.init {
            do {
                
                let posts = try await TADataManager.shared.getPosts(page: page)
                
                if postsArray != nil
                {
                    postsArray?.append(contentsOf: posts)
                }
                else
                {
                    postsArray = posts
                }
                
            } catch {
                
                self.onErrorHandling?(error.localizedDescription)
            }
        }
    }
    
    func loadMore()
    {
        page += 1
        
        fetchData()
    }
    
    func numberOfRows() -> Int
    {
        return postsArray?.count ?? 0
    }
    
    func postForRow(indexPath:IndexPath) -> TAPost
    {
        postsArray![indexPath.row]
    }
    
    func getNewListIndex() -> IndexPath
    {
        return postsArray?.count ?? 0 > APIConstants.kLimitValue ? IndexPath.init(row: postsArray!.count - APIConstants.kLimitValue - 1 , section: 0) : IndexPath.init(row: 0, section: 0)
    }
}
