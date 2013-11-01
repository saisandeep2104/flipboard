

#import <Foundation/Foundation.h>
#import "UIViewExtention.h"
#import "MessageModel.h"

@interface FullScreenView : UIViewExtention  {
	MessageModel* messageModel;
	UIView* contentView;

	//UIImageView* userImageView;
    UIImageView* someImageView;
	//UILabel* userNameLabel;
	UILabel* timeStampLabel;
	UILabel* messageLabel;

	UIViewExtention* viewToOverLap;
	UIView* fullScreenBG;
	UIButton* closeButton;
	
	UIScrollView* scrollView;
}

-(id)initWithModel:(MessageModel*)model;
-(void)showFields;

@property (nonatomic,assign) MessageModel* messageModel;
@property (nonatomic,assign) UIViewExtention* viewToOverLap;
@property (nonatomic,assign) UIView* fullScreenBG;
@end
