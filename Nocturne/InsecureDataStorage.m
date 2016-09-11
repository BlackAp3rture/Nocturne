//
//  InsecureDataStorageVC.m
//  Nocturne
//
//  Created by Thomas Whitmire on 1/27/16.
//



#import "InsecureDataStorage.h"

@interface InsecureStorage ()

@end


@implementation InsecureStorage;
@synthesize personName,phoneNumbers;
@synthesize theName,homePhone,workPhone,cellPhone;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Data.plist code - get path from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath
                           stringByAppendingPathComponent:@"Data.plist"];
    
    // check to see if Data.plist exists in documents
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
        // if not in documents, get property list from main bundle
        plistPath = [[NSBundle mainBundle] pathForResource:@"Data"
                                                    ofType:@"plist"];
    }
    
    // read property list into memory as an NSData object
    NSData *plistXML = [[NSFileManager defaultManager]
                        contentsAtPath:plistPath];
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    // convert static property liost into dictionary object
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format errorDescription:&errorDesc];
    if (!temp)
    {
        NSLog(@"Error reading plist: %@, format: %lu", errorDesc,
              (unsigned long)format);
    }
    // assign values
    self.personName = [temp objectForKey:@"Name"];
    self.phoneNumbers = [NSMutableArray arrayWithArray:[temp
                                                        objectForKey:@"Phone"]];
    // display values
    theName.text = personName;
    homePhone.text = [phoneNumbers objectAtIndex:0];
    workPhone.text = [phoneNumbers objectAtIndex:1];
    cellPhone.text = [phoneNumbers objectAtIndex:2];
}

- (IBAction)saveButton:(UIButton *)sender {
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath
                           stringByAppendingPathComponent:@"Data.plist"];
    
    // set the variables to the values in the text fields
    self.personName = theName.text;
    self.phoneNumbers = [[NSMutableArray alloc] initWithCapacity:3];
    [phoneNumbers addObject:homePhone.text];
    [phoneNumbers addObject:workPhone.text];
    [phoneNumbers addObject:cellPhone.text];
    
    // create dictionary with values in UITextFields
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects:
                               [NSArray arrayWithObjects: personName, phoneNumbers, nil]
                                                          forKeys:[NSArray arrayWithObjects: @"Name", @"Phones", nil]];
    
    NSString *error = nil;
    // create NSData from dictionary
    NSData *plistData = [NSPropertyListSerialization
                         dataFromPropertyList:plistDict
                         format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    // check is plistData exists
    if(plistData)
    {
        // write plistData to our Data.plist file
        [plistData writeToFile:plistPath atomically:YES]; 
    }
    else
    {
        NSLog(@"Error in saveData: %@", error);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) textFieldReturn:(UITextField*) sender{
    [sender resignFirstResponder];

}


@end




