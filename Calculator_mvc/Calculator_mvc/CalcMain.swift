//
//  CalcMain.swift
//  Calculator_mvc
//
//  Created by Еркебулан Кундызбеков on 9/18/19.
//  Copyright © 2019 Еркебулан Кундызбеков. All rights reserved.
//

import Foundation


class CalcMain{
    var accumulator = 0.0
    
    func setOperand (operand:Double){
        accumulator = operand
    }
    
    var Operations : Dictionary<String,operation> = [
        "%" : operation.UnaryOperation({$0/100}),
        "Sqrt" : operation.UnaryOperation(sqrt),
        "*" : operation.BinaryOperation({$0*$1}),
        "/" : operation.BinaryOperation({$0/$1}),
        "+" : operation.BinaryOperation({$0+$1}),
        "-" : operation.BinaryOperation({$0-$1}),
        "=" : operation.Equals,
        "C" : operation.Clear
    ]
    
    enum operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
        case Clear
    }
    
    func performOperation (symbol:String){
        if let operation = Operations[symbol]{
            switch operation{
            case .Constant(let value) : accumulator = value
            case .UnaryOperation(let function) : accumulator = function(accumulator)
            case .BinaryOperation(let function) :
                executeEquals()
                pending = pendingBinaryOperationInfo(binaryOperation: function, firstOperand:accumulator)
            case .Equals : executeEquals()
            case .Clear : accumulator = 0
            }
        }
        
    }
    
    func executeEquals () {
        if pending != nil {
            accumulator = pending!.binaryOperation(pending!.firstOperand, accumulator)
            pending = nil
        }
        
    }
    
    var pending : pendingBinaryOperationInfo?
    
    struct pendingBinaryOperationInfo{
        var binaryOperation : (Double, Double) -> Double
        var firstOperand : Double
    }
    
    
    var result : Double {
        get {
            return accumulator
            
        }
    }
    
   
}
