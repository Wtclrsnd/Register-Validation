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
        }
        struct Response {
            var login: String
            var password: String
            var status: Status
        }
        struct ViewModel {
            var login: String
            var password: String
            var status: Status
        }
    }
}

enum Status {
    case sucsess, failed
}
