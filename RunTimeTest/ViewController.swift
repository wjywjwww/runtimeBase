//
//  ViewController.swift
//  RunTimeTest
//
//  Created by sks on 16/6/30.
//  Copyright © 2016年 WJY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func 全局变量(_ sender: UIButton) {
        var count:UInt32 = 0
        let  ivars = class_copyIvarList(PeoPle.self, &count)
        for i in 0   ..< Int(count)  {
            let ivar = ivars?[i]
            if ivar != nil{
                let tempName = String(cString: ivar_getName(ivar!))
                print("变量名：\(tempName)")
            }
        }
        free(ivars)
    }
    @IBAction func 属性(_ sender: UIButton) {
        var count:UInt32 = 0
        let properties = class_copyPropertyList(PeoPle.self, &count)
        for i in 0 ..< Int(count){
            let property = properties?[i];
            if property != nil{
                let propertyName = String(cString: property_getName(property!))
                print("属性名：\(propertyName)")
            }
        }
        free(properties)
    }
    @IBAction func 方法(_ sender: UIButton) {
        var count:UInt32 = 0
        let funcs = class_copyMethodList(PeoPle.self, &count)
        for i in 0 ..< Int(count){
            let sel = sel_getName(method_getName(funcs?[i]))
            let name = String.init(validatingUTF8: sel!)
            let argument = method_getNumberOfArguments(funcs?[i])
            print("方法名:\(name!)"+"参数个数:\(Int(argument))" )
        }
    }
    @IBAction func 遵循代理(_ sender: UIButton) {
        var count:UInt32 = 0
        let protocolArray = class_copyProtocolList(PeoPle.self, &count)
        for index in 0 ..< Int(count){
            let protocolTemp = protocol_getName(protocolArray?[index])
            let name = String.init(validatingUTF8: protocolTemp!)
            print("遵循的协议：\(name!)")
        }
    }
}

