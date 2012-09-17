/*++
 
Copyright 2012 Hannah Hironaka, Inc. All Rights Reserved.
 
Module Name:

    CMAppDelegate.m
    
Abstract:
 
    This module implements the Application Delegate.
 
Author:
 
    Hannah Hironaka (hannahhironaka@gmail.com) 09-01-2012
 
Environment:
 
    iOS 4.2 Test
 
--*/

//
// ------------------------------------------------------------------- Includes
//

#import "CMAppDelegate.h"

//
// ---------------------------------------------------------------- Definitions
//

//
// ----------------------------------------------- Internal Function Prototypes
//

//
// ------------------------------------------------------------------ Functions
//

@implementation CMAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (void)
dealloc

/*++
 
Routine Description:
 
    This routine destroys the Application Delegate.
 
Arguments:
 
    None.
 
Return Value:
 
    None.
 
--*/

{

    [_window release];
    [_managedObjectContext release];
    [_managedObjectModel release];
    [_persistentStoreCoordinator release];
    [super dealloc];
    return;
}

- (BOOL)
application:
    (UIApplication *)Application didFinishLaunchingWithOptions:
    (NSDictionary *)LaunchOptions

/*++
 
Routine Description:
 
    This routine is called after Application launches. Do initial set up here.
 
Arguments:
 
    Application - Supplies a pointer to the Application.
    
    LaunchOptions - Supplies a pointer to a dictionary of launch options.
 
Return Value:
 
    Returns a boolean indicating that the application successfully launched.
 
--*/

{
    
    CGRect Frame;
    
    Frame = [[UIScreen mainScreen] bounds];
    self.window = [[[UIWindow alloc] initWithFrame:Frame] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)
applicationWillResignActive:
    (UIApplication *)Application

/*++
 
Routine Description:
 
    This routine is called when the application is about to move from active to 
    an inactive state. This can occur for certain types of temporary 
    interruptions (such as an incoming phone call or SMS message) or when the 
    user quits the application and it begins the transition to the background 
    state. Use this method to pause ongoing tasks, disable timers, and throttle 
    down OpenGL ES frame rates. Games should use this method to pause the game.
 
Arguments:
 
    Application - Supplies a pointer to the Application.
 
Return Value:
    
    None.
 
--*/

{
    
    return;
}

- (void)
applicationDidEnterBackground:
    (UIApplication *)Application

/*++
 
Routine Description:
 
    Use this method to release shared resources, save user data, invalidate 
    timers, and store enough application state information to restore your 
    application to its current state in case it is terminated later. If your 
    pplication supports background execution, this method is called instead of
    applicationWillTerminate: when the user quits.
 
Arguments:
 
    Application - Supplies a pointer to the Application.
 
Return Value:
 
    None.
 
--*/
    
{

    return;
}

- (void)
applicationWillEnterForeground:
    (UIApplication *)Application

/*++
 
Routine Description:
 
    Called as part of the transition from the background to the inactive state; 
    here you can undo many of the changes made on entering the background.
 
Arguments:
 
    Application - Supplies a pointer to the Application.
 
Return Value:
 
    None.
 
--*/
    
{

    return;
}

- (void)
applicationDidBecomeActive:
    (UIApplication *)Application

/*++
 
Routine Description:
 
    Restart any tasks that were paused (or not yet started) while the 
    application was inactive. If the application was previously in the 
    background, optionally refresh the user interface.
 
Arguments:
 
    Application - Supplies a pointer to the Application.
 
Return Value:
 
    None.
 
--*/
    
{

    return;
}

- (void)
applicationWillTerminate:
    (UIApplication *)Application

/*++
 
Routine Description:
 
    This routine is called when the application is about to terminate.
 
Arguments:
 
    Application - Supplies a pointer to the Application.
 
Return Value:
 
    None.
 
--*/
    
{

    [self saveContext];
    return;
}

- (void)
saveContext

/*++
 
Routine Description:
 
    This routine is called to save the managed object context.
 
Arguments:
 
    None.
 
Return Value:
 
    None.
 
--*/

{

    NSError *Error;
    NSManagedObjectContext *ManagedObjectContext;

    Error = nil;
    ManagedObjectContext = self.managedObjectContext;
    if (ManagedObjectContext != nil) {
        if ([ManagedObjectContext hasChanges] &&
            ![ManagedObjectContext save:&Error]) {
            NSLog(@"Unresolved error %@, %@", Error, [Error userInfo]);
        } 
    }
    
    return;
}

#pragma mark - Core Data stack

- (NSManagedObjectContext *)
managedObjectContext

/*++
 
Routine Description:
 
    Returns the managed object context for the application. If the context 
    doesn't already exist, it is created and bound to the persistent store 
    coordinator for the application.
 
Arguments:
    
    None.
 
Return Value:
 
    Returns a pointer to the managed object context.
 
--*/

{

    NSPersistentStoreCoordinator *Coordinator;
    
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    Coordinator = [self persistentStoreCoordinator];
    if (Coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:Coordinator];
    }
    
    return _managedObjectContext;
}

- (NSManagedObjectModel *)
managedObjectModel

/*++
 
Routine Description:

    Returns the managed object model for the application. If the model doesn't 
    already exist, it is created from the application's model.
 
Arguments:
    
    None.
 
Return Value:
 
    Returns a ponter to the managed object model.
 
--*/

{

    NSURL *ModelURL;
    
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    ModelURL = [[NSBundle mainBundle] URLForResource:@"CM"
                                       withExtension:@"momd"];
                                       
    _managedObjectModel =
                 [[NSManagedObjectModel alloc] initWithContentsOfURL:ModelURL];
                 
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)
persistentStoreCoordinator

/*++
 
Routine Description:

    Returns the persistent store coordinator for the application. If the 
    coordinator doesn't already exist, it is created and the application's 
    store added to it.
 
Arguments:
    
    None.
 
Return Value:
 
    Returns a ponter to the perisitent store coordinator.
 
--*/

{

    NSError *Error;
    NSManagedObjectModel *Model;
    NSURL *StoreURL;
    
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    StoreURL = [[self applicationDocumentsDirectory]
                                     URLByAppendingPathComponent:@"CM.sqlite"];
    
    Error = nil;
    Model = [self managedObjectModel];
    _persistentStoreCoordinator =
        [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:Model];
                                                        
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:StoreURL
                                                         options:nil
                                                           error:&Error]) {

        NSLog(@"Unresolved error %@, %@", Error, [Error userInfo]);
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

- (NSURL *)
applicationDocumentsDirectory

/*++
 
Routine Description:
    
    Returns the URL to the application's Documents directory.
 
Arguments:
    
    None.
 
Return Value:
 
    Returns the URL to the application's Documents directory.
 
--*/

{

    NSFileManager *FileManager;
    
    FileManager = [NSFileManager defaultManager];
    
    return [[FileManager URLsForDirectory:NSDocumentDirectory
                                inDomains:NSUserDomainMask] lastObject];
}

@end
