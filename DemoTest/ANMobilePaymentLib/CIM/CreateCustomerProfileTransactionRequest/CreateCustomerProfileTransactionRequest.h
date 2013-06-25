//
//  CreateCustomerProfileTransactionRequest.h
//  ANMobilePaymentLib
//
//  Created by Authorize.Net on 3/7/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthNetRequest.h"
#import "CustomerProfileTransactionRequestType.h"

typedef enum CustomerProfileActions {
	CP_AUTH_ONLY,
	CP_AUTH_CAPTURE,
	CP_PRIOR_AUTH_CAPTURE,
	CP_CAPTURE_ONLY,
	CP_VOID,
	CP_REFUND,
	CP_ACTION_UNKNOWN
} CUSTOMER_PROFILE_ACTION;

/**
 * Requst object that has pointers to each of the different objects
 * required in a CreateCustomerProfileTransaction request.
 * NOTE: Consult Authorize.Net guide for the minimal fields required for the CreateCustomerProfileTransaction request..
 */
@interface CreateCustomerProfileTransactionRequest : AuthNetRequest {
}
@property(nonatomic, retain) CustomerProfileTransactionRequestType* transaction;
@property (nonatomic) CUSTOMER_PROFILE_ACTION transactionType;

/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (CreateCustomerProfileTransactionRequest *) createCustomerProfileTransactionRequest;

/**
 * NSString of the XML Request for this class
 * @return NSString of the XML Request structure for this class.
 */
- (NSString *) stringOfXMLRequest;
@end
