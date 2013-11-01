

#import <Foundation/Foundation.h>
#import "UIViewExtention.h"
@class MessageModel;

@interface TitleAndTextView : UIViewExtention {
	UIView* contentView;
	//UIImageView* userImageView;
    UIImageView* someImageView;
	//UILabel* userNameLabel;
	UILabel* timeStampLabel;
	UILabel* messageLabel;
}

- (id) initWithMessageModel:(MessageModel*)messagemodel;
- (void) initializeFields;
	
@property (nonatomic,retain) MessageModel* messageModel;

@end
