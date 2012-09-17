/*++
 
Copyright 2012 Hannah Hironaka, Inc. All Rights Reserved.
 
Module Name:

    CMAppDelegate.h
    
Abstract:
 
    This header implements the Application Delegate.
 
Author:
 
    Hannah Hironaka (hannahhironaka@gmail.com) 09-01-2012
 
Environment:
 
    iOS 4.2 Test
 
--*/

//
// ------------------------------------------------------------------- Includes
//

#import <UIKit/UIKit.h>

//
// ----------------------------------------------------------------- Interfaces
//

@interface CMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic)
                                  NSManagedObjectContext *managedObjectContext;
                                  
@property (readonly, strong, nonatomic)
                                      NSManagedObjectModel *managedObjectModel;
                                      
@property (readonly, strong, nonatomic)
                      NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)
saveContext
    ;
    
- (NSURL *)
applicationDocumentsDirectory
    ;

@end
