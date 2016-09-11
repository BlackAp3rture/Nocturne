//
//  ViewController.h
//  Nocturne
//
//  Created by Thomas Whitmire on 12/23/15.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;



@end

