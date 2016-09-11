//
//  InsecureDataStorageVC.h
//  Nocturne
//
//  Created by Thomas Whitmire on 1/27/16.
//

#import <UIKit/UIKit.h>

@interface InsecureStorage : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *theName;
@property (weak, nonatomic) IBOutlet UITextField *homePhone;
@property (weak, nonatomic) IBOutlet UITextField *workPhone;
@property (weak, nonatomic) IBOutlet UITextField *cellPhone;

- (IBAction)saveButton:(UIButton *)sender;



- (IBAction)textFieldReturn:(UITextField *)sender;



@property NSString *personName;
@property NSMutableArray *phoneNumbers;



@end
