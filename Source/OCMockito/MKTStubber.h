//
//  OCMockito - MKTStubber.h
//  Copyright 2013 Jonathan M. Reid. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  Source: https://github.com/jonreid/OCMockito
//

#import <Foundation/Foundation.h>

@class MKTBaseMockObject;


@interface MKTStubber : NSObject

- (id)when:(MKTBaseMockObject *)mock;
- (void)doNothing;
- (void)doReturn:(id)obj;

@end
