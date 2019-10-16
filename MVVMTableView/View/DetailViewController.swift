//
//  DetailViewController.swift
//  MVVMTableView
//
//  Created by Vasilii on 16.10.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var viewModel: DetailViewModelType?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.textLabel.text = viewModel.description
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.age.bind(listener: { [unowned self] in
            
            guard let string = $0 else { return }
            self.textLabel.text = string
        })
        delayn(delay: 5) { [unowned self] in
            self.viewModel?.age.value = "some new value"
        }
    }

    
    private func delayn(delay: Double, clouser: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            clouser()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
