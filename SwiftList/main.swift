//
//  main.swift
//  SwiftList
//
//  Created by Moonbeom KWON on 2017. 6. 15..
//  Copyright © 2017년 mbkyle. All rights reserved.
//

import Foundation

print("Hello, World!")

protocol NumericType {
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
    static func %(lhs: Self, rhs: Self) -> Self
    
    init(_ v: Int)
    init(_ v: Float)
    init(_ v: Double)
}

extension Double : NumericType {}
extension Float  : NumericType {}
extension Int    : NumericType {}
extension Int8   : NumericType {}
extension Int16  : NumericType {}
extension Int32  : NumericType {}
extension Int64  : NumericType {}
extension UInt   : NumericType {}
extension UInt8  : NumericType {}
extension UInt16 : NumericType {}
extension UInt32 : NumericType {}
extension UInt64 : NumericType {}



indirect enum myList <A: NumericType> {
    case Nil
    case Cons(head: A, tail: myList<A>)
}


extension myList {
    
    func sum<T: NumericType>(ints: myList<T>) -> T {
        
        switch self {
        case .Nil:
            return T(0)
            
        case .Cons(head: let a, tail: let b):
            return a + sum(ints: b) as! T
            
        default:
            return T(0)
        }
    }
    
    func product<T: NumericType>(ds: myList<T>) -> T {
        
        switch self {
        case .Nil:
            return T(1.0)
            
        case .Cons(head: let a, tail: let b):
            return a * product(ds: b) as! T
            
        default:
            return T(1.0)
        }
    }
    
    func apply<T: NumericType>(values: T...) -> myList<T> {
        
        if values.count == 0 {
            return .Nil
        } else {
            if let first = values.first {
                return .Cons(first, apply(values: Array<T>(values.dropFirst())) )
            }
            
            return .Nil
        }
    }
    
    func apply<T: NumericType>(values: [T]) -> myList<T> {
        
        if values.count == 0 {
            return .Nil
        } else {
            if let first = values.first {
                return .Cons(first, apply(values: Array<T>(values.dropFirst())) )
            }
            
            return .Nil
        }
    }
}



