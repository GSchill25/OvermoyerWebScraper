class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
  end

  def buildWindow
    @mainWindow = NSWindow.alloc.initWithContentRect([[1080, 480], [320, 240]],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    @mainWindow.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @mainWindow.orderFrontRegardless
    
    @save_dest = ""
    
    create_dest_button
    create_run_button
  end
  
  def create_dest_button
    @dest_button = NSButton.alloc.initWithFrame(NSMakeRect(90, 180, 140, 24))
    @dest_button.title = "Save Report To..."
    @dest_button.setFont(NSFont.systemFontOfSize(13))
    @dest_button.action = :"save_to:" 
    @dest_button.target = self
    @dest_button.bezelStyle = NSRoundedBezelStyle 
    @mainWindow.contentView.addSubview(@dest_button)
  end
  
  def save_to(sender)
    save_browser = NSSavePanel.savePanel
    save_browser.canChooseFiles = false
    save_browser.canChooseDirectories = true
    save_browser.allowsMultipleSelection = false
      
    save_browser.beginSheetModalForWindow(@mainWindow, completionHandler:nil)
    if save_browser.runModal == NSFileHandlingPanelOKButton
      puts save_browser.filename
      # @save_dest = fix_str(save_browser.URLs.first.path)
      NSApp.endSheet(save_browser)
    end
  end
  
  def create_run_button
    @run_button = NSButton.alloc.initWithFrame(NSMakeRect(90, 100, 140, 24))
    @run_button.title = "Generate Report"
    @run_button.setFont(NSFont.systemFontOfSize(13))
    @run_button.action = :"run:" 
    @run_button.target = self
    @run_button.bezelStyle = NSRoundedBezelStyle 
    @mainWindow.contentView.addSubview(@run_button)
  end
  
  def run(sender)
    puts "run!"
  end
  
end
