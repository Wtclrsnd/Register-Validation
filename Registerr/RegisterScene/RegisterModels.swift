//
//  RegisterModels.swift
//  Registerr
//
//  Created by Emil Shpeklord on 28.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum Register {
    enum InitForm {
        struct Request {
            var login: String
            var password: String
            var loginStatus: Status
            var passwordStatus: Status
        }
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

enum Status {
    case isEmpty, isLong, isShort, notEntered, entered, correct, incorrect
}
