//
//  TAPostDetailViewController.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 30/05/24.
//

import UIKit

class TAPostDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    var post: TAPost?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView()
    {
        titleLabel.text = post?.title ?? ""
        
        idLabel.text = "Id: \(post?.id ?? 0)"
        
        bodyLabel.text = post?.body ?? ""
    }
}
