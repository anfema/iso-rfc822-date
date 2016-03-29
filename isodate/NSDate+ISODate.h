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
- (instancetype)initWithISODateString:(NSString *)string;
@end

@interface NSDate (RFC822Date)
- (nonnull NSString *)rfc822DateString;
- (instancetype)initWithRFC822DateString:(NSString *)string;
@end