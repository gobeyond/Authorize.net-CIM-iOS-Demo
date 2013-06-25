//
//  CustomerProfileBaseType.h
//  ANMobilePaymentLib
//
//  Created by beyond92@gmail.com on 6/20/13.
//
//

#import <Foundation/Foundation.h>

@interface CustomerProfileBaseType : NSObject

@property (nonatomic, retain) NSString* merchantCustomerId;
@property (nonatomic, retain) NSString* desc;
@property (nonatomic, retain) NSString* email;
@property (nonatomic, retain) NSString* customerProfileId; 

/**
 * Creates an autoreleased  object
 * @return  an autoreleased  object.
 */
+ (CustomerProfileBaseType *) customerProfileBaseType;

/**
 * NSString of the XML Request for this class
 * @return NSString of the XML Request structure for this class.
 */
- (NSString *) stringOfXMLRequest;

@end

