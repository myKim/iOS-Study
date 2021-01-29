//
//  ViewController.m
//  DarkmodePractice
//
//  Created by 김명유 on 2021/01/26.
//

#import "ViewController.h"
@import WebKit;

@interface ViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *keyboardLookTextField;
@property (strong, nonatomic) IBOutlet UILabel *styleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.keyboardLookTextField.delegate = self;
    [self updateCurrentUIStyleLabel];
}

- (void)viewWillAppear:(BOOL)animated
{
//    UITextField.appearance.keyboardAppearance = UIKeyboardAppearanceDark;
}

#pragma mark - Internal Methods

- (void)updateCurrentUIStyleLabel
{
    NSArray *windows = UIApplication.sharedApplication.windows;
    UIWindow *keyWindow = nil;
    for (UIWindow *window in windows) {
        if ([window isKeyWindow]) {
            keyWindow = window;
            break;
        }
    }
    
    keyWindow = keyWindow ?: windows.firstObject;
    
    if (keyWindow) {
        switch (keyWindow.overrideUserInterfaceStyle) {
            case UIUserInterfaceStyleUnspecified: {
                self.styleLabel.text = @"StyleUnspecified";
                break;
            }
            case UIUserInterfaceStyleLight: {
                self.styleLabel.text = @"StyleLight";
                break;
            }
            case UIUserInterfaceStyleDark: {
                self.styleLabel.text = @"StyleDark";
                break;
            }
            default:
                break;
        }
    }
}

#pragma mark - IBActions

- (IBAction)keyboardLookDefault:(id)sender
{
    // 개별 텍스트 뷰 설정
    self.keyboardLookTextField.keyboardAppearance = UIKeyboardAppearanceDefault;
    
    // UITextField.appearance 프록시 설정
    // 동적으로 적용되지 않는 것 같다.
    // UITextView 속성이므로 WebView 등에 적용되지 않는다.
//    UITextField.appearance.keyboardAppearance = UIKeyboardAppearanceDefault;
}
- (IBAction)keyboardLookDark:(id)sender
{
    self.keyboardLookTextField.keyboardAppearance = UIKeyboardAppearanceDark;
    
//    UITextField.appearance.keyboardAppearance = UIKeyboardAppearanceDark;
}
- (IBAction)keyboardLookLight:(id)sender
{
    self.keyboardLookTextField.keyboardAppearance = UIKeyboardAppearanceLight;
    
//    UITextField.appearance.keyboardAppearance = UIKeyboardAppearanceLight;
}

- (IBAction)toggleWindowOverrideUIStyle:(id)sender {
    // overrideUserInterfaceStyle을 이용해서 window, viewController, view의 UI 스타일을 강제할 수 있음
    // 변경 시 즉시 적용됨 (버튼으로 토글시 바로 적용)
    //
    NSArray *windows = UIApplication.sharedApplication.windows;
    for (UIWindow *window in windows) {
        window.overrideUserInterfaceStyle = window.overrideUserInterfaceStyle != UIUserInterfaceStyleDark ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight;
    }
    [self updateCurrentUIStyleLabel];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
