#import <Cephei/HBPreferences.h>

@interface CKMessagesController: UIViewController
- (void)showConversationList: (BOOL)arg;
@end

static HBPreferences *pref;
static BOOL enabled;
static BOOL returnToMessagesOnClose;

%group returnToMessagesListOnCloseGroup

	%hook CKMessagesController

	- (void)prepareForSuspend
	{
		%orig;
		[self showConversationList: NO];
	}

	- (void)prepareForResume
	{
		%orig;
		[self showConversationList: NO];
	}

	- (void)performResumeDeferredSetup
	{
		%orig;
		[self showConversationList: NO];
	}

	- (void)parentControllerDidResume: (BOOL)arg1 animating: (BOOL)arg2
	{
		%orig;
		[self showConversationList: NO];
	}

	- (BOOL)resumeToConversation: (id)arg
	{
		return %orig(nil);
	}

	%end

%end

%ctor
{
	pref = [[HBPreferences alloc] initWithIdentifier: @"com.johnzaro.perfectmessages"];
	[pref registerDefaults:
	@{
		@"enabled": @NO,
		@"returnToMessagesOnClose": @NO,
	}];

	enabled = [pref boolForKey: @"enabled"];
	if(enabled)
	{
		returnToMessagesOnClose = [pref boolForKey: @"returnToMessagesOnClose"];

		if(returnToMessagesOnClose)
			%init(returnToMessagesListOnCloseGroup);
	}
}