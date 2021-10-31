//
//  ViewController.m
//  KxSlackLogin
//
//  Created by 김명유 on 2021/10/31.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
{
    NSCharacterSet *_charSet;
}

@property (strong, nonatomic) IBOutlet UITextField *urlField;
@property (strong, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *placeholderLeadingConstraint;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;

@property (nonatomic, readonly, copy) NSCharacterSet *charSet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

#pragma mark - Getter

- (NSCharacterSet *)charSet
{
    if (_charSet == nil) {
        NSMutableCharacterSet *cs = NSCharacterSet.lowercaseLetterCharacterSet.mutableCopy;
        [cs addCharactersInString:@"0123456789"];
        [cs addCharactersInString:@"-"];
        _charSet = cs.invertedSet;
    }
    
    return _charSet;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (string.length > 0) {
        // swift와 달리 결과값이 nil이 아니라 주석처리
//        if ([string rangeOfCharacterFromSet:self.charSet] != Range) {
//            return NO;
//        }
    }
    return YES;
}

@end
