//
//  NSDate+NSDate_ISODate.h
//  ion-tests
//
//  Created by Johannes Schriewer on 29/03/16.
//  Copyright © 2016 anfema GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ISODate)
- (nonnull NSString *)isoDateString;
- (nullable instancetype)initWithISODateString:(nonnull NSString *)string;
@end

@interface NSDate (RFC822Date)
- (nonnull NSString *)rfc822DateString;
- (nullable instancetype)initWithRFC822DateString:(nonnull NSString *)string;
@end