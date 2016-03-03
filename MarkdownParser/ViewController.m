//
//  ViewController.m
//  MarkdownParser
//
//  Created by 刘凯 on 3/2/16.
//  Copyright © 2016 Michael. All rights reserved.
//

#import "ViewController.h"
#import "OutputViewController.h"

#import "MMMarkdown.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITextView *markdownEditor;
@property (nonatomic, weak) IBOutlet UIButton *parserButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.markdownEditor.text = @"#Header1\n\
##Header2\n\
###Header3\n\
*   Cindy.\n\
*   Michael.\n\
*   Rachel.\n\n\
![a](https://pic3.zhimg.com/cb22eb43e4f4530abddc4410a16870fe_l.jpg)\n\n\
[**myzhihu**](https://www.zhihu.com/people/liukaiyi54)\n\
    ";

    [self.parserButton addTarget:self action:@selector(didTapParserButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didTapParserButton:(id)sender {
    NSError *error = nil;
    NSString *html = [MMMarkdown HTMLStringWithMarkdown:self.markdownEditor.text error:&error];
    
    if (!error) {
        OutputViewController *vc = [[OutputViewController alloc] initWithHTML:html];
        [self presentViewController:vc animated:YES completion:nil];
    } else {
        UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"error" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end
