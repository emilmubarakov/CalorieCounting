//
//  Extensions.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 15.12.2020.
//

import UIKit

extension UIColor {
    
    static let coreBlue = UIColor(red: 0.114, green: 0.631, blue: 0.949, alpha: 1.000)
    static let coreOrange = UIColor(red: 0.961, green: 0.651, blue: 0.137, alpha: 1.000)
    static let coreRed = UIColor(red: 0.816, green: 0.008, blue: 0.106, alpha: 1.000)
    static let coreGray = UIColor(red: 0.608, green: 0.608, blue: 0.608, alpha: 1.000)
}

extension UIView {
    
    func shake() {
        let shakeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        shakeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        shakeAnimation.duration = 0.6
        // lose momentum after time, looks nice
        shakeAnimation.values = [-20, 20, -15, 15, -10, 10, -5, 5, 0]
        layer.add(shakeAnimation, forKey: "shake")
    }
}

extension UIAlertController {
    
    func show(for sourceView: UIView? = nil) {
        // to support presentation of action sheets as popovers on iPad
        if let sourceView = sourceView, let popoverController = popoverPresentationController {
            popoverController.sourceView = sourceView
            popoverController.sourceRect = sourceView.bounds
        }

        present(animated: true, completion: nil)
    }
    
    func present(animated: Bool, completion: (() -> Void)?) {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if let rootVC = keyWindow?.rootViewController {
            presentFromController(controller: rootVC, animated: animated, completion: completion)
        }
    }
    
    private func presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let navVC = controller as? UINavigationController, let visibleVC = navVC.visibleViewController {
            presentFromController(controller: visibleVC, animated: animated, completion: completion)
        }
        else if let tabVC = controller as? UITabBarController, let selectedVC = tabVC.selectedViewController {
            presentFromController(controller: selectedVC, animated: animated, completion: completion)
        }
        else {
            controller.present(self, animated: animated, completion: completion);
        }
    }
    
    func addAction(withTitle title: String?, style: UIAlertAction.Style = .default, handler: (() -> Void)? = nil) {
        addAction(UIAlertAction(title: title, style: style, handler: { _ in
            handler?()
        }))
    }
    
    func addCancelAction() {
        addAction(UIAlertAction(title: Constant.Alert.Title.Action.cancel, style: .cancel, handler: nil))
    }
    
    func addOkayAction() {
        addAction(UIAlertAction(title: Constant.Alert.Title.Action.ok, style: .cancel, handler: nil))
    }
}

extension Date {
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    var shortDateString: String {
        if isToday {
            return "Today"
        }
        else if isYesterday {
            return "Yesterday"
        }
        else {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM-dd"
            return formatter.string(from: self)
        }
    }
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
