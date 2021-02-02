//
//  21_2_2.swift
//  Leetcode
//
//  Created by JO-Ma on 2021/2/2.
//

/*
 
 假设正在爬楼梯。需要n阶楼梯才能到达楼顶，每次可以爬1阶或者2阶.一共有多少种方法可以爬到楼顶？给定n为正整数。
 
 */

import Foundation

// 递归
func climb(_ n: Int) -> Int {
    if n < 1 { return 0 }
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    
    return climb(n-1) + climb(n-2)
}

// 动态规划
func climbStairs(_ n: Int) -> Int {
    
    if n == 1 { return 1 }
    
    let tempCount = n + 1
    var sum = [Int](repeating: 0, count: tempCount)
    
    sum[0] = 0
    sum[1] = 1
    sum[2] = 2
    
    for i in 3...n {
        sum[i] = sum[i-1] + sum[i-2]
    }
    
    return sum[n]
}

//func main() {
//    print(climb(5))
//    print(climbStairs(5))
//}
