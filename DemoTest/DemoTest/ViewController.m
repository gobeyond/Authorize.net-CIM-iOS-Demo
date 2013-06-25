//
//  ViewController.m
//  DemoTest
//
//  Created by BesproutTech on 6/18/13.
//  Copyright (c) 2013 BesproutTech. All rights reserved.
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

// 我的测试帐号
// @"7Xw2Zgcw6R" @"3xf3m549nF8WTF3C"
#pragma mark - 
- (void)registerDevice {
    MobileDeviceRegistrationRequest *mobileDeviceRegistrationRequest =
    [MobileDeviceRegistrationRequest mobileDeviceRegistrationRequest];
    mobileDeviceRegistrationRequest.mobileDevice.mobileDeviceId = [OpenUDID value];
//    [[[UIDevice currentDevice] uniqueIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    mobileDeviceRegistrationRequest.mobileDevice.mobileDescription = @"iPhone";
    mobileDeviceRegistrationRequest.mobileDevice.phoneNumber = @"7889999999";
    mobileDeviceRegistrationRequest.anetApiRequest.merchantAuthentication.name = @"beyond92";
    mobileDeviceRegistrationRequest.anetApiRequest.merchantAuthentication.password = @"Wqh034594";
    
    [AuthNet authNetWithEnvironment:ENV_TEST];
    AuthNet *an = [AuthNet getInstance];
    [an setDelegate:self];
    [an mobileDeviceRegistrationRequest:mobileDeviceRegistrationRequest];
}

- (void) loginToGateway {
    MobileDeviceLoginRequest *mobileDeviceLoginRequest = [MobileDeviceLoginRequest mobileDeviceLoginRequest];
    mobileDeviceLoginRequest.anetApiRequest.merchantAuthentication.name = @"beyond92"; // @"7Xw2Zgcw6R";
    mobileDeviceLoginRequest.anetApiRequest.merchantAuthentication.password = @"Wqh034594"; //@"3xf3m549nF8WTF3C";
    mobileDeviceLoginRequest.anetApiRequest.merchantAuthentication.mobileDeviceId = [OpenUDID value];
//    [[[UIDevice currentDevice] uniqueIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
//    mobileDeviceLoginRequest.anetApiRequest.merchantAuthentication.transactionKey = @"3xf3m549nF8WTF3C";
    
//    [[[UIDevice currentDevice] uniqueIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    
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

- (void) queryGetTransactionDetailsWithTransId:(NSString*)transId {
    GetTransactionDetailsRequest *r =
    [GetTransactionDetailsRequest getTransactionDetailsRequest];
    r.anetApiRequest.merchantAuthentication.sessionToken = sessionToken;
    r.anetApiRequest.merchantAuthentication.mobileDeviceId =
    [[[UIDevice currentDevice] uniqueIdentifier]
     stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    r.transId = transId;
    [[AuthNet getInstance] setDelegate:self];
    [[AuthNet getInstance] getTransactionDetailsRequest:r];
}

- (void) queryGetTransactionList:(NSString*)batchId {
    
    GetTransactionListRequest *r =
    [GetTransactionListRequest getTransactionListRequest];
    r.anetApiRequest.merchantAuthentication.sessionToken = sessionToken;
    r.anetApiRequest.merchantAuthentication.mobileDeviceId =
    [[[UIDevice currentDevice] uniqueIdentifier]
     stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    
    // Batch Lists are from oldest to newest so use last object.
    r.batchId = batchId;
    [[AuthNet getInstance] getTransactionListRequest:r];
}


- (void) createTransaction {
    AuthNet *an = [AuthNet getInstance];
    
    [an setDelegate:self];
    
    CreditCardType *creditCardType = [CreditCardType creditCardType];
    creditCardType.cardNumber = @"4111111111111111";
    creditCardType.cardCode = @"110";
    creditCardType.expirationDate = @"1215";
    
    PaymentType *paymentType = [PaymentType paymentType];
    paymentType.creditCard = creditCardType;
    
    // 税
    ExtendedAmountType *extendedAmountTypeTax = [ExtendedAmountType extendedAmountType];
    extendedAmountTypeTax.amount = @"0";
    extendedAmountTypeTax.name = @"Tax";
    
    // 运费
    ExtendedAmountType *extendedAmountTypeShipping = [ExtendedAmountType extendedAmountType];
    extendedAmountTypeShipping.amount = @"0";
    extendedAmountTypeShipping.name = @"Shipping";
    
    LineItemType *lineItem = [LineItemType lineItem];
    lineItem.itemName = @"Soda";
    lineItem.itemDescription = @"Soda";
    lineItem.itemQuantity = @"2";
    lineItem.itemPrice = @"1.00";
    lineItem.itemID = @"1";
    
    TransactionRequestType *requestType = [TransactionRequestType transactionRequest];
    requestType.lineItems = [NSArray arrayWithObject:lineItem];
    requestType.amount = @"1.00";
    requestType.payment = paymentType;
    requestType.tax = extendedAmountTypeTax;
    requestType.shipping = extendedAmountTypeShipping;
    
    CreateTransactionRequest *request = [CreateTransactionRequest createTransactionRequest];
    request.transactionRequest = requestType;
    request.transactionType = AUTH_ONLY;
    request.anetApiRequest.merchantAuthentication.mobileDeviceId = [OpenUDID value];
    //[[[UIDevice currentDevice] uniqueIdentifier] stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
//    [OpenUDID value];
    request.anetApiRequest.merchantAuthentication.sessionToken = sessionToken;
    [an purchaseWithRequest:request];
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
    [self createTransaction];
};

- (void) getSettledBatchListSucceeded:(GetSettledBatchListResponse *)response {
    NSArray *batchList = [NSMutableArray arrayWithArray:response.batchList];
    BatchDetailsType *batchDetail = nil;
    
    for(BatchDetailsType *batchDetails in batchList) {
        NSLog(@"Batch ID: %@, Settled On : %@", batchDetails.batchId,
              batchDetails.settlementTimeLocal);
        batchDetail = batchDetails;
    }
    
    [self queryGetTransactionList:batchDetail.batchId];
}

- (void) getTransactionListSucceeded:(GetTransactionListResponse *)response {
    TransactionSummaryType *transaction = [response.transactions objectAtIndex:0];
    
    [self queryGetTransactionDetailsWithTransId:transaction.transId];
}

- (void) getTransactionDetailsSucceeded:(GetTransactionDetailsResponse *)response {
    NSLog(@"%@",response.transactionDetails.transactionStatus);
}

#pragma mark - cim
- (void) createCustomerProfile {
    CreateCustomerProfileRequest *c = [CreateCustomerProfileRequest createCustomerProfileRequest];
    c.anetApiRequest.merchantAuthentication.name = @"7Xw2Zgcw6R"; 
    c.anetApiRequest.merchantAuthentication.transactionKey = @"3xf3m549nF8WTF3C";
//    c.anetApiRequest.merchantAuthentication.mobileDeviceId = [OpenUDID value];
    
    CustomerProfileBaseType* profile = [[CustomerProfileBaseType alloc] init];
    profile.merchantCustomerId = @"custId123";
    profile.email = @"qinghai.wu1@besprout.cn";
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
