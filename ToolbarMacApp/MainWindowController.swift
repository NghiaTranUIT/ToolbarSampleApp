//
//  MainWindowController.swift
//  ToolbarMacApp
//
//  Created by nghiatran on 28/12/24.
//

import Cocoa

extension NSToolbarItem.Identifier {
    static let add = NSToolbarItem.Identifier("Add")
    static let trash = NSToolbarItem.Identifier("Trash")
    static let status = NSToolbarItem.Identifier("Status")
    static let endButton = NSToolbarItem.Identifier("EndButton")
}

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Create and configure the toolbar
        let toolbar = NSToolbar(identifier: "MainToolbar")
        toolbar.delegate = self
        toolbar.allowsUserCustomization = true
        toolbar.autosavesConfiguration = true
        toolbar.displayMode = .iconOnly
        toolbar.centeredItemIdentifiers = Set([.status])
        // Set the toolbar to the window
        window?.toolbar = toolbar
        window?.toolbarStyle = .unifiedCompact
    }

}

// MARK: - NSToolbarDelegate
extension MainWindowController: NSToolbarDelegate {
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        switch itemIdentifier {
            
        case .add:
            let item = NSToolbarItem(itemIdentifier: itemIdentifier)
            let image = NSImage(systemSymbolName: "arrowtriangle.forward.fill", accessibilityDescription: "Add")
            item.image = image
            item.label = "Add"
            item.target = self
            item.action = #selector(addButtonClicked)
            item.isBordered = true
//            item.visibilityPriority = .user
            return item
            
        case .trash:
            let item = NSToolbarItem(itemIdentifier: itemIdentifier)
            let image = NSImage(systemSymbolName: "trash", accessibilityDescription: "Trash")
            image?.size = NSSize(width: 16, height: 16)
            item.image = image
            item.label = "Trash"
            item.target = self
            item.action = #selector(trashButtonClicked)
            item.isBordered = true
            return item
            
        case .status:
            let item = NSToolbarItem(itemIdentifier: itemIdentifier)
            let statusView = NSTextField(labelWithString: "Status: Ready")
            item.view = statusView
            item.image = NSImage(systemSymbolName: "trash", accessibilityDescription: "Trash")
            item.label = "Trash"
            item.target = self
            item.action = #selector(trashButtonClicked)
            let image = NSImage(systemSymbolName: "gear", accessibilityDescription: "Settings")
            image?.size = NSSize(width: 16, height: 16)
            item.image = image
            return item
        case .status:
            let item = NSToolbarItem(itemIdentifier: itemIdentifier)
            return item
            
        default:
            return nil
        }
        return nil
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [
            .toggleSidebar,
            .flexibleSpace,
            .add,
            .sidebarTrackingSeparator,
            .trash,
            .flexibleSpace,
            .status,
            .flexibleSpace,
            .endButton
        ]
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        toolbarDefaultItemIdentifiers(toolbar)
    }
    
    // MARK: - Actions
    @objc private func addButtonClicked() {
        // Handle add button action
    }
    
    @objc private func trashButtonClicked() {
        // Handle trash button action
    }
    
    @objc private func endButtonClicked() {
        // Handle end button action
    }
}
