//
//  ServiceResult.swift
//  ChuckNorris
//
//  Created by Caique on 14/09/18.
//  Copyright © 2018 Vasconcelos. All rights reserved.
//

import Foundation

public enum ServiceResult<Value> {
    case success(Value)
    case failure(String)
    
    public init(_ value: Value) {
        self = .success(value)
    }
    
    public init(_ error: String) {
        self = .failure(error)
    }
    
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    var value: Value? {
        switch self {
        case .success(let value): return value
        default:
            return nil
        }
    }
    
    var error: String? {
        switch self {
        case .failure(let err): return err
        default:
            return nil
        }
    }
    
}
