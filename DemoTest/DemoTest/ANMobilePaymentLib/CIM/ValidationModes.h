//
//  ValidationModes.h
//  ANMobilePaymentLib
//
//  Created by beyond92@gmail.com on 6/25/13.
//
//

#import <Foundation/Foundation.h>

typedef enum ValidationModesEnum {
	TEST_MODE,
	LIVE_MODE,
    OLD_LIVE_MODE,
	NONE_MODE
} VALIDATION_MODE;

@interface ValidationModes : NSObject

+ (NSString *) getValidationMode:(VALIDATION_MODE) mode;

@end
