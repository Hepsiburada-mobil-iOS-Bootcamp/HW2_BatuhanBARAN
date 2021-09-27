//
//  GenericValueProtocol.swift
//  PermissionProject
//
//  Created by Batuhan BARAN on 26.09.2021.
//

import Foundation

protocol GenericValueProtocol {
    associatedtype Value
    var value: Value { get }
}
