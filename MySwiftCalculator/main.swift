//
//  main.swift
//  MySwiftCalculator
//
//  Created by BPIMA_ALW1090 on 12/3/24.
//

import Foundation

//This is the welcome message
print("Welcome to MySwiftCalculator")
var choice:String;

/**
    We use a repeat-while to keep looping until user input an value different of "y"
 */
repeat{
    
    //This is the message prompt to console
    print("Enter first number: ", terminator: "")
    
    //Getting the first number as optional or nil
    let firstNum:Double? = Double(readLine()!) ?? nil;
    
    //This is the message prompt to console
    print("Enter second number: ", terminator: "")
    
    //Getting the second number as optional or nil
    let secondNum:Double? = Double(readLine()!) ?? nil;
    
    print("Validating numbers...")
    //Validating numbers or show an error message
    if !validateNumbers(num1:firstNum, num2:secondNum){
        print("Invalid numbers")
    }else{
        let number1 = firstNum ?? 0.0
        let number2 = secondNum ?? 0.0
        print("Enter operation (+,-,*,/): ", terminator: "")
        
        let operation:String = readLine() ?? "";
        
        let result: Double? = calculate(num1:number1, num2:number2, operation:operation);
        
        print(result != nil ? "Result: \(result!.formatWithTwoDecimals())" : "")
        
    }
    
    //This is the message prompt to console
    print("Do you want to continue? (y): ", terminator: "")
    //Getting the response from user to continue
    choice = readLine() ?? "";
    
}while choice.lowercased() == "y";

    
/**
    This function is used to do the calculation based on the num and operation input by the user.
    Show an error message for invalid operation and division by zero.
 */
func calculate(num1:Double, num2:Double, operation:String)->Double?{
    var result:Double?=nil;
    switch(operation){
  
    case "+":
        result = num1 + num2;
        break;
    case "-":
        result = num1 - num2;
        break;
    case "*":
        result = num1 * num2;
        break;
        
    case "/":
        guard num2 != 0.0 else{
            print("Cannot divide by zero")
            return nil;
        }
        result = num1 / num2;
        break;
        
    default:
      print("Invalid operation")
    }
    
    return result;
}
/**
    This functionality is used to ensure that the user input is a valid number.
 */
func validateNumbers(num1:Double?, num2:Double?) -> Bool{
    return num1 != nil && num2 != nil
}


//This code was search in the internet to help showing only two decimal spaces
extension Double {
    func formatWithTwoDecimals() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? String(format: "%.2f", self)
    }
}



