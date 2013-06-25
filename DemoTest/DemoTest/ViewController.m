//
//  ViewController.m
//  DemoTest
//
//  Created by beyond92@gmail.com on 6/18/13.
//  Copyright (c) 2013 beyond92@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import "MobileDeviceLoginRequest.h"
#import "OpenUDID.h"


#import "CreateCustomerProfileRequest.h"
#import "CreateCustomerProfileResponse.h"
#import "CustomerProfileBaseType.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - AIM
- (void)registerDevice {
    MobileDeviceRegistrationRequest *mobileDeviceRegistrationRequest =
    [MobileDeviceRegistrationRequest mobileDeviceRegistrationRequest];
    mobileDeviceRegistrationRequest.mobileDevice.mobileDeviceId = [OpenUDID value];
    mobileDeviceRegistrationRequest.mobileDevice.mobileDescription = @"iPhone";
    mobileDeviceRegistrationRequest.mobileDevice.phoneNumber = @"7889999999";
    mobileDeviceRegistrationRequest.anetApiRequest.merchantAuthentication.name = @"";
    mobileDeviceRegistrationRequest.anetApiRequest.merchantAuthentication.password = @"";
    
    [AuthNet authNetWithEnvironment:ENV_TEST];
    AuthNet *an = [AuthNet getInstance];
    [an setDelegate:self];
    [an mobileDeviceRegistrationRequest:mobileDeviceRegistrationRequest];
}

- (void) loginToGateway {
    MobileDeviceLoginRequest *mobileDeviceLoginRequest = [MobileDeviceLoginRequest mobileDeviceLoginRequest];
    mobileDeviceLoginRequest.anetApiRequest.merchantAuthentication.name = @""; 
    mobileDeviceLoginRequest.anetApiRequest.merchantAuthentication.password = @""; 
    mobileDeviceLoginRequest.anetApiRequest.merchantAuthentication.mobileDeviceId = [OpenUDID value];
    
    [AuthNet authNetWithEnvironment:ENV_TEST];
    AuthNet *an = [AuthNet getInstance];
    [an setDelegate:self];
    [an mobileDeviceLoginRequest:mobileDeviceLoginRequest];

}

- (void) queryGetSettledBatchList {
    GetSettledBatchListRequest *getSettledBatchListRequest =
    [GetSettledBatchListRequest getSettlementBatchListRequest];
    getSettledBatchListRequest.anetApiRequest.merchantAuthentication.sessionToken =
    sessionToken;
    getSettledBatchListRequest.anetApiRequest.merchantAuthentication.mobileDeviceId =
    [[[UIDevice currentDevice] uniqueIdentifier]
     stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    [[AuthNet getInstance] setDelegate:self];
    [[AuthNet getInstance]
     getSettledBatchListRequest: getSettledBatchListRequest];
}

- (void) requestFailed:(AuthNetResponse *)response {
    // Handle a failed request
    NSLog(@"==== %@", response.responseReasonText);
}

- (void) connectionFailed:(AuthNetResponse *)response {
    // Handle a failed connection
}

- (void) paymentSucceeded:(CreateTransactionResponse *) response {
    // Handle payment success
}


- (void) mobileDeviceRegistrationSucceeded:(MobileDeviceRegistrationResponse *)response {
    NSLog(@"mobileDeviceRegistrationSucceeded");
}
- (void) mobileDeviceLoginSucceeded:(MobileDeviceLoginResponse *)response {
    sessionToken = [response.sessionToken retain];
    
};

#pragma mark - cim
- (void) createCustomerProfile {
    CreateCustomerProfileRequest *c = [CreateCustomerProfileRequest createCustomerProfileRequest];
    c.anetApiRequest.merchantAuthentication.name = @""; 
    c.anetApiRequest.merchantAuthentication.transactionKey = @"";
    
    CustomerProfileBaseType* profile = [[CustomerProfileBaseType alloc] init];
    profile.merchantCustomerId = @"test123";
    profile.email = @"test123@gmail.com";
    profile.desc = @"test";
    c.profile = profile;
    [profile release];
    
    
    AuthNet *an = [AuthNet getInstance];
    [an setDelegate:self];
    [an createCustomerProfileRequest:c];
}

- (void) createCustomerProfileSucceeded:(CreateCustomerProfileResponse *)response {
    
}

#pragma mark -

- (IBAction)retryAction:(id)sender {
    [self createCustomerProfile];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [AuthNet authNetWithEnvironment:ENV_TEST];
//    [self registerDevice];
//    [self loginToGateway];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [sessionToken release];
    [super dealloc];
}

@end
