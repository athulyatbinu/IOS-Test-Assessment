//
//  ViewController.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 29/05/24.
//

import UIKit

class TAPostListViewController: UIViewController {
    
    //MARK: - Declarations -

    @IBOutlet weak var postsTabelView: UITableView!
    
    let viewModel = TAPostListViewModel()
    
    //MARK: - Declarations & View Life Cycle-
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getDataAndUpdateView()
    }
    
    //MARK: - Other Functions -
    
    func getDataAndUpdateView()
    {
        self.title = Strings.str_pageTitle_Posts
        
        Task.init {
            
            await viewModel.fetchData()
            
            postsTabelView.reloadData()
        }
    }
    
    func loadMore()
    {
        Task.init {
            
            await viewModel.loadMore()
            
            postsTabelView.reloadData()
            
            scrollToNewList()
        }
    }
    
    func scrollToNewList()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) { [self] in
            
            postsTabelView.scrollToRow(at: viewModel.getNewListIndex(), at: .top, animated: true)
        }
    }
}

//MARK: - TableView Methods -

extension TAPostListViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! TAPostTableViewCell
        
        cell.update(post: viewModel.postForRow(indexPath: indexPath))
        
        cell.selectionStyle = .none
        
        //Pagination
        
        if indexPath.row == (viewModel.postsArray?.count ?? 0) - 1 {
                    loadMore()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailConrtoller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailConrtoller") as! TAPostDetailViewController
        
        detailConrtoller.post = viewModel.postForRow(indexPath: indexPath)
        
        self.navigationController!.pushViewController(detailConrtoller, animated: true)
    }
}

