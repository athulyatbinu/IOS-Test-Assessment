//
//  TAPostListViewModel.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 30/05/24.
//

import Foundation

class TAPostListViewModel
{
    //MARK: - Declarations
    
    var postsArray:[TAPost]?
    
    var onErrorHandling : ((String) -> Void)?
    
    var page = 1
    
    var isLoading = false
    
    //MARK: Data Fetching related Methods
    
    func fetchData() async
    {
        guard !isLoading else { return }
        
        isLoading = true
        
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
            
            isLoading = false
            
        } catch {
            
            self.onErrorHandling?(error.localizedDescription)
            
            isLoading = false
        }
    }
    
    func loadMore() async
    {
        page += 1
        
        await fetchData()
    }
    
    //MARK: - UI related helper methods -
    
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
