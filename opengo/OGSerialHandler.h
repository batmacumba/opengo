//
//  OGSerialHandler.h
//  opengo
//
//  Created by bat macumba on 23/12/17.
//  Copyright © 2017 computadoresfazemarte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ORSSerial/ORSSerial.h>
#import "ORSSerialPortHelper.h"

@interface OGSerialHandler : NSObject
+ (void) autoConfig;
+ (void) setDevice: (NSString *)deviceName;
+ (void) refreshDevices;
+ (NSInteger) currentRate;
+ (void) setRate: (NSInteger) rate;
@end
