//
//  Binding+Extension.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 18/06/23.
//

import SwiftUI

extension Binding where Value: Equatable {
    typealias ValueClosure = (Value) -> Void
    
    func onSet(_ perform: @escaping ValueClosure) -> Self {
        return .init(get: { () -> Value in
            self.wrappedValue
        }, set: { value in
            if self.wrappedValue != value {
                self.wrappedValue = value
            }
            perform(value)
        })
    }
}
