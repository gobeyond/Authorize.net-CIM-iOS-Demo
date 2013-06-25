//
//  ValidationModes.m
//  ANMobilePaymentLib
//
//  Created by beyond92@gmail.com on 6/25/13.
//
//

#import "ValidationModes.h"


@implementation ValidationModes

+ (NSString *) getValidationMode:(VALIDATION_MODE) mode {
	switch (mode) {
		case TEST_MODE:
			return @"testMode";
			break;
		case LIVE_MODE:
			return @"liveMode";
			break;
		case OLD_LIVE_MODE:
			return @"oldLiveMode";
			break;
		case NONE_MODE:
			return @"none";
			break;
		default:
			return @"";
			break;
	}
}

@end
