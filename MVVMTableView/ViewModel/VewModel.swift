//
//  VewModel.swift
//  MVVMTableView
//
//  Created by Vasilii on 16.10.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

class ViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?

   var profiles = [
               Profile(name: "Nessy", secondname: "Masdam", age: 17),
               Profile(name: "Alber", secondname: "Pastushov", age: 34),
               Profile(name: "John", secondname: "Smith", age: 12),
           ]
    //количество строк в таблице
    func numberOfRows() -> Int {
        return profiles.count
    }
    //возращаем ячейку (подприсанную под протокол)
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
    // два метода для передачи данных в DetailVC
    func viewModelForSelectedRow() -> DetailViewModelType? {
        
        guard let selectedIndexPath = selectedIndexPath else { return nil}
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectedRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath //развняется свойству созданному выше
    }
    
    
}
