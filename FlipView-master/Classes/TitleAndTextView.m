

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
	[timeStampLabel sizeToFit];
    [userNameLabel setFrame:CGRectMake(someImageView.frame.origin.x + someImageView.frame.size.width + 10, 5, (contentViewArea.width - (someImageView.frame.size.width + 10)), userNameLabel.frame.size.height)];
	[timeStampLabel sizeToFit];
	[timeStampLabel setFrame:CGRectMake(userNameLabel.frame.origin.x, userNameLabel.frame.origin.y + userNameLabel.frame.size.height, timeStampLabel.frame.size.width, timeStampLabel.frame.size.height)];
    [messageLabel setFrame:CGRectMake(someImageView.frame.origin.x ,(someImageView.frame.origin.y + someImageView.frame.size.height), contentViewArea.width, contentViewArea.height - (someImageView.frame.origin.y + someImageView.frame.size.height))];
    
	[messageLabel setText:messageModel.content];
	messageLabel.contentMode = UITextAlignmentLeft;

}

- (void) initializeFields {
   
    /*************
    *
    *I am trying to set the CGRectMake of the image as the height and width of the view so I make these floats. Just to make sure this would acutally adjust size I am manually setting the values of the floats. working on dynamic sizing
    *
    **************/
    float talls = self.frame.size.height;
    float wides = self.frame.size.width;
    
    talls = 300;
    wides = 300;
    
    contentView = [[UIView alloc] init];
	[contentView setBackgroundColor:[UIColor whiteColor]];
	contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

/*****  init with image sets background *****/
    someImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:messageModel.someImage]];
//	someImageView.image = [UIImage imageNamed:messageModel.someImage];
//	[someImageView setFrame:CGRectMake(10, 10, talls, wides)];
	[contentView addSubview:someImageView];

	userNameLabel = [[UILabel alloc] init];
//  this was displaying a null value
//	[userNameLabel setText:[NSString stringWithFormat:@"%@",messageModel.userName]];
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
