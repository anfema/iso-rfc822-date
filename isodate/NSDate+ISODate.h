//
//  NSDate+NSDate_ISODate.h
//  ion-tests
//
//  Created by Johannes Schriewer on 29/03/16.
//  Copyright © 2016 anfema GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ISODate)
- (instancetype)initWithISODateString:(NSString *)string;
@end

@interface NSDate (RFC822Date)
- (instancetype)initWithRFC822DateString:(NSString *)string;
@end