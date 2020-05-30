//
//  AppDelegate.swift
//  FastSpringCheckoutDemo
//
//  Created by Helge Heß on 30.05.20.
//  Copyright © 2020 ZeeZide GmbH. All rights reserved.
//

import Cocoa
import FSCheckoutSheet


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet weak var window: NSWindow!

  @IBAction func buyProduct(_ sender: Any) {
      let vc = FastSpringCheckoutVC()

      vc.checkoutProduct(Configuration.productName,
                         in: Configuration.storeName)
      {
          licenseKeys in

          for licenseKey in licenseKeys {
              print("User",   licenseKey.name,
                    "bought", licenseKey.sku,
                    "code:",  licenseKey.code)
          }
      }
 
      // A little more code, because we aren't in a view controller here and
      // can't call `self.presentAsSheet(vc)`
    
      let win = NSWindow()
      let wc  = NSWindowController(window: win)
      wc.contentViewController = vc
    
      window.beginSheet(wc.window!) { result in
          print("sheet closed ...")
      }
  }
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
  }

  func applicationWillTerminate(_ aNotification: Notification) {
  }
}

