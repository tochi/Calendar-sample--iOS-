//
//  CalendarSampleViewController.m
//  CalendarSample
//
//  Created by tochi on 11/03/03.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import "CalendarSampleViewController.h"

@implementation CalendarSampleViewController

@synthesize eventStore;

- (void)dealloc
{
  [eventStore release];
  
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
    
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.eventStore = [[[EKEventStore alloc] init] autorelease];
}

- (IBAction)openCalendar:(id)sender
{
  EKEvent *event = [EKEvent eventWithEventStore:self.eventStore];
  event.title = @"This is title.";
  event.location = @"Tokyo, Japan.";
  event.startDate = [NSDate date];
  event.endDate = [NSDate dateWithTimeIntervalSinceNow:86400];
  event.notes = @"This is notes.";
  
  EKEventEditViewController *eventEditViewController = [[[EKEventEditViewController alloc] init] autorelease];
  eventEditViewController.editViewDelegate = self;
  eventEditViewController.event = event;
  eventEditViewController.eventStore = self.eventStore;
  
  [self presentModalViewController:eventEditViewController animated:YES];
}

- (void)eventEditViewController:(EKEventEditViewController *)controller 
          didCompleteWithAction:(EKEventEditViewAction)action
{
	
	NSError *error = nil;
	
	switch (action) {
		case EKEventEditViewActionCanceled:
			break;
			
		case EKEventEditViewActionSaved:
			[controller.eventStore saveEvent:controller.event span:EKSpanThisEvent error:&error];
			break;
			
		case EKEventEditViewActionDeleted:
			[controller.eventStore removeEvent:controller.event span:EKSpanThisEvent error:&error];
			break;
			
		default:
			break;
	}
  
	[controller dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
