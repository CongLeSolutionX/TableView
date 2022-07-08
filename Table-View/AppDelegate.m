//
//  AppDelegate.m
//  Table-View
//
//  Created by Cong Le on 7/7/22.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  // Set the window to the bounds of phone's screen
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  // Set the background color of the window to be green
  self.window.backgroundColor = [UIColor greenColor];

  // Create an instance called viewController from class MainViewController
  MainViewController *viewController = [[MainViewController alloc] init];

  // Set the viewController as the window's root view controller
  self.window.rootViewController = viewController;

  // Make the window visible
  [self.window makeKeyAndVisible];

  return YES;
}

@end
