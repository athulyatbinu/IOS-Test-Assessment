//
//  ViewController.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 29/05/24.
//

import UIKit

class TAPostListViewController: UIViewController {
    
    //MARK: - Declarations & View Life Cycle-

    @IBOutlet weak var postsTabelView: UITableView!
    
    let viewModel = TAPostListViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getDataAndReload()
    }
    
    //MARK: - Other Functions -
    
    func getDataAndReload()
    {
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
        
        return cell
    }
}

