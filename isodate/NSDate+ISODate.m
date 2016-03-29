//
//  NSDate+NSDate_ISODate.m
//  ion-tests
//
//  Created by Johannes Schriewer on 29/03/16.
//  Copyright © 2016 anfema GmbH. All rights reserved.
//

#import "NSDate+ISODate.h"

#pragma mark - Date formatter singletons

#pragma mark Interface
@interface ISODateFormatter : NSObject
+ (instancetype)sharedInstance;
- (nullable NSDate *)parse:(nonnull NSString *)string;
@property (nonatomic, strong, nullable) NSDateFormatter *dateFormatter1;
@property (nonatomic, strong, nullable) NSDateFormatter *dateFormatter2;
@end

@interface RFC822DateFormatter : NSObject
+ (instancetype)sharedInstance;
- (nullable NSDate *)parse:(nonnull NSString *)string;
@property (nonatomic, strong, nullable) NSDateFormatter *dateFormatter;
@end

#pragma mark Implementation
@implementation ISODateFormatter
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static ISODateFormatter *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ISODateFormatter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dateFormatter1 = [[NSDateFormatter alloc] init];
        self.dateFormatter1.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSSSS'Z'";
        self.dateFormatter1.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        self.dateFormatter1.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];

        self.dateFormatter2 = [[NSDateFormatter alloc] init];
        self.dateFormatter2.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
        self.dateFormatter2.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        self.dateFormatter2.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    }
    return self;
}

- (nullable NSDate *)parse:(nonnull NSString *)string {
    NSDate *date = [self.dateFormatter1 dateFromString:string];
    if (!date) {
        date = [self.dateFormatter2 dateFromString:string];
    }
    return date;
}

- (nonnull NSString *)format:(nonnull NSDate *)date {
    return [self.dateFormatter2 stringFromDate:date];
}
@end

@implementation RFC822DateFormatter
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static RFC822DateFormatter *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RFC822DateFormatter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"EEE', 'dd' 'MMM' 'yyyy' 'HH':'mm':'ss' GMT'";
        self.dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        self.dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    }
    return self;
}

- (nullable NSDate *)parse:(nonnull NSString *)string {
    return [self.dateFormatter dateFromString:string];
}

- (nonnull NSString *)format:(nonnull NSDate *)date {
    return [self.dateFormatter stringFromDate:date];
}
@end

#pragma mark - NSDate Categories

#pragma mark ISO
@implementation NSDate (ISODate)
- (nullable instancetype)initWithISODateString:(nonnull NSString *)string {
    NSDate *date = [[ISODateFormatter sharedInstance] parse: string];
    if (!date) {
        return nil;
    }
    return [self initWithTimeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate];
}

- (nonnull NSString *)isoDateString {
    return [[ISODateFormatter sharedInstance] format:self];
}
@end

#pragma mark RFC822
@implementation NSDate (RFC822Date)
- (instancetype)initWithRFC822DateString:(NSString *)string {
    NSDate *date = [[RFC822DateFormatter sharedInstance] parse:string];
    if (!date) {
        return nil;
    }
    return [self initWithTimeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate];
}

- (nonnull NSString *)rfc822DateString {
    return [[RFC822DateFormatter sharedInstance] format:self];
}
@end