//
//  myList.swift
//  SwiftList
//
//  Created by Moonbeom KWON on 2017. 6. 15..
//  Copyright © 2017년 mbkyle. All rights reserved.
//

import Foundation


indirect enum myList <A: NumericType> {
    case Nil
    case Cons(A, myList<A>)
}


extension myList {
    
    static func apply<T: NumericType>(values: T...) -> myList<T> {
        
        if values.count == 0 {
            return .Nil
        } else {
            if let first = values.first {
                return .Cons(first, apply(values: Array<T>(values.dropFirst())) )
            }
            
            return .Nil
        }
    }
    
    static func apply<T: NumericType>(values: [T]) -> myList<T> {
        
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

extension myList {
    
    func sum<T: NumericType>(ints: myList<T>) -> T {
        
        switch ints {
        case .Nil:
            return T(0)
            
        case let .Cons(x, xs):
            return x + sum(ints: xs)
        }
    }
    
    func product<T: NumericType>(ds: myList<T>) -> T {
        
        switch ds {
        case .Nil:
            return T(1.0)
            
        case let .Cons(x, xs):
            return x * product(ds: xs)
        }
    }
}

extension myList {
    func getHead<T>(list: myList<T>) -> myList<T> {
        
        switch list {
        case .Nil:
            return .Nil
            
        case let .Cons(x, xs):
            return .Cons(x, xs)
        }
    }
    
    func getTail<T>(list: myList<T>) -> myList<T> {
        
        switch list {
        case .Nil:
            return .Nil
            
        case let .Cons(_, xs):
            return xs
        }
    }
}

extension myList {
    
    func drop<T>(count: Int, list: myList<T>) -> myList<T> {
        
        switch count {
        case 0:
            return list
            
        default:
            return drop(count: count-1, list: getTail(list: list))
        }
    }
    
    func dropWhile<T>(list: myList<T>, f: (T) -> Bool) -> myList<T> {
        
        switch list {
        case let .Cons(x, xs):
            if f(x) {
                return dropWhile(list: xs, f: f)
            }
            fallthrough
            
        default:
            return list
        }
    }
}



