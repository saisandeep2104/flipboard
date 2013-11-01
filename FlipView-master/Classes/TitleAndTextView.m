

#import "TitleAndTextView.h"
#import "MessageModel.h"

@implementation TitleAndTextView

@synthesize messageModel;

- (id) initWithMessageModel:(MessageModel*)messagemodel{
	if (self = [super init]) {
		self.messageModel = messagemodel;
		[self initializeFields];
		
		UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
		[self addGestureRecognizer:tapRecognizer];
		[tapRecognizer release];

	}
	return self;
}

- (void)reAdjustLayout{

	[contentView setFrame:CGRectMake(1, 1, self.frame.size.width-2, self.frame.size.height - 2)];
	
	CGSize contentViewArea = CGSizeMake((contentView.frame.size.width - 20), (contentView.frame.size.height-30));
	
	[userNameLabel sizeToFit];
	//[userNameLabel setFrame:CGRectMake(userImageView.frame.origin.x + userImageView.frame.size.width + 10, 5, (contentViewArea.width - (userImageView.frame.size.width + 10)), userNameLabel.frame.size.height)];
	[timeStampLabel sizeToFit];
    [userNameLabel setFrame:CGRectMake(someImageView.frame.origin.x + someImageView.frame.size.width + 10, 5, (contentViewArea.width - (someImageView.frame.size.width + 10)), userNameLabel.frame.size.height)];
	[timeStampLabel sizeToFit];
	[timeStampLabel setFrame:CGRectMake(userNameLabel.frame.origin.x, userNameLabel.frame.origin.y + userNameLabel.frame.size.height, timeStampLabel.frame.size.width, timeStampLabel.frame.size.height)];

	
	//[messageLabel setFrame:CGRectMake(userImageView.frame.origin.x ,(userImageView.frame.origin.y + userImageView.frame.size.height), contentViewArea.width, contentViewArea.height - (userImageView.frame.origin.y + userImageView.frame.size.height))];
    [messageLabel setFrame:CGRectMake(someImageView.frame.origin.x ,(someImageView.frame.origin.y + someImageView.frame.size.height), contentViewArea.width, contentViewArea.height - (someImageView.frame.origin.y + someImageView.frame.size.height))];
    
		
	[messageLabel setText:messageModel.content];
	messageLabel.contentMode = UITextAlignmentLeft;
		
//		float widthOffset = (messageLabel.frame.size.width - textSize.width)/ 2;
//		float heightOffset = (messageLabel.frame.size.height - textSize.height)/2;
		//[messageLabel setContentInset:UIEdgeInsetsMake(heightOffset, widthOffset, heightOffset, widthOffset)];


}

- (void) initializeFields {
	contentView = [[UIView alloc] init];
	[contentView setBackgroundColor:[UIColor whiteColor]];
	contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
/*
	userImageView = [[UIImageView alloc] init];
	userImageView.image = [UIImage imageNamed:messageModel.userImage];
	[userImageView setFrame:CGRectMake(10, 10, 50, 50)];
	[contentView addSubview:userImageView];
    */
    someImageView = [[UIImageView alloc] init];
	someImageView.image = [UIImage imageNamed:messageModel.someImage
                           ];
	[someImageView setFrame:CGRectMake(10, 10, 50, 50)];
	[contentView addSubview:someImageView];

	userNameLabel = [[UILabel alloc] init];
	[userNameLabel setText:[NSString stringWithFormat:@"%@",messageModel.userName]];
	userNameLabel.font =[UIFont fontWithName:@"Helvetica" size:25];
	[userNameLabel setTextColor:RGBCOLOR(2,90,177)];
	[userNameLabel setBackgroundColor:[UIColor clearColor]];
	[contentView addSubview:userNameLabel];
	
	
	timeStampLabel = [[UILabel alloc] init];
	[timeStampLabel setText:messageModel.createdAt];
	timeStampLabel.font =[UIFont fontWithName:@"Helvetica" size:12];
	[timeStampLabel setTextColor:RGBCOLOR(111,111,111)];
	[timeStampLabel setBackgroundColor:[UIColor clearColor]];
	[contentView addSubview:timeStampLabel];
	
	messageLabel = [[UILabel alloc] init];
	messageLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
	messageLabel.textColor =  RGBCOLOR(33,33,33);
	messageLabel.highlightedTextColor = RGBCOLOR(33,33,33);
	messageLabel.contentMode = UIViewContentModeCenter;
	messageLabel.textAlignment = UITextAlignmentLeft;
	[messageLabel setBackgroundColor:[UIColor whiteColor]];
	messageLabel.numberOfLines = 0;
	[contentView addSubview:messageLabel];
	
	[self addSubview:contentView];
	
	[self reAdjustLayout];
}

-(void)tapped:(UITapGestureRecognizer *)recognizer {
	[[FlipViewAppDelegate instance] showViewInFullScreen:self withModel:self.messageModel];
}


-(void) setFrame:(CGRect)rect {
		self.originalRect = rect;
		[super setFrame:rect];
}

- (void) dealloc{
	[messageModel release];
	[contentView release];
	//[userImageView release];
    [someImageView release];
	[userNameLabel release];
	[timeStampLabel release];
	[messageLabel release];
	[super dealloc];
}


@end
