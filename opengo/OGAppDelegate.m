//
//  OGAppDelegate.m
//  opengo
//
//  Created by bat macumba on 23/12/17.
//  Copyright © 2017 computadoresfazemarte. All rights reserved.
//

#import "OGAppDelegate.h"
#import "OGSerialHandler.h"

@implementation OGAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    /* initializes the status bar icon and names it */
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusBar.title = @"G";
    //self.statusBar.image =
    self.statusBar.menu = self.statusMenu;
    self.statusBar.highlightMode = YES;
    [self.statusMenu setDelegate:self];
    /* sets the rates submenu */
    [self setupRates];
    
    /* looks for an arduino plugged in */
    [OGSerialHandler autoConfig];
    /* updates the submenus */
    [OGSerialHandler refreshDevices];
    [self refreshRates];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Close port!
}

- (void)menuWillOpen:(NSMenu *)menu {
    /* def: every time the user clicks on the status bar icon, refresh devices and rates */
    [OGSerialHandler refreshDevices];
    [self refreshRates];
}

- (void)setStatus:(NSString *)status {
    /* def: setter for the status item */
    [self.statusItem setTitle:status];
}

- (void)addDevice:(NSString *)deviceName
      connectedFlag:(BOOL) isConnected;
{
    /* def: adds a device to the submenu and assigns an action to it */
    NSMenuItem* item = [[NSMenuItem alloc] init];
    /* sets title */
    [item setTitle:deviceName];
    /* sets action */
    [item setAction:@selector(requestDevice:)];
    /* sends device name as an object */
    [item setRepresentedObject:deviceName];
    /* if the device is connected, mark it with a check */
    if (isConnected) [item setState:NSOnState];
    [self.devicesList addItem:item];
}

- (void)cleanDevices {
    /* def: removes all items from the devices submenu */
    [self.devicesList removeAllItems];
}

- (IBAction)requestDevice:(id)sender {
    /* def: relays the requested device to the serial handler */
    [OGSerialHandler setDevice:[sender representedObject]];
    [OGSerialHandler refreshDevices];
}

- (void) setupRates {
    /* def: creates the submenu items */
    int rates[] = {9600, 2400, 4800, 14400, 19200, 28800};
    for (int i = 0; i < 6; i++) {
        NSMenuItem* item = [[NSMenuItem alloc] init];
        /* sets title */
        NSString *rateTitle = [NSString stringWithFormat:@"%d", rates[i]];
        [item setTitle:rateTitle];
        /* sets action */
        [item setAction:@selector(requestRate:)];
        /* sends rate as a tag */
        [item setTag:rates[i]];
        [self.rateList addItem:item];
    }
    
}

- (IBAction)requestRate:(id)sender {
    /* def: relays the requested rate to the serial handler */
    [OGSerialHandler setRate:[sender tag]];
    [self refreshRates];
}

- (void) refreshRates {
    /* def: updates the rates submenu */
    NSInteger currentRate = [OGSerialHandler currentRate];
    for (NSMenuItem *item in [_rateList itemArray]) {
        if (currentRate == item.tag) [item setState:NSOnState];
        else [item setState:NSOffState];
    }
}

@end


