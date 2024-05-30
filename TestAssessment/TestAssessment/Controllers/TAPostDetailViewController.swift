//
//  TAPostDetailViewController.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 30/05/24.
//

import UIKit

class TAPostDetailViewController: UIViewController {
    
    //MARK: - Declarations
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var post: TAPost?
    
    //MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpView()
    }
    
    //MARK: - Other Functions
    
    func setUpView()
    {
        titleLabel.text = post?.title ?? ""
        
        idLabel.text = "Id: \(post?.id ?? 0)"
        
        detailLabel.text = (post?.body != nil) ? TAComputationCacheManager.shared.performIntensiveComputation(for: post!.body!) : "NA"
    }
}
