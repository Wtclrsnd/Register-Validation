//
//  RegisterRouterMock.swift
//  RegisterrTests
//
//  Created by Emil Shpeklord on 03.05.2022.
//

import Foundation
@testable import Registerr

final class RegisterRouterMock: RegisterRoutingLogic {
    var routerTriggered: Bool = false

    func moveToLogged(viewModel: Register.InitForm.ViewModel) {
        routerTriggered = true
    }
    
    
}
