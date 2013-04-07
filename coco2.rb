#!/usr/bin/ruby
 
require "osx/cocoa"
include OSX
 
class AppDelegate
  def initialize(statusitem)
    @timer = OSX::NSTimer.scheduledTimerWithTimeInterval_target_selector_userInfo_repeats(1.0,
                                                    self, :updateStatus, nil, true)
    @statusitem = statusitem
  end
 
  def updateStatus(timer)
    @statusitem.setTitle(rand(999))
  end
end
 
app = NSApplication.sharedApplication
statusitem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
app.delegate = AppDelegate.new(statusitem)
app.run
