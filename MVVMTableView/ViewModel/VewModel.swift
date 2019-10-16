//
//  VewModel.swift
//  MVVMTableView
//
//  Created by Vasilii on 16.10.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

class ViewModel: TableViewViewModelType {
    
   var profiles = [
               Profile(name: "Nessy", secondname: "Masdam", age: 17),
               Profile(name: "Alber", secondname: "Pastushov", age: 34),
               Profile(name: "John", secondname: "Smith", age: 12),
           ]
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    //возращаем ячейку (подприсанную под протокол)
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
    
}
