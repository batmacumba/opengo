//
//  SerialRead.m
//  opengo
//
//  Created by bat macumba on 23/12/17.
//  Copyright © 2017 computadoresfazemarte. All rights reserved.
//

#import "SerialRead.h"
#import <ORSSerial/ORSSerial.h>

@implementation SerialRead

+ (void) connectToDevice {
    /* def: if an available port contains "usbserial" on it's name, sets the rate to 9600 and opens that port */
    ORSSerialPortManager *manager = [ORSSerialPortManager sharedSerialPortManager];
    NSArray *availablePorts = manager.availablePorts;
    [availablePorts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ORSSerialPort *port = (ORSSerialPort *)obj;
//        printf("%lu. %s\n", (unsigned long)idx, [port.name UTF8String]);
        NSString *device = [NSString stringWithUTF8String:[port.name UTF8String]];
        if ([device rangeOfString:@"usbserial"].location == NSNotFound) {
            puts("arduino not found; what should we do?");
        }
        else {
            NSLog(@"controller found at:%@", device);
            port.baudRate = @9600;
            [port open];
            *stop = YES;
        }
    }];
}

@end
