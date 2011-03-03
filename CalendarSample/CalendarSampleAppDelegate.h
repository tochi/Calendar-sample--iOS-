//
//  CalendarSampleAppDelegate.h
//  CalendarSample
//
//  Created by tochi on 11/03/03.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalendarSampleViewController;

@interface CalendarSampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CalendarSampleViewController *viewController;

@end
