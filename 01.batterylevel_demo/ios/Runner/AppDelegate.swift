import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    // 实现获取电池信息的功能
    // 1.获取FlutterViewController
    let controller: FlutterViewController = window.rootViewController as! FlutterViewController ;
    // 2.创建FlutterMethodChannel
    let channel = FlutterMethodChannel(name: "flutter.com/battery", binaryMessenger: controller.binaryMessenger);
    // 3.监听channel调用方法(Flutter中platform.invokeMethod方法调用，下面这个函数回调就会执行)
    channel.setMethodCallHandler { (call:FlutterMethodCall,result: @escaping FlutterResult) in
        //3.1 判断当前方法是否是getBatteryInfo
        guard call.method == "getBatteryInfo" else {
            result(FlutterMethodNotImplemented);
            return;
        }
        //3.2获取电池信息
        let device = UIDevice.current;
        device.isBatteryMonitoringEnabled = true;
        
        //3.3获取电量信息
        if device.batteryState == UIDevice.BatteryState.unknown {
            // result(FlutterError(code:"unknow", message:"batter info is unknow",details:nil));
           result(1000);
        } else {
            result(Int(device.batteryLevel * 100));
        }
    };
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
  }
}
