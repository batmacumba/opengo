//
//  SerialRead.m
//  opengo
//
//  Created by bat macumba on 23/12/17.
//  Copyright © 2017 computadoresfazemarte. All rights reserved.
//

#import "SerialConnect.h"

@implementation SerialConnect

static ORSSerialPortHelper *serialPortHelper = nil;

void receiveData()  {
    /* def: receives data from the open port and relays them to serialPortHelper */
    NSFileHandle *serial = [NSFileHandle fileHandleForReadingAtPath:serialPortHelper.serialPort.name];
    [serialPortHelper.serialPort sendData:[serial availableData]];
}

+ (void) autoConfig {
    /* def: if an available port contains "usbserial" on it's name, sets the rate to 9600 and opens that port */
    ORSSerialPortManager *manager = [ORSSerialPortManager sharedSerialPortManager];
    NSArray *availablePorts = manager.availablePorts;
    /* enumerate the available ports */
    [availablePorts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ORSSerialPort *port = (ORSSerialPort *)obj;
        NSString *device = [NSString stringWithUTF8String:[port.name UTF8String]];
        if ([device rangeOfString:@"usbserial"].location == NSNotFound) {
            /* arduino not found */
        }
        else {
            /* arduino found; sets the rate and opens the port */
            serialPortHelper = [[ORSSerialPortHelper alloc] init];
            serialPortHelper.serialPort = port;
            port.delegate = serialPortHelper;
            [port open];
            NSInteger baudRate = 9600;
            serialPortHelper.serialPort.baudRate = @(baudRate);
            receiveData();
            *stop = YES;
        }
    }];
}

@end
