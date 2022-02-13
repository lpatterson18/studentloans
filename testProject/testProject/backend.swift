//
//  backend.swift
//  testProject
//
//  Created by Luke Patterson on 2/12/22.
//

import Foundation
//
//  Loan_calculatorApp.swift
//  Loan calculator
//
//  Created by Luke Patterson and Christopher Phan on 2/12/22.
//
import SwiftUI

/*struct Loan_calculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}*/

//k = Monthly Pay, r = APR, S = balance
/*
func HowManyDay (k: Double, r: Double, S: Double) -> Int {
  let DailyInterest: Double = r / 365
  var Months: Int = 0

  while (S > 0) {
    S = S * pow(1 + DailyInterest, 365.0/12)
    S -= k
    Months++
  }

  return Months
}

k is monthly payment. S*interest rate. = interest paid that month. k-s is what you subtract from the principal balance.

*/
//Note: r is in percent, not decimal
func HowLong (k: Double, r: Double, S: Double) -> Int{
  var Months: Int = 0
  var rd: Double = r/100
  var Sd: Double = S
  rd = rd / 12
  var interestPaid: Double
  while(Sd>0){
    interestPaid = Sd*rd
    Sd -= k - interestPaid      //Sd * rd is the interest that's been paid
    Months += 1
  }
  return Months
}
/*
func HowMuchPay (t: Int, r: Double, S: Double) -> Double {
  var A: Double = pow(1 + r/365, 365.0/12)
  var k: Double = S * pow(A, t) * (A - 1)/(pow(A, t) - 1)
  return k
}
*/
//t = time in months of paying off loan.
//r = APR
//S = Loan Balance
/*
func HowMuchPay (t: Int, r: Double, S: Double) -> Double{
  var rd: Double = r/100
  rd = rd/12
  var k: Double = S * rd * pow(1 + rd, t)/(pow(1 + rd, t) - 1)
  return k
}*/

//Note: r is in percent, not decimal
func HowMuchPay (t: Double, r: Double, S: Double) -> Double{
  var rd: Double = r/100
  rd = rd/12
  let k: Double = S * rd / (1-pow(1+rd, -t))
  return k
}

//Note: r is in percent, not decimal
func HowMuchLeft (t: Int, r: Double, S:Double, k: Double) -> Double{
  var rd: Double = r/100
  rd = rd/12
  //var i: Int
    var Sd: Double = S
    

  for _ in 0...t {
    Sd -= k - Sd*rd     //Sd * rd is the interest that's been paid
  }

  if Sd < 0 {
    Sd = 0
  }
  return Sd
}
