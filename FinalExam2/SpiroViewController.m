//
//  SpiroViewController.m
//  FinalExam2
//
//  Created by Brandon on 5/7/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import "SpiroViewController.h"
#import "SpirographView.h"
#import "HarmonigraphView.h"

@interface SpiroViewController ()
@property SpirographView *sView;
@property HarmonigraphView *hView;
@end

@implementation SpiroViewController
@synthesize sView;
@synthesize hView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIDevice *device = [UIDevice currentDevice];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:device];
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:device];
    
	// Do any additional setup after loading the view, typically from a nib.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(35, 20, 250, 250)];
    scrollView.pagingEnabled = YES;
    hView = [[HarmonigraphView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    hView.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:hView];
    sView = [[SpirographView alloc] initWithFrame:CGRectMake(250, 0, 250, 250)];
    sView.backgroundColor = [UIColor yellowColor];
    [scrollView addSubview:sView];
    scrollView.contentSize = CGSizeMake(500, 250);
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)redraw:(id)sender {
    sView.k = self.kslider.value;
    sView.l = self.lslider.value;
    sView.stepSize = [self.stepSizeText.text floatValue];
    sView.numberOfSteps = [self.numStepsText.text integerValue];
    [sView setNeedsDisplay];
    [hView setNeedsDisplay];
}

- (void)keyboardWillShow:(NSNotification *) note {
    CGSize keyboardSize = [[[note userInfo] objectForKey: UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y -= keyboardSize.height;
    self.view.frame = newFrame;
}

- (void)keyboardWillHide:(NSNotification *) note {
    CGSize keyboardSize = [[[note userInfo] objectForKey: UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y += keyboardSize.height;
    self.view.frame = newFrame;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.stepSizeText resignFirstResponder];
    [self.numStepsText resignFirstResponder];
}
@end
