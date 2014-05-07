//
//  SliderViewController.m
//  FinalExam2
//
//  Created by Brandon on 5/7/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import "SliderViewController.h"
#import "SliderGame.h"

@interface SliderViewController ()

@end

@implementation SliderViewController
SliderGame *game;

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

- (IBAction)movePiece:(id)sender {
    UIButton *pressed = sender;
    NSArray* position = [game tilePosition:[sender tag]];
    [game moveTile:[[position objectAtIndex:0] intValue]
                  :[[position objectAtIndex:1] intValue]
                  :pressed];
    if ([game isAWin]) {
        UIAlertView *win = [[UIAlertView alloc] initWithTitle: @"Good job!"
                                                      message: @"You won!"
                                                     delegate: self
                                            cancelButtonTitle: @"Ok"
                                            otherButtonTitles: nil];
        
        [win show];
        game.active = false;
    }
}

- (IBAction)newGame:(id)sender {
    game = [[SliderGame alloc] init];
    [game randomizeTiles];
    [self printBoard];
    game.active = true;
}

- (void)printBoard
{
    int tile;
    UIButton* button;
    for (int x = 0; x < 4; x++) {
        for (int y = 0; y < 4; y++) {
            tile = [[game getPosition:x :y] intValue];
            if (tile != 0) {
                button = (UIButton *)[self.view viewWithTag:tile];
                CGRect rect = CGRectMake(y * 52 + 54, x * 52 + 56, 52, 52);
                [button setFrame:rect];
            }
        }
    }
}
@end
