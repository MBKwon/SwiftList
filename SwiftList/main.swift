//
//  main.swift
//  SwiftList
//
//  Created by Moonbeom KWON on 2017. 6. 15..
//  Copyright © 2017년 mbkyle. All rights reserved.
//

import Foundation

print("Hello, World!")



indirect enum myList <A> {
    case Nil
    case Cons(head: A, tail: myList)
}


extension myList {
    
    func sum<A: ExpressibleByIntegerLiteral>(ints: myList) -> A {
        
        switch self {
        case .Nil:
            return 0
            
        case .Cons(head: let a, tail: let b):
            return a + sum(ints: b)
            
        default:
            return 0
        }
    }
    
    func product<A: ExpressibleByFloatLiteral>(ds: myList) -> A {
        
        switch self {
        case .Nil:
            return 1.0
            
        case .Cons(head: let a, tail: let b):
            return a * product(ds: b)
            
        default:
            return 1.0
        }
    }
    
    func apply<A>(values: A...) -> myList<A>? {
        
        if values.count == 0 {
            return .Nil    
        } else {
            .Cons(values.first, apply(values: values.dropFirst()))
        }
    }
}
