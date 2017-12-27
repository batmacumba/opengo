//
//  ORSSerialPortHelper.m
//
//  Created by Andrew Madsen on 12/11/12.
//    Copyright (c) 2011-2012 Andrew R. Madsen (andrew@openreelsoftware.com)
//
//    Permission is hereby granted, free of charge, to any person obtaining a
//    copy of this software and associated documentation files (the
//    "Software"), to deal in the Software without restriction, including
//    without limitation the rights to use, copy, modify, merge, publish,
//    distribute, sublicense, and/or sell copies of the Software, and to
//    permit persons to whom the Software is furnished to do so, subject to
//    the following conditions:
//
//    The above copyright notice and this permission notice shall be included
//    in all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "ORSSerialPortHelper.h"
#import "OGSerialHandler.h"

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
    NSLog(@"Serial port %@ removed from system", serialPort.name);
    self.serialPort = nil;
    /* updates the menus */
    [OGSerialHandler refreshDevices];
}

- (void)serialPort:(ORSSerialPort *)serialPort didEncounterError:(NSError *)error
{
    NSLog(@"%s %@ %@", __PRETTY_FUNCTION__, serialPort, error);
}

- (void)serialPortWasOpened:(ORSSerialPort *)serialPort
{
    printf("Serial port %s was opened\n", [serialPort.name UTF8String]);
}

@end
