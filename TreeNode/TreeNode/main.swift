//
//  main.swift
//  TreeNode
//
//  Created by 李小龙 on 2019/1/9.
//  Copyright © 2019 李小龙. All rights reserved.
//

import Foundation

print("Hello, World!")

public class TreeNode {
    public var val : Int
    public var left : TreeNode?
    public var right : TreeNode?
    public init(_val : Int) {
        self.val = _val
    }
}

// 计算树的最大深度
func maxDepth(root : TreeNode?) -> Int {
    
    guard let root = root else {
        return 0
    }
    
    return max(maxDepth(root: root.left), maxDepth(root: root.right) + 1)
}

// 判断一颗二叉树是否为二叉查找树
func isVaildBST(root: TreeNode?) -> Bool {
    
    return _helper(node:root, nil , nil)
}

private func _helper(node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
    
    guard let node = node else {
        return true
    }
    
    // 所有右子节点都必须大于根节点
    if let min = min , node.val <= min {
        return false
    }
    
    // 所有左子节点都必须小于根节点
    if let max = max , node.val >= max {
        return false
    }
    
    return _helper(node: node.left, min, node.val) && _helper(node: node.right, node.val, max)
}

// 用栈实现的前序遍历
func preorderTraversal(root: TreeNode?) -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var node = root
    
    while !stack.isEmpty || node != nil {
        if node != nil  {
            res.append(node!.val)
            stack.append(node!)
            node = node!.left
            
        }else{
           node = stack.removeLast().right
        }
    }
    
    return res
}


//请设计一个应用可以展示一颗二叉树。
func levelOrder(root: TreeNode?) -> [[Int]] {
    var res =  [[Int]]()
    //// 用数组来实现队列
    var queue = [TreeNode]()
    
    if let root = root {
        queue.append(root)
    }
    
    while queue.count > 0{
        var size = queue.count
        var level = [Int]()
        
        for _ in 0 ..< size {
            let node = queue.removeFirst()
            
            level.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        
        res.append(level)
    }
    
    return res
}
