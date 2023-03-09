//
//  ApplicationMenu.swift
//  Dad jokes
//
//  Created by Balsa Komnenovic on 9.3.23..
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        let jokeView = JokeView()
        let topView = NSHostingController(rootView: jokeView)
        topView.view.frame.size = CGSize(width: 225, height: 255)
        
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())
        
        let aboutMenuItem = NSMenuItem(title: "About Dad Jokes", action: #selector(about), keyEquivalent: "")
        aboutMenuItem.target = self
        menu.addItem(aboutMenuItem)
        
        let webLinkMenuItem = NSMenuItem(title: "Balša Komnenović", action: #selector(openLink), keyEquivalent: "")
        webLinkMenuItem.target = self
        webLinkMenuItem.representedObject = "https://github.com/Balsa93"
        menu.addItem(webLinkMenuItem)
        
        let quitMenuItem = NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "q")
        quitMenuItem.target = self
        menu.addItem(quitMenuItem)
        
        return menu
    }
    
    @objc func about(sender: NSMenuItem) {
        NSApp.orderFrontStandardAboutPanel()
    }
    
    @objc func openLink(sender: NSMenuItem) {
        guard let link = sender.representedObject as? String, let url = URL(string: link) else { return }
        NSWorkspace.shared.open(url)
    }
    
    @objc func quit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}
