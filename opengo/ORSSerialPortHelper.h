//
//  ORSSerialPortHelper.h
//  opengo
//
//  Created by bat macumba on 23/12/17.
//  Copyright © 2017 computadoresfazemarte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ORSSerial/ORSSerial.h>

@interface ORSSerialPortHelper : NSObject <ORSSerialPortDelegate>

@property (nonatomic, strong) ORSSerialPort *serialPort;

@end
