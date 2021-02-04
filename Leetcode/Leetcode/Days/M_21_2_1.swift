//
//  21_2_1.swift
//  Leetcode
//
//  Created by JO-Ma on 2021/2/1.
//

/*
 
 杨辉三角问题
 
 思路:

 第一层循环控制行数i : 默认 [i][0] = 1,[i][i] = 1
 第二层循环控制列数j : triangle[i][j] = triangle[i-1][j-1] + triangle[i-1][j]
 
 */

import Foundation

class M_21_2_1 {
    /// 二维数组
    public struct Array2D {
        let rows: Int
        let cols: Int
        fileprivate var array: [Int]
        
        public init(rows: Int, cols: Int, value: Int) {
            self.rows = rows
            self.cols = cols
            array = .init(repeating: value, count: rows * cols)
        }
        
        // 重写下标
        public subscript(_ row: Int, _ col: Int) -> Int {
            get {
                return array[row * cols + col]
            }
            set {
                array[row * cols + col] = newValue
            }
        }
    }

    // 系统方法
    // var arr2D = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10) // -> arr2D[i][j]

    /// 生成杨辉三角二维数组
    func generate(_ numRows: Int) -> Array2D {
        var arr2D = Array2D(rows: numRows, cols: numRows, value: 0)
        
        for i in 0..<numRows {
            arr2D[i, 0] = 1
            arr2D[i, i] = 1
            
            if i > 1 {
                for j in 1..<i {
                    arr2D[i, j] = arr2D[i-1, j] + arr2D[i-1, j-1]
                }
            }
        }
        
        return arr2D
    }

    func main() {
        let size = 10
        let arr2D = generate(size)
    
        // 打印结果
        for i in 0..<size {
            print("[", terminator: "")
            for j in 0...i {
                print(" \(arr2D[i, j]) ", terminator: "")
            }
            print("]")
        }
    }
}
