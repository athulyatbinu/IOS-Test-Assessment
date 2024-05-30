//
//  TAPostTableViewCell.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 30/05/24.
//

import UIKit

class TAPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    
    func update(post:TAPost)
    {
        titleLabel.text = post.title ?? ""
        
        idLabel.text = "Id: \(post.id ?? 0)"
        
        detailLabel?.text = (post.body != nil) ? performIntensiveComputation(for: post.body!) : "NA"
    }
    
    func performIntensiveComputation(for text: String) -> String {
        
        // Simulate intensive computation
        
        let startTime = CFAbsoluteTimeGetCurrent()
        
        var result = text
        
        for _ in 0..<10000 {
            
            result = String(result.reversed())
        }
        
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        
        print("Time elapsed for computation: \(timeElapsed) seconds")
        
        return result
    }
}
