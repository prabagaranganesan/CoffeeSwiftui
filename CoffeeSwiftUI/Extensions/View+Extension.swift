//
//  View+Extension.swift
//  CoffeeSwiftUI
//
//  Created by Prabhagaran Ganesan on 10/06/23.
//

import SwiftUI

extension View {
    
    func inject(_ interactors: DIContainer.Interacters) -> some View {
        let container = DIContainer(interactors: interactors)
        return inject(container)
    }
    
    func inject(_ container: DIContainer) -> some View {
        return self
            .environment(\.injected, container)
    }
}


extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}
