//
//  UpdateCustomerShippingAddressRequest.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetRequest.h"
#import "CustomerAddressType.h"

/**
 * Requst object that has pointers to each of the different objects
 * required in a UpdateCustomerShippingAddress request.
 * NOTE: Consult Authorize.Net guide for the minimal fields required for the UpdateCustomerShippingAddress request..
 */
@interface UpdateCustomerShippingAddressRequest : AuthNetRequest {
}

@property (nonatomic, retain) NSString* customerProfileId;
@property (nonatomic, retain) CustomerAddressType* address;

/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (UpdateCustomerShippingAddressRequest *) updateCustomerShippingAddressRequest;

/**
 * NSString of the XML Request for this class
 * @return NSString of the XML Request structure for this class.
 */
- (NSString *) stringOfXMLRequest;
@end
