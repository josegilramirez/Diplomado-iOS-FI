//
//  CDDigests.h
//  WorldDB-Sha1Cache
//
//  Created by José Gil Ramírez S on 06/10/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

#ifndef CDDigests_h
#define CDDigests_h
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>

@interface CDDigests : NSObject
+(NSString *) sha1String: (NSString *)input;
+(NSString *) sha1NSData: (NSData *)input;
+(NSString *) sha256String: (NSString *)input;
@end
#endif /* CDDigests_h */
