//
//  CalendarSampleViewController.h
//  CalendarSample
//
//  Created by tochi on 11/03/03.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface CalendarSampleViewController : UIViewController <EKEventEditViewDelegate>
{
  EKEventStore *eventStore;
}
@property (nonatomic, retain) EKEventStore *eventStore;

- (IBAction)openCalendar:(id)sender;

@end
