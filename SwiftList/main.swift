//
//  main.swift
//  SwiftList
//
//  Created by Moonbeom KWON on 2017. 6. 15..
//  Copyright © 2017년 mbkyle. All rights reserved.
//

import Foundation


let list = myList<Int>.apply(values: [1, 2, 3, 4, 5])

print(list.sum(ints: list))
print(list.product(ds: list))
print(list.getHead(list: list))
print(list.getTail(list: list))
print(list.drop(count: 3, list: list))
print(list.dropWhile(list: list, f: { $0 < 3 }))
