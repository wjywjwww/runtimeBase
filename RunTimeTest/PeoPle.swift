//
//  PeoPle.swift
//  RunTimeTest
//
//  Created by sks on 16/6/30.
//  Copyright © 2016年 WJY. All rights reserved.
//

import UIKit

class PeoPle:NSObject,UITableViewDelegate {
    var name:String = ""
    var sex:String = ""
    var age:Int = 0
    var height:Float = 0.0
    var job:String = ""
    var native:String = ""
    var education:String = ""
     override init() {
        super.init()
       print("初始化成功")
    }
    var delegate:PeopleDelegate?
    func eat(){
        delegate?.peopleDelegateToWork()
    }
    func sleep(){
        
    }
    func work(){
        
    }
    
}
protocol PeopleDelegate {
    func peopleDelegateToWork()
}
