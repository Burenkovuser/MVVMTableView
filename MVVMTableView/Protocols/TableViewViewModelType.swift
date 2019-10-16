//
//  TableViewModelType.swift
//  MVVMTableView
//
//  Created by Vasilii on 16.10.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

protocol TableViewViewModelType {
    
    func numberOfRows() -> Int
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
    
    
    // для передачи данных в DetailVC
    func viewModelForSelectedRow() -> DetailViewModelType?
    // вспомогательный метод для перехода
    func selectedRow(atIndexPath indexPath: IndexPath)
    
    //var numberOfRows: Int { get }
    //var profiles: [Profile] { get }
}
