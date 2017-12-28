//
//  OGSerialHandler.m
//  opengo
//
//  Created by bat macumba on 23/12/17.
//  Copyright © 2017 computadoresfazemarte. All rights reserved.
//

#import "OGSerialHandler.h"
#import "OGAppDelegate.h"

@implementation OGSerialHandler

static ORSSerialPortHelper *serialPortHelper = nil;

+ (void) refreshDevices {
    /* def: enumerates the available devices and updates the corresponding submenu */
    /* removes previous entries */
    [(OGAppDelegate *)[NSApplication sharedApplication].delegate cleanDevices];
    /* resets the status item */
    [(OGAppDelegate *)[NSApplication sharedApplication].delegate setDisconnected];
    /* declarations */
    ORSSerialPortManager *manager = [ORSSerialPortManager sharedSerialPortManager];
    NSArray *availablePorts = manager.availablePorts;
    /* enumerate the available ports */
    [availablePorts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ORSSerialPort *port = (ORSSerialPort *)obj;
        NSString *deviceName = [NSString stringWithUTF8String:[port.name UTF8String]];
        /* flag to indicate if the device is connected or not */
        BOOL isConnected = NO;
        if (port.isOpen) {
            isConnected = YES;
            //NSLog(@"Connected device: %@", deviceName);
            /* updates the status item */
            [(OGAppDelegate *)[NSApplication sharedApplication].delegate setConnected];
        }
        else {
            //NSLog(@"Disconnected device: %@", deviceName);
        }
        /* updates the "Devices" submenu */
        [(OGAppDelegate *)[NSApplication sharedApplication].delegate addDevice:deviceName connectedFlag:isConnected];
    }];
    
}

+ (NSInteger) currentRate {
    /* def: checks the current baud rate and returns the answer */
    int rates[] = {2400, 4800, 9600, 14400, 19200, 28800};
    for (int i = 0; i < 6; i++) {
        if (serialPortHelper.serialPort.baudRate.intValue == rates[i]) {
            printf("Current rate is %d\n", rates[i]);
            return rates[i];
        }
    }
    return 0;
}

+ (void) setRate: (NSInteger) rate {
    /* def: setter for the baud rate */
    serialPortHelper.serialPort.baudRate = @(rate);
}

+ (void) autoConfig {
    /* def: if an available port contains "usbserial" on it's name, sets the rate to 9600 and opens that port */
    ORSSerialPortManager *manager = [ORSSerialPortManager sharedSerialPortManager];
    NSArray *availablePorts = manager.availablePorts;
    /* enumerate the available ports */
    [availablePorts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ORSSerialPort *port = (ORSSerialPort *)obj;
        NSString *device = [NSString stringWithUTF8String:[port.name UTF8String]];
        if ([device rangeOfString:@"usbserial"].location != NSNotFound) {
            /* arduino: opens the port and sets it to the default rate (9600) */
            serialPortHelper = [[ORSSerialPortHelper alloc] init];
            serialPortHelper.serialPort = port;
            port.delegate = serialPortHelper;
            [port open];
            NSInteger baudRate = 9600;
            serialPortHelper.serialPort.baudRate = @(baudRate);
            *stop = YES;
        }
    }];
}

+ (void) setDevice: (NSString *)deviceName {
    /* def: connects to the device passed as argument */
    /* closes the current connected port, if any */
    if (serialPortHelper.serialPort != nil) {
        if([serialPortHelper.serialPort close]) {
            printf("Serial port %s was closed\n", [serialPortHelper.serialPort.name UTF8String]);
        }
    }
    /* wait 1s for the serial port to really close before opening the requested one */
    [NSThread sleepForTimeInterval: 1.0];
    ORSSerialPortManager *manager = [ORSSerialPortManager sharedSerialPortManager];
    NSArray *availablePorts = manager.availablePorts;
    /* enumerate the available ports */
    [availablePorts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ORSSerialPort *port = (ORSSerialPort *)obj;
        NSString *device = [NSString stringWithUTF8String:[port.name UTF8String]];
        if ([device isEqualToString:deviceName]) {
            /* arduino: opens the port and sets it to the default rate (9600) */
            serialPortHelper = [[ORSSerialPortHelper alloc] init];
            serialPortHelper.serialPort = port;
            port.delegate = serialPortHelper;
            [port open];
            NSInteger baudRate = 9600;
            serialPortHelper.serialPort.baudRate = @(baudRate);
            *stop = YES;
        }
    }];
}

@end
