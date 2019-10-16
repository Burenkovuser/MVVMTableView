//
//  DetailViewModel.swift
//  MVVMTableView
//
//  Created by Vasilii on 16.10.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    
    
    private var profile: Profile
    
    var description: String {
        return String(describing: "\(profile.name) \(profile.secondname) is \(profile.age) old")
    }
    
    var age: Box<String?> = Box(nil)
    
    init(profile: Profile) {
        self.profile = profile
    }
}
