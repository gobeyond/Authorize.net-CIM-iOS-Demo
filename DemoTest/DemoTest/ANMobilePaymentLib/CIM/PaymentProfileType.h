//
//  PaymentProfileType.h
//  ANMobilePaymentLib
//
//  Created by beyond92@gmail.com on 6/24/13.
//
//

#import <Foundation/Foundation.h>
#import "CustomerAddressType.h"
#import "CreditCardType.h"
#import "GDataXMLNode.h"

@interface PaymentProfileType : NSObject
@property (nonatomic, retain) NSString* customerPaymentProfileId;
@property (nonatomic, retain) CustomerAddressType* billTo;
@property (nonatomic, retain) CreditCardType* creditCard;


/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (PaymentProfileType *) paymentProfileType;

/**
 * NSString of the XML Request for this class
 * @return NSString of the XML Request structure for this class.
 */
- (NSString *) stringOfXMLRequest;

+ (PaymentProfileType *) buildPaymentProfileType:(GDataXMLElement *)element;

@end
