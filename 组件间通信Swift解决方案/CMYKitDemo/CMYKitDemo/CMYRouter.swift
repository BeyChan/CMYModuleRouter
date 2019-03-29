//
//  CMYRouter.swift
//  CMYRouter
//
//  Created by  MarvinChan on 2019/3/28.
//

import UIKit

open class CMYRouter: NSObject {
    public static let shared: CMYRouter = CMYRouter()
    private var cachedTarget: [String: NSObject] = [String : NSObject]()
}

extension CMYRouter {
    
    /// 动态调用方法
    ///
    /// - Parameters:
    ///   - space: 模块名称
    ///   - targetName:  Target 的后半部分名称, Target_Login: Login
    ///   - actionName: Action_xXXXX: xXXXXX
    ///   - params: 字典
    ///   - shouldCacheTarget:  是否缓存对象
    /// - Returns: 返回成功或者失败, 或者返回对象, 或者 nil
    public func perform(nameSpace space: String? = "", target targetName: String, action actionName: String, params: [String: Any]?, shouldCacheTarget: Bool = false) -> AnyObject? {
        
        debugPrint(targetName)
        debugPrint(actionName)
        
        var targetObj: NSObject?
        var targetClass: NSObject.Type?
        
        var classString = "Target_\(targetName)"
        if let spaceName = space,spaceName.count > 0 {
            classString = "\(spaceName).Target_\(targetName)"
        }
        
        if shouldCacheTarget {
            targetObj = cachedTarget[classString]
        }
        
        if targetObj == nil {
            targetClass = NSClassFromString(classString) as? NSObject.Type
            guard let targetType = targetClass else {
                return nil
            }
            targetObj = targetType.init()
            if shouldCacheTarget, targetObj != nil {
                cachedTarget[classString] = targetObj!
            }
        }
        
        let actionSelector = Selector("Action_\(actionName)")
        guard targetObj != nil, targetObj!.responds(to: actionSelector) else {
            return nil
        }
        
        let result = targetObj?.perform(actionSelector, with: params)
        
        return result?.takeUnretainedValue();
    }
}


extension CMYRouter {
    
    /// scheme://[nameSpace].[target]/[action]?[params]
    ///
    ///    url sample:
    ///    aaa://TestDemo.targetA/actionB?id=1234&cd=234
    public func perform(url actionUrl: URL, completion: ((_ result: [String: AnyObject]?) -> ())?) -> AnyObject? {
        
        let components = NSURLComponents(string: actionUrl.absoluteString)
        
        guard let host = components?.host else {
            return nil
        }
        let nameSpaceAndTraget = host.components(separatedBy: CharacterSet(charactersIn: "."))
        guard nameSpaceAndTraget.count == 2 else {
            return nil
        }
        let nameSpace = nameSpaceAndTraget[0]
        let target = nameSpaceAndTraget[1]
        
        guard let action = components?.path?.replacingOccurrences(of: "_", with: ":").replacingOccurrences(of: "/", with: "") else {
            return nil
        }
        
        var params: [String: AnyObject]?
        if let queryItems = components?.queryItems {
            params = [String: AnyObject]()
            for (_, queryItem) in queryItems.enumerated() {
                if queryItem.value != nil {
                    params?[queryItem.name] = queryItem.value! as AnyObject
                }
            }
        }
        
        let result = self.perform(nameSpace: nameSpace, target: target, action: action, params: params, shouldCacheTarget: false)
        
        if completion != nil {
            if let result = result {
                completion?(["result": result])
            } else {
                completion?(nil)
            }
        }
        
        
        return result
    }
}
