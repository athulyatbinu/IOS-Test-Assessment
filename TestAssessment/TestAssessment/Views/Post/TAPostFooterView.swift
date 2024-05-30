//
//  TAPostFooterView.swift
//  TestAssessment
//
//  Created by Athulya T Binu on 30/05/24.
//

import UIKit

class TAPostFooterView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var mDelegate: TAPostsDelegate?

    @IBAction func didTapToLoadMore(_ sender: UIButton) {
        
        mDelegate?.didTapToLoadMore()
    }
}
