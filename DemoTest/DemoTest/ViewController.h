//
//  ViewController.h
//  DemoTest
//
//  Created by beyond92@gmail.com on 6/18/13.
//  Copyright (c) 2013 beyond92@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthNet.h"

@interface ViewController : UIViewController <AuthNetDelegate> {
    NSString* sessionToken;
}

@end
