//
//  ZZHLog.swift
//  zhihuDemo
//
//  Created by tom.zhang on 17/1/18.
//  Copyright © 2017年 tom.zhang. All rights reserved.
//

import Foundation
import XCGLogger

struct ZZHLog {
    
    static let log: XCGLogger = {
        // Setup XCGLogger
        let log = XCGLogger.default
        
        #if USE_NSLOG // Set via Build Settings, under Other Swift Flags
            log.remove(destinationWithIdentifier: XCGLogger.Constants.baseConsoleDestinationIdentifier)
            log.add(destination: AppleSystemLogDestination(identifier: XCGLogger.Constants.systemLogDestinationIdentifier))
            log.logAppDetails()
        #else
            
            log.setup(level: .debug, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: NSHomeDirectory()+"/Documents/log.txt")
            
            // Add colour (using the ANSI format) to our file log, you can see the colour when `cat`ing or `tail`ing the file in Terminal on macOS
            // This is mostly useful when testing in the simulator, or if you have the app sending you log files remotely
            if let fileDestination: FileDestination = log.destination(withIdentifier: XCGLogger.Constants.fileDestinationIdentifier) as? FileDestination {
                let ansiColorLogFormatter: ANSIColorLogFormatter = ANSIColorLogFormatter()
                ansiColorLogFormatter.colorize(level: .verbose, with: .colorIndex(number: 244), options: [.faint])
                ansiColorLogFormatter.colorize(level: .debug, with: .black)
                ansiColorLogFormatter.colorize(level: .info, with: .blue, options: [.underline])
                ansiColorLogFormatter.colorize(level: .warning, with: .red, options: [.faint])
                ansiColorLogFormatter.colorize(level: .error, with: .red, options: [.bold])
                ansiColorLogFormatter.colorize(level: .severe, with: .white, on: .red)
                fileDestination.formatters = [ansiColorLogFormatter]
            }
            
            // Add colour to the console destination.
            // - Note: You need the XcodeColors Plug-in https://github.com/robbiehanson/XcodeColors installed in Xcode
            // - to see colours in the Xcode console. Plug-ins have been disabled in Xcode 8, so offically you can not see
            // - coloured logs in Xcode 8.
            
        #endif
        
        // You can also change the labels for each log level, most useful for alternate languages, French, German etc, but Emoji's are more fun
        //    log.levelDescriptions[.verbose] = "🗯"
        //    log.levelDescriptions[.debug] = "🔹"
        //    log.levelDescriptions[.info] = "ℹ️"
        //    log.levelDescriptions[.warning] = "⚠️"
        //    log.levelDescriptions[.error] = "‼️"
        //    log.levelDescriptions[.severe] = "💣"
        // Alternatively, you can use emoji to highlight log levels (you probably just want to use one of these methods at a time).
        let emojiLogFormatter = PrePostFixLogFormatter()
        emojiLogFormatter.apply(prefix: "🗯🗯🗯 ", postfix: " 🗯🗯🗯", to: .verbose)
        emojiLogFormatter.apply(prefix: "🔹🔹🔹 ", postfix: " 🔹🔹🔹", to: .debug)
        emojiLogFormatter.apply(prefix: "ℹ️ℹ️ℹ️ ", postfix: " ℹ️ℹ️ℹ️", to: .info)
        emojiLogFormatter.apply(prefix: "⚠️⚠️⚠️ ", postfix: " ⚠️⚠️⚠️", to: .warning)
        emojiLogFormatter.apply(prefix: "‼️‼️‼️ ", postfix: " ‼️‼️‼️", to: .error)
        emojiLogFormatter.apply(prefix: "💣💣💣 ", postfix: " 💣💣💣", to: .severe)
        log.formatters = [emojiLogFormatter]
        
        return log
    }()
    
    static func setup() {
        let log = XCGLogger.default
        log.setup(level: .debug,
                  showThreadName: true,
                  showLevel: true,
                  showFileNames: true,
                  showLineNumbers: true,
                  writeToFile: "path/to/file/log",
                  fileLevel: .debug)
    }
    
    
    
    static func info(_ logMessage: String) {
        log.info(logMessage)
    }
    
    static func debug(_ logMessage: String) {
        log.debug(logMessage)
    }
    
    static func warning(_ logMessage: String) {
        log.warning(logMessage)
    }
    
    static func error(_ logMessage: String) {
        log.error(logMessage)
    }
    
}
