//
//  ViewController.h
//  DemoTest
//
//  Created by BesproutTech on 6/18/13.
//  Copyright (c) 2013 BesproutTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthNet.h"

@interface ViewController : UIViewController <AuthNetDelegate> {
    NSString* sessionToken;
}

@end
