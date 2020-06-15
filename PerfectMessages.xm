@interface CKMessagesController: UIViewController
- (void)showConversationList: (BOOL)arg;
@end

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
