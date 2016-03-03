//
//  OutputViewController.m
//  MarkdownParser
//
//  Created by 刘凯 on 3/3/16.
//  Copyright © 2016 Michael. All rights reserved.
//

#import "OutputViewController.h"

@interface OutputViewController ()
@property (nonatomic, strong) NSString *html;
@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation OutputViewController

- (instancetype)initWithHTML:(NSString *)html {
    self = [self init];
    if (self) {
        _html = html;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    
    NSError *error = nil;
    
    NSAttributedString *preview = [[NSAttributedString alloc] initWithData:[_html dataUsingEncoding:NSUnicodeStringEncoding] options:options documentAttributes:nil error:&error];
    
    if (!error) {
        self.textView.attributedText = preview;
    } else {
        self.textView.text = _html;
    }
}

- (IBAction)didTapCloseButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
