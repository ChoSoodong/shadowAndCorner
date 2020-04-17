




#import "SDShadowCornerView.h"
#import "UIView+cornerRadius.h"

@interface SDShadowCornerView ()
{
    UIView *_contentView;
}
@end


@implementation SDShadowCornerView

#pragma mark - init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self initViews];
    [self initConstraints];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    [self initViews];
    [self initConstraints];
    
    return self;
}

- (void)initViews
{
    self.backgroundColor = UIColor.grayColor;
    self.layer.shadowColor = [UIColor blueColor].CGColor;
    //[UIColor colorWithRed:100 green:222 blue:22 alpha:1].CGColor;
    self.layer.shadowOffset = CGSizeMake(10, 10);
    self.layer.shadowOpacity = 0.3;
    self.layer.shadowRadius = 4;
    
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)].CGPath;//参数依次为大小，设置四个角圆角状态，圆角曲度  设置阴影路径可避免离屏渲染

    
    _contentView = [[UIView alloc] init];
    _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    _contentView.userInteractionEnabled = NO;
    _contentView.layer.masksToBounds = YES;
    
    [self setRadius:10];
    
    [super addSubview:_contentView];
}

- (void)initConstraints
{
    [_contentView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [_contentView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [_contentView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
}


#pragma mark - functions

// Override to add views to content view
- (void)addSubview:(UIView *)view
{
    [_contentView addSubview:view];
}


#pragma mark - properties

- (UIView *)contentView
{
    return _contentView;
}

- (void)setRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    _contentView.layer.cornerRadius = radius;
    

}


@end




