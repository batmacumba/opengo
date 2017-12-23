//
//  SerialRead.m
//  opengo
//
//  Created by bat macumba on 23/12/17.
//  Copyright © 2017 computadoresfazemarte. All rights reserved.
//

#import "SerialRead.h"

@implementation SerialRead

+ (void) listAvailablePorts {
    printf("\nPlease select a serial port: \n");
    ORSSerialPortManager *manager = [ORSSerialPortManager sharedSerialPortManager];
    NSArray *availablePorts = manager.availablePorts;
    [availablePorts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ORSSerialPort *port = (ORSSerialPort *)obj;
        printf("%lu. %s\n", (unsigned long)idx, [port.name UTF8String]);
    }];
}

@end
