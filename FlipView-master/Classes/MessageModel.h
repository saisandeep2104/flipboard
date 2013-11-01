

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject {
	NSInteger messageID;
	NSString* content;
	NSString* createdAt;
	NSString* userName;
	//NSString* userImage;
    NSString* someImage;
}

-(id)initWithMessageObject:(NSDictionary*)messageObject;

@property (nonatomic,assign) NSInteger messageID;
@property (nonatomic,retain) NSString* content;
@property (nonatomic,retain) NSString* createdAt;
@property (nonatomic,retain) NSString* userName;
//@property (nonatomic,retain) NSString* userImage;
@property (nonatomic,retain) NSString* someImage;

@end
