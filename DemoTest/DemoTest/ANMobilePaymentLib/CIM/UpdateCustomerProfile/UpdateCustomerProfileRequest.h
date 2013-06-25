//
//  UpdateCustomerProfileRequest.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetRequest.h"
#import "CustomerProfileBaseType.h"

/**
 * Requst object that has pointers to each of the different objects
 * required in a UpdateCustomerProfile request.
 * NOTE: Consult Authorize.Net guide for the minimal fields required for the UpdateCustomerProfile request..
 */
@interface UpdateCustomerProfileRequest : AuthNetRequest {
}

@property (nonatomic, retain) CustomerProfileBaseType* profile;

/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (UpdateCustomerProfileRequest *) updateCustomerProfileRequest;

/**
 * NSString of the XML Request for this class
 * @return NSString of the XML Request structure for this class.
 */
- (NSString *) stringOfXMLRequest;
@end
