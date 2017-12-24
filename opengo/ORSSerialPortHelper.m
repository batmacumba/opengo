//
//  ORSSerialPortHelper.m
//  opengo
//
//  Created by bat macumba on 23/12/17.
//  Copyright © 2017 computadoresfazemarte. All rights reserved.
//

#import "ORSSerialPortHelper.h"

@implementation ORSSerialPortHelper

- (void)QLab_Stop
{
    NSDictionary* errorDict;
    NSAppleScript* scriptObject =  [[NSAppleScript alloc] initWithSource:
                                    @"if application \"QLab\" is running then\n\
                                    tell application \"QLab\"\n\
                                    tell front workspace\n\
                                    stop\n\
                                    end tell\n\
                                    end tell\n\
                                    end if\n"];
    [scriptObject executeAndReturnError: &errorDict];
}
- (void)QLab_Pause
{
    NSDictionary* errorDict;
    NSAppleScript* scriptObject =  [[NSAppleScript alloc] initWithSource:
                                    @"if application \"QLab\" is running then\n\
                                    tell application \"QLab\"\n\
                                    tell front workspace\n\
                                    pause selected\n\
                                    end tell\n\
                                    end tell\n\
                                    end if\n"];
    [scriptObject executeAndReturnError: &errorDict];
}
- (void)QLab_Go
{
    NSDictionary* errorDict;
    NSAppleScript* scriptObject =  [[NSAppleScript alloc] initWithSource:
                                    @"if application \"QLab\" is running then\n\
                                    tell application \"QLab\"\n\
                                    tell front workspace\n\
                                    go\n\
                                    end tell\n\
                                    end tell\n\
                                    end if\n"];
    [scriptObject executeAndReturnError: &errorDict];
}
- (void)QLab_Load
{
    NSDictionary* errorDict;
    NSAppleScript* scriptObject =  [[NSAppleScript alloc] initWithSource:
                                    @"if application \"QLab\" is running then\n\
                                    tell application \"QLab\"\n\
                                    tell front workspace\n\
                                    load selected\n\
                                    end tell\n\
                                    end tell\n\
                                    end if\n"];
    [scriptObject executeAndReturnError: &errorDict];
}
- (void)QLab_Up
{
    NSDictionary* errorDict;
    NSAppleScript* scriptObject =  [[NSAppleScript alloc] initWithSource:
                                    @"if application \"QLab\" is running then\n\
                                    tell application \"QLab\"\n\
                                    tell front workspace\n\
                                    moveSelectionUp\n\
                                    end tell\n\
                                    end tell\n\
                                    end if\n"];
    [scriptObject executeAndReturnError: &errorDict];
}

- (void)QLab_Down
{
    NSDictionary* errorDict;
    NSAppleScript* scriptObject =  [[NSAppleScript alloc] initWithSource:
                                    @"if application \"QLab\" is running then\n\
                                    tell application \"QLab\"\n\
                                    tell front workspace\n\
                                    moveSelectionDown\n\
                                    end tell\n\
                                    end tell\n\
                                    end if\n"];
    [scriptObject executeAndReturnError: &errorDict];
}

- (void)serialPort:(ORSSerialPort *)serialPort didReceiveData:(NSData *)data
{
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    /* use switch */
    if ([string isEqualToString:@"QLab_Stop"]) [self QLab_Stop];
    if ([string isEqualToString:@"QLab_Pause"]) [self QLab_Pause];
    if ([string isEqualToString:@"QLab_Go"]) [self QLab_Go];
    if ([string isEqualToString:@"QLab_Load"]) [self QLab_Load];
    if ([string isEqualToString:@"QLab_Up"]) [self QLab_Up];
    if ([string isEqualToString:@"QLab_Down"]) [self QLab_Down];
    
    //    printPrompt();
}

- (void)serialPortWasRemovedFromSystem:(ORSSerialPort *)serialPort
{
    self.serialPort = nil;
}

- (void)serialPort:(ORSSerialPort *)serialPort didEncounterError:(NSError *)error
{
    NSLog(@"%s %@ %@", __PRETTY_FUNCTION__, serialPort, error);
}

- (void)serialPortWasOpened:(ORSSerialPort *)serialPort
{
    printf("Serial port %s was opened", [serialPort.name UTF8String]);
//    printPrompt();
}

@end
