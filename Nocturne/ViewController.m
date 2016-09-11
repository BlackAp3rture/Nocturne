//
//  ViewController.m
//  Nocturne
//
//  Created by Thomas Whitmire on 12/23/15.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController
@synthesize txtUsername;
@synthesize txtPassword;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtUsername.delegate = self;
    self.txtPassword.delegate = self;
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signinClicked:(id)sender {
    
}

- (BOOL) textFieldShouldReturn:(UITextField*) textField {
   [textField resignFirstResponder];
    return YES;
}


@end




