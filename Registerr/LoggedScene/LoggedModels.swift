//
//  LoggedModels.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum Logged {
    enum InitForm {
        struct Request {}
        struct Response {
            var loginStatus: Status
            var passwordStatus: Status
        }
        struct ViewModel {
            var loginStatus: Status
            var passwordStatus: Status
        }
    }
}
