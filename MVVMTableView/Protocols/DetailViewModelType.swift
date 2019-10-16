//
//  DetailViewModelType.swift
//  MVVMTableView
//
//  Created by Vasilii on 16.10.2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
