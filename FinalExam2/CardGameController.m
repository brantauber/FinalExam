//
//  CardGameController.m
//  FinalExam2
//
//  Created by Brandon on 5/7/14.
//  Copyright (c) 2014 Brandon Tauber. All rights reserved.
//

#import "CardGameController.h"
#import "CardMatchingGame.h"

@interface CardGameController ()

@end

@implementation CardGameController

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
    self.deck = [[PlayingCardDeck alloc] init];
    self.cardGame = [[CardMatchingGame alloc] initWithCardCount:16 usingDeck:self.deck];
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

- (IBAction)flipCard:(id)sender {
    NSInteger index = [self.cardButtons indexOfObject:sender];
    [self.cardGame chooseCardAtIndex:index];
    Card *p = [self.cardGame cardAtIndex:index];
    if (p.chosen) {
        [sender setTitle:p.content forState:UIControlStateNormal];
        [sender setBackgroundImage:Nil forState:UIControlStateNormal];
        for (int i = 0; i < [self.cardGame.cards count]; i++) {
            Card *q = [self.cardGame cardAtIndex:i];
            if (q.chosen && i != index && q.matched == NO) {
                if ([p match:q] == 1) {
                    p.matched = YES;
                    q.matched = YES;
                    [self.cardGame rankMatch];
                    [[self.cardButtons objectAtIndex:index] setEnabled:NO];
                    [[self.cardButtons objectAtIndex:i] setEnabled:NO];
                }
                else if ([p match:q] == 2) {
                    p.matched = YES;
                    q.matched = YES;
                    [self.cardGame suitMatch];
                    [[self.cardButtons objectAtIndex:index] setEnabled:NO];
                    [[self.cardButtons objectAtIndex:i] setEnabled:NO];
                }
            }
        }
        [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %i", self.cardGame.score]];
    }
    else {
        [sender setTitle:@"" forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"muhback.png"] forState:UIControlStateNormal];
    }
}
@end
