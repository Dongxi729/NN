//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"




enum Movement: Int {
    case Left = 0
    case Right = 1
    case Top = 2
    case Bottom = 3
}

print(Movement.Top.rawValue)
print(Movement.RawValue())