//
//  ViewController.h
//  YhooFantasyFootballAPIExample
//
//  Created by Matthew Noakes on 12/15/16.
//  Copyright © 2016 Matthew Noakes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOSSocial.h"
#import <pop/POP.h>



@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSString *oneLeagueKey;
    NSString *_twoLeagueKey;
    NSString *_threeLeagueKey;
    NSString *_fourLeagueKey;
    NSString *_fiveLeagueKey;
    NSString *_sixLeagueKey;
    
    NSString *_oneLeagueKeyId;
    NSString *_twoLeagueKeyId;
    NSString *_threeLeagueKeyId;
    NSString *_fourLeagueKeyId;
    NSString *_fiveLeagueKeyId;
    NSString *_sixLeagueKeyId;
    
    
}



@property (strong, nonatomic) UIButton* testButn;
@property (strong, nonatomic) UIButton* testButn2;
@property (strong, nonatomic) UIButton* testButn3;
@property (strong, nonatomic) UIButton* testButn4;
@property (strong, nonatomic) UIButton* testButn5;
@property (strong, nonatomic) UIButton* testButn6;

@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) UIScrollView *scrollView;







@property (strong, nonatomic) UILabel *leagueLabel;
@property (strong, nonatomic) UILabel *firstMatchupOne;
@property (strong, nonatomic) UILabel *firstMatchupTwo;
@property (strong, nonatomic) UILabel *firstMatchupPlayerOneScore;
@property (strong, nonatomic) UILabel *firstMatchupPlayerTwoScore;

@property (strong, nonatomic) UILabel *leagueLabel2;
@property (strong, nonatomic) UILabel *firstMatchupOne2;
@property (strong, nonatomic) UILabel *firstMatchupTwo2;
@property (strong, nonatomic) UILabel *firstMatchupPlayerOneScore2;
@property (strong, nonatomic) UILabel *firstMatchupPlayerTwoScore2;

@property (strong, nonatomic) UILabel *leagueLabel3;
@property (strong, nonatomic) UILabel *firstMatchupOne3;
@property (strong, nonatomic) UILabel *firstMatchupTwo3;
@property (strong, nonatomic) UILabel *firstMatchupPlayerOneScore3;
@property (strong, nonatomic) UILabel *firstMatchupPlayerTwoScore3;

@property (strong, nonatomic) UILabel *leagueLabel4;
@property (strong, nonatomic) UILabel *firstMatchupOne4;
@property (strong, nonatomic) UILabel *firstMatchupTwo4;
@property (strong, nonatomic) UILabel *firstMatchupPlayerOneScore4;
@property (strong, nonatomic) UILabel *firstMatchupPlayerTwoScore4;

@property (strong, nonatomic) UILabel *leagueLabel5;
@property (strong, nonatomic) UILabel *firstMatchupOne5;
@property (strong, nonatomic) UILabel *firstMatchupTwo5;
@property (strong, nonatomic) UILabel *firstMatchupPlayerOneScore5;
@property (strong, nonatomic) UILabel *firstMatchupPlayerTwoScore5;

@property (strong, nonatomic) UILabel *leagueLabel6;
@property (strong, nonatomic) UILabel *firstMatchupOne6;
@property (strong, nonatomic) UILabel *firstMatchupTwo6;
@property (strong, nonatomic) UILabel *firstMatchupPlayerOneScore6;
@property (strong, nonatomic) UILabel *firstMatchupPlayerTwoScore6;







@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) NSString *photoFilename;


@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;


@property (nonatomic,retain) NSString *oneLeagueKey;
@property (nonatomic,retain) NSString *twoLeagueKey;
@property (nonatomic,retain) NSString *threeLeagueKey;
@property (nonatomic,retain) NSString *fourLeagueKey;
@property (nonatomic,retain) NSString *fiveLeagueKey;
@property (nonatomic,retain) NSString *sixLeagueKey;

@property (nonatomic,retain) NSString *oneLeagueKeyId;
@property (nonatomic,retain) NSString *twoLeagueKeyId;
@property (nonatomic,retain) NSString *threeLeagueKeyId;
@property (nonatomic,retain) NSString *fourLeagueKeyId;
@property (nonatomic,retain) NSString *fiveLeagueKeyId;
@property (nonatomic,retain) NSString *sixLeagueKeyId;

@property (nonatomic,retain) NSString *oneLeagueId;
@property (nonatomic,retain) NSString *twoLeagueId;
@property (nonatomic,retain) NSString *threeLeagueId;
@property (nonatomic,retain) NSString *fourLeagueId;
@property (nonatomic,retain) NSString *fiveLeagueId;
@property (nonatomic,retain) NSString *sixLeagueId;


@property BOOL oneLeagueFirst;
@property BOOL twoLeagueFirst;
@property BOOL threeLeagueFirst;
@property BOOL fourLeagueFirst;
@property BOOL fiveLeagueFirst;
@property BOOL sixLeagueFirst;



@property (nonatomic, strong) IBOutlet UILabel *leagueOneYahoo;
@property (nonatomic, strong) IBOutlet UILabel *leagueTwoYahoo;
@property (nonatomic, strong) IBOutlet UILabel *leagueThreeYahoo;
@property (nonatomic, strong) IBOutlet UILabel *leagueFourYahoo;
@property (nonatomic, strong) IBOutlet UILabel *leagueFiveYahoo;
@property (nonatomic, strong) IBOutlet UILabel *leagueSixYahoo;



@property (nonatomic, strong) IBOutlet UILabel *leagueOneYahooFirstTeam;
@property (nonatomic, strong) IBOutlet UILabel *leagueOneYahooSecondTeam;

@property (nonatomic, strong) IBOutlet UILabel *leagueOneFirstTeamPoints;
@property (nonatomic, strong) IBOutlet UILabel *leagueOneSecondTeamPoints;



@property (nonatomic, strong) IBOutlet UILabel *leagueTwoYahooFirstTeam;
@property (nonatomic, strong) IBOutlet UILabel *leagueTwoYahooSecondTeam;

@property (nonatomic, strong) IBOutlet UILabel *leagueTwoFirstTeamPoints;
@property (nonatomic, strong) IBOutlet UILabel *leagueTwoSecondTeamPoints;



@property (nonatomic, strong) IBOutlet UILabel *leagueThreeYahooFirstTeam;
@property (nonatomic, strong) IBOutlet UILabel *leagueThreeYahooSecondTeam;

@property (nonatomic, strong) IBOutlet UILabel *leagueThreeFirstTeamPoints;
@property (nonatomic, strong) IBOutlet UILabel *leagueThreeSecondTeamPoints;



@property (nonatomic, strong) IBOutlet UILabel *leagueFourYahooFirstTeam;
@property (nonatomic, strong) IBOutlet UILabel *leagueFourYahooSecondTeam;

@property (nonatomic, strong) IBOutlet UILabel *leagueFourFirstTeamPoints;
@property (nonatomic, strong) IBOutlet UILabel *leagueFourSecondTeamPoints;



@property (nonatomic, strong) IBOutlet UILabel *leagueFiveYahooFirstTeam;
@property (nonatomic, strong) IBOutlet UILabel *leagueFiveYahooSecondTeam;

@property (nonatomic, strong) IBOutlet UILabel *leagueFiveFirstTeamPoints;
@property (nonatomic, strong) IBOutlet UILabel *leagueFiveSecondTeamPoints;



@property (nonatomic, strong) IBOutlet UILabel *leagueSixYahooFirstTeam;
@property (nonatomic, strong) IBOutlet UILabel *leagueSixYahooSecondTeam;

@property (nonatomic, strong) IBOutlet UILabel *leagueSixFirstTeamPoints;
@property (nonatomic, strong) IBOutlet UILabel *leagueSixSecondTeamPoints;


@property (nonatomic, strong) IBOutlet UILabel *hiddenText;
@property (nonatomic, strong) YOSSession *session;






-(IBAction)reload:(id)sender;






    
@end

