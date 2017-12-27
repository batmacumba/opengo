//
//  OGAppDelegate.h
//  opengo
//
//  Created by bat macumba on 23/12/17.
//  Copyright © 2017 computadoresfazemarte. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OGAppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet NSMenuItem *devicesMenu;
@property (weak) IBOutlet NSMenu *devicesList;
@property (weak) IBOutlet NSMenuItem *statusItem;
@property (weak) IBOutlet NSMenu *statusMenu;
@property (strong, nonatomic) NSStatusItem *statusBar;
@property (weak) IBOutlet NSMenuItem *rateMenu;
@property (weak) IBOutlet NSMenu *rateList;

- (void)setStatus:(NSString *)status;
- (void)addDevice:(NSString *)deviceName connectedFlag:(BOOL) isConnected;
- (void)cleanDevices;

@end

