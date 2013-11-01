

#import "MessageModel.h"

@implementation MessageModel

@synthesize messageID;
@synthesize content;
@synthesize createdAt;
@synthesize userName;
//@synthesize userImage;
@synthesize someImage;

-(id)initWithMessageObject:(NSDictionary*)messageObject {
	if (self = [super init]) {
		self.messageID = (NSInteger)[[messageObject objectForKey:@"id"] intValue];
		self.content = [messageObject objectForKey:@"content"];
		self.createdAt = [messageObject objectForKey:@"created_at"];
		self.userName = [messageObject objectForKey:@"userName"];
		//self.userImage = [messageObject objectForKey:@"userImage"];
        self.someImage = [messageObject objectForKey:@"someImage"];
	}
	return self;
}


- (void) dealloc {
	[content release];
	[createdAt release];
	[userName release];
	//[userImage release];
    [someImage release];
	[super dealloc];
}

@end
