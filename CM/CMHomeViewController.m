/*++
 
Copyright 2012 Hannah Hironaka, Inc. All Rights Reserved.
 
Module Name:

    CMHomeViewController.m
    
Abstract:
 
    This module implements the Home view controller.
 
Author:
 
    Hannah Hironaka (hannahhironaka@gmail.com) 09-01-2012
 
Environment:
 
    iOS 4.2 Test
 
--*/

//
// ------------------------------------------------------------------- Includes
//

#import "CMHomeViewController.h"

//
// ---------------------------------------------------------------- Definitions
//

//
// ----------------------------------------------- Internal Function Prototypes
//

//
// ------------------------------------------------------------------ Functions
//

@interface CMHomeViewController ()

@end

@implementation CMHomeViewController

- (id)
initWithNibName:
    (NSString *)NibNameOrNil bundle:
    (NSBundle *)NibBundleOrNil

/*++
 
Routine Description:
 
    This routine initializes the home view controller.
 
Arguments:
 
    NibNameOrNil - Supplies an optional pointer to the nib name.
    
    NibBundleOrNil - Supplies an optional pointer to the bundle name.
    
Return Value:
 
    Returns an initialized home view controller.
 
--*/

{

    self = [super initWithNibName:NibNameOrNil bundle:NibBundleOrNil];
    if (self) {
        
    }
    
    return self;
}

- (void)
viewDidLoad

/*++
 
Routine Description:
 
    This routine loads the view home view controller.
 
Arguments:
 
    None.
 
Return Value:
 
    None.
 
--*/

{

    [super viewDidLoad];
}

- (void)
viewDidUnload

/*++
 
Routine Description:
 
    This routine loads the view home view controller.
 
Arguments:
 
    None.
 
Return Value:
 
    None.
 
--*/

{

    [super viewDidUnload];
}

- (BOOL)
shouldAutorotateToInterfaceOrientation:
    (UIInterfaceOrientation)interfaceOrientation
    
{

    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
