//
//  ViewController.m
//  YhooFantasyFootballAPIExample
//
//  Created by Matthew Noakes on 12/15/16.
//  Copyright © 2016 Matthew Noakes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

@synthesize oneLeagueKey = _oneLeagueKey;
//@synthesize key = _key;
@synthesize oneLeagueId;
/*
-(void) viewDidAppear
{
    self.session = [YOSSession sessionWithConsumerKey:@"dj0yJmk9Q0pXczRLa2hWZUhjJmQ9WVdrOVEyVTNXamN3Tm5NbWNHbzlNVFUwTlRFNE5qVTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD1kMQ--"
                                    andConsumerSecret:@"02893ec94b1a60fae1c707e0ae35bc588bb0363c"
                                     andApplicationId:nil];
    
    BOOL hasSession = [self.session resumeSession];
    
    if(hasSession == FALSE) {
        //[self.session sendUserToAuthorizationWithCallbackUrl:@"http://fantasydown.com"];
    }else{
        //NSLog(@"it worked");
        //UIAlertView *yahooSignedUp  = [[UIAlertView alloc] initWithTitle:@"Your linked!" message:@"No need to sign up!" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        //[yahooSignedUp show];
        [self getUserLeagueData];

        
    }

}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.session = [YOSSession sessionWithConsumerKey:@"dj0yJmk9Q0pXczRLa2hWZUhjJmQ9WVdrOVEyVTNXamN3Tm5NbWNHbzlNVFUwTlRFNE5qVTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD1kMQ--"
                                    andConsumerSecret:@"02893ec94b1a60fae1c707e0ae35bc588bb0363c"
                                     andApplicationId:nil];

    BOOL hasSession = [self.session resumeSession];
    
    if(hasSession == FALSE) {
        //[self.session sendUserToAuthorizationWithCallbackUrl:@"http://fantasydown.com"];
    }else{
       // NSLog(@"it worked");
        //UIAlertView *yahooSignedUp  = [[UIAlertView alloc] initWithTitle:@"Your linked!" message:@"No need to sign up!" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        //[yahooSignedUp show];
        [self getUserLeagueData];

        
    }
    
    //self.view.backgroundColor = [UIColor colorWithRed:238.0f/255.0f green:241.0f/255.0f blue:242.0f/255.0f alpha:1.0f];
    
        //self.tableView = [[UITableView alloc]init];
    //self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
   

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)runOAuth:(id)sender {
    
    self.session = [YOSSession sessionWithConsumerKey:@"dj0yJmk9Q0pXczRLa2hWZUhjJmQ9WVdrOVEyVTNXamN3Tm5NbWNHbzlNVFUwTlRFNE5qVTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD1kMQ--"
                                    andConsumerSecret:@"02893ec94b1a60fae1c707e0ae35bc588bb0363c"
                                     andApplicationId:nil];
    
     BOOL hasSession = [self.session resumeSession];
    
    if(hasSession == FALSE) {
        [self.session sendUserToAuthorizationWithCallbackUrl:@"http://fantasydown.com"];
    }else{
        //NSLog(@"it worked");
        POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(4, 4)];
        sprintAnimation.springBounciness = 20.f;
        [self.button pop_addAnimation:sprintAnimation forKey:@"size"];
        //UIAlertView *yahooSignedUp  = [[UIAlertView alloc] initWithTitle:@"Your linked!" message:@"No need to sign up!" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        //[yahooSignedUp show];
        [self getUserLeagueData];
    }

}
-(void) getUserLeagueData

{
    
    self.session = [YOSSession sessionWithConsumerKey:@"dj0yJmk9Q0pXczRLa2hWZUhjJmQ9WVdrOVEyVTNXamN3Tm5NbWNHbzlNVFUwTlRFNE5qVTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD1kMQ--"
                    
                                    andConsumerSecret:@"02893ec94b1a60fae1c707e0ae35bc588bb0363c"
                    
                                     andApplicationId:nil];
    
    
    
    BOOL hasSession = [self.session resumeSession];
    
    
    
    if(hasSession == FALSE) {
        
        //[self.session sendUserToAuthorizationWithCallbackUrl:@"http://matthewnoakes.com"];
        
        // NSLog(@"it didn't work");
        
    }else{
        
        
        
        YQLQueryRequest *request = [YQLQueryRequest requestWithSession:self.session];
        
        
        
        NSString *leaguesView2 = [NSString stringWithFormat:@"select * from fantasysports.leagues where use_login=1 and game_key in ('359', 'nfl')"];
        [request query:leaguesView2 withDelegate:self];
    }
    
    return;
    
    
}
///////////////

- (void)requestDidFinishLoading:(YOSResponseData *)request

{
    
    
    
    //THIS IS WHERE THE REQUEST IS PARSED
    
    
    
    //parse out the json data
    
    YOSResponseData *hello = request;
    
    
    
    //parse out the json data
    
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization
                          
                          JSONObjectWithData:hello.data //1
                          
                          options:kNilOptions
                          
                          error:&error];
    
    
    
    
    
    
    
    //NSLog(@"This is it. %@", json);
    
    
    
    NSDictionary *query = [json objectForKey:@"query"];
    
    NSDictionary *results = [query objectForKey:@"results"];
    
    
    
    //NSLog(@"%@", [NSNumber numberWithInt:1]);
    
    
    
    
    
    // NSLog(@"%@", json);
    
    
    
    
    
    if ( [[[json objectForKey:@"query"] objectForKey:@"count"] isEqualToNumber:[NSNumber numberWithInt:1]] && ![results isEqual:[NSNull null]]){
        
        
        
        YQLQueryRequest *request = [YQLQueryRequest requestWithSession:self.session];
        
        
        
        NSString *matchupQuery = [NSString stringWithFormat:@"select * from fantasysports.leagues.scoreboard where league_key='%@'", [[results objectForKey:@"league"] valueForKey:@"league_key"]];
        
        
        
        NSLog(@"%@", [[results objectForKey:@"league"] valueForKey:@"league_key"]);
        
        
        
        
        
        
        
        YOSResponseData *matchupData = [request query:matchupQuery];
        
        
        
        NSDictionary* matchupJson = [NSJSONSerialization
                                     
                                     JSONObjectWithData:matchupData.data
                                     
                                     options:kNilOptions
                                     
                                     error:&error];
        
        
        
        /////////////////////
        
        ////////////////////
        
        ////////////////////
        
        
        
        NSArray *leagues = [results objectForKey:@"league"];
        
        
        
        NSLog(@"%@", [leagues valueForKey:@"league_key"]);
        
        
        
        
        
        
        
        int i = 0;
        
        
        
        if ([leagues valueForKey:@"league_key"]) {
            
            
            
            
            
            YQLQueryRequest *request = [YQLQueryRequest requestWithSession:self.session];
            
            
            
            NSString *matchupQuery = [NSString stringWithFormat:@"select * from fantasysports.leagues.scoreboard where league_key='%@'", [leagues valueForKey:@"league_key"]];
            
            
            
            
            
            
            
            YOSResponseData *matchupData = [request query:matchupQuery];
            
            
            
            NSDictionary* matchupJson = [NSJSONSerialization
                                         
                                         JSONObjectWithData:matchupData.data
                                         
                                         options:kNilOptions
                                         
                                         error:&error];
            
            
            
            //NSLog(@"LEAGUE DATA%@", matchupJson);
            
            // parsing json
            
            NSArray *matchups = [[[[[[matchupJson objectForKey:@"query"] objectForKey:@"results"] valueForKey:@"league"] objectForKey:@"scoreboard"] objectForKey:@"matchups"] objectForKey:@"matchup"];
            
            
            
            NSDictionary *team1;
            
            NSDictionary *team2;
            
            
            
            
            
            //NSLog(@"%@", matchups);
            
            
            
            
            
            NSString *teamId;
            
            
            
            BOOL first;
            
            
            
            // first find user's matchup
            
            for (int m = 0; m < matchups.count; m++) {
                
                NSDictionary *matchup = [matchups objectAtIndex:m];
                
                NSArray *teams = [[matchup objectForKey:@"teams"] objectForKey:@"team"];
                
                //            bool isCurrentMatchup = false;
                
                for (int t = 0; t < teams.count; t++) {
                    
                    NSDictionary *team = [teams objectAtIndex:t];
                    
                    NSDictionary *manager = [[team objectForKey:@"managers"] objectForKey:@"manager"];
                    
                    
                    
                    if ([manager objectForKey:@"is_current_login"]) {
                        
                        team1 = team;
                        
                        teamId = [NSString stringWithFormat:@"%@",[team objectForKey:@"team_key"]];
                        
                        if (t == 0) {
                            
                            team2 = [teams lastObject];
                            
                            first = true;
                            
                        } else {
                            
                            team2 = [teams firstObject];
                            
                            first = false;
                            
                        }
                        
                        
                        
                        break;
                        
                    }
                    
                }
                
            }
            
            
            
            //NSDictionary *matchup = [matchups firstObject];
            
            
            
            NSString *teamName1 = [[[team1 objectForKey:@"managers"] objectForKey:@"manager"] objectForKey:@"nickname"]; // [[[[matchup objectForKey:@"teams"] objectForKey:@"team" ] objectAtIndex:0] objectForKey:@"name"];
            
            NSString *teamPoints1 = [[team1 objectForKey:@"team_points"] objectForKey:@"total"]; // [[[[[matchup objectForKey:@"teams"] objectForKey:@"team"] objectAtIndex:0] objectForKey:@"team_points"] objectForKey:@"total"];
            
           
            
            //NSString *firstThree = [teamPoints1 substringToIndex:3];
            
            
            
            NSString *teamName2 = [[[team2 objectForKey:@"managers"] objectForKey:@"manager"] objectForKey:@"nickname"]; // [[[[matchup objectForKey:@"teams"] objectForKey:@"team"] objectAtIndex:1] objectForKey:@"name"];
            
            NSString *teamPoints2 = [[team2 objectForKey:@"team_points"] objectForKey:@"total"]; // [[[[[matchup objectForKey:@"teams"] objectForKey:@"team"] objectAtIndex:1] objectForKey:@"team_points"] objectForKey:@"total"];
            
            //NSLog(@"%@", teamName1);
            
             //NSLog(@"%@ - %@", teamPoints1, teamPoints2);
            
            NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
            
            NSArray *arr2 = [teamPoints2 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
            
            
            
            
            
            switch (i) {
                    
                    
                case 0:
                    
                    //[self firstBlock];
                    
                    
                    //NSLog(@"%@", league);
                    
                    _oneLeagueFirst = first;
                    
                    _oneLeagueKeyId = teamId;
                    
                    oneLeagueKey = [leagues valueForKey:@"league_key"];
                    
                    self.leagueOneYahoo.font = [UIFont systemFontOfSize:20];
                    
                    
                    
                    
                    
                    self.leagueOneYahoo.text = [leagues valueForKey:@"name"];
                    
                    
                    self.leagueOneFirstTeamPoints = [[UILabel alloc] initWithFrame:CGRectMake(90, 135, 57, 21)];
                    [@"abc xyz http://www.abc.com aaa bbb ccc" substringWithRange:NSMakeRange(8, 18)];
                    
                    self.leagueOneYahooFirstTeam.text = teamName1;
                    
                    self.leagueOneFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueOneYahooSecondTeam.text = teamName2;
                    
                    self.leagueOneSecondTeamPoints.text = teamPoints2;
                    
                    NSLog(@"%@", self.leagueOneFirstTeamPoints.text);
                    [self.view addSubview:self.leagueOneFirstTeamPoints];
                    
                    
                    
                    self.firstMatchupOne = [[UILabel alloc] initWithFrame:CGRectMake(90, 125, 57, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    self.firstMatchupOne.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                      
                                                                     alpha:1.0f];
                    
                    self.firstMatchupOne.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.firstMatchupOne.text = [leagues valueForKey:@"name"];
                    
                    [self.firstMatchupOne sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel = [[UILabel alloc] initWithFrame:CGRectMake(33, 23, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel.font = [UIFont systemFontOfSize:12];
                    
                    self.leagueLabel.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                  
                                                                 alpha:1.0f];
                    
                    
                    
                    //self.leagueLabel.text= teamName1;
                    
                    //NSLog(@"%@", teamName1);
                    
                    [self.view addSubview:self.leagueLabel];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo = [[UILabel alloc] initWithFrame:CGRectMake(216, 133, 112, 35)];
                    
                    self.firstMatchupTwo.text = teamName2;
                    
                    self.firstMatchupTwo.font = [UIFont systemFontOfSize:12];
                    
                    self.firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    self.firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                      
                                                                     alpha:1.0f];
                    
                    
                    
                    
                    
                    [_firstMatchupTwo sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo];
                    
                    
                    
                    self.firstMatchupPlayerOneScore = [[UILabel alloc] initWithFrame:CGRectMake(124, 82, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore.textAlignment = NSTextAlignmentCenter;
                    
                    //self.firstMatchupPlayerOneScore.textColor= [UIColor whiteColor];
                    
                    //[self.view addSubview:self.firstMatchupPlayerOneScore];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore = [[UILabel alloc] initWithFrame:CGRectMake(155, 82, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore.textAlignment = NSTextAlignmentCenter;
                    
                    //self.firstMatchupPlayerTwoScore.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //self.firstMatchupPlayerTwoScore;
                    
                    
                    
                    
                    
                    break;
                    
                    
                    
                case 1:
                    
                    self.twoLeagueFirst = first;
                    
                    _twoLeagueKeyId = teamId;
                    
                    self.twoLeagueKey = [leagues valueForKey:@"league_key"];
                    
                    self.leagueTwoYahoo.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.leagueTwoYahoo.text = [leagues valueForKey:@"name"];
                    
                    self.leagueTwoYahooFirstTeam.text = teamName1;
                    
                    self.leagueTwoFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueTwoYahooSecondTeam.text = teamName2;
                    
                    self.leagueTwoSecondTeamPoints.text = teamPoints2;
                    
                    
                    
                    self.firstMatchupOne2 = [[UILabel alloc] initWithFrame:CGRectMake(90, 240, 30, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    //self.firstMatchupOne2.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne2.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    
                    
                    //self.firstMatchupOne2.font = [UIFont systemFontOfSize:10];
                    
                    
                    
                    self.firstMatchupOne2.text = [leagues valueForKey:@"name"];
                    
                    [self.firstMatchupOne2 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne2];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(33, 343, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel2.font = [UIFont systemFontOfSize:12];
                    
                    self.leagueLabel2.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel2.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                   
                                                                  alpha:1.0f];
                    
                    
                    
                    self.leagueLabel2.text= teamName1;
                    
                    
                    
                    
                    
                    [self.view addSubview:self.leagueLabel2];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo2 = [[UILabel alloc] initWithFrame:CGRectMake(176, 343, 112, 35)];
                    
                    self.firstMatchupTwo2.text = teamName2;
                    
                    self.firstMatchupTwo2.font = [UIFont systemFontOfSize:12];
                    
                    //firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    // firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo2.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo2.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    [_firstMatchupTwo sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo2];
                    
                    
                    
                    self.firstMatchupPlayerOneScore2 = [[UILabel alloc] initWithFrame:CGRectMake(124, 292, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    //NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore2.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore2.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore2.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore2];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore2 = [[UILabel alloc] initWithFrame:CGRectMake(155, 292, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore2.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore2.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore2.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore2];
                    
                    
                    
                    break;
                    
                    
                    
                case 2:
                    
                    
                    
                    self.threeLeagueFirst = first;
                    
                    _threeLeagueKeyId = teamId;
                    
                    self.threeLeagueKey = [leagues
                                           
                                           valueForKey:@"league_key"];
                    
                    self.leagueThreeYahoo.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.leagueThreeYahoo.text = [leagues valueForKey:@"name"];
                    
                    self.leagueThreeYahooFirstTeam.text = teamName1;
                    
                    self.leagueThreeFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueThreeYahooSecondTeam.text = teamName2;
                    
                    self.leagueThreeSecondTeamPoints.text = teamPoints2;
                    
                    
                    
                    self.firstMatchupOne3 = [[UILabel alloc] initWithFrame:CGRectMake(90, 240, 30, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    //self.firstMatchupOne2.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne3.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    
                    
                    //self.firstMatchupOne2.font = [UIFont systemFontOfSize:10];
                    
                    
                    
                    self.firstMatchupOne3.text = [leagues valueForKey:@"name"];
                    
                    [self.firstMatchupOne3 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne3];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(33, 343, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel3.font = [UIFont systemFontOfSize:12];
                    
                    self.leagueLabel3.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel3.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                   
                                                                  alpha:1.0f];
                    
                    
                    
                    self.leagueLabel3.text= teamName1;
                    
                    
                    
                    
                    
                    [self.view addSubview:self.leagueLabel3];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo3 = [[UILabel alloc] initWithFrame:CGRectMake(176, 343, 112, 35)];
                    
                    self.firstMatchupTwo3.text = teamName2;
                    
                    self.firstMatchupTwo3.font = [UIFont systemFontOfSize:12];
                    
                    //firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    // firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo3.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo3.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    [_firstMatchupTwo3 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo3];
                    
                    
                    
                    self.firstMatchupPlayerOneScore2 = [[UILabel alloc] initWithFrame:CGRectMake(124, 292, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    //NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore3.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore3.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore3.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore3.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore3];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore3 = [[UILabel alloc] initWithFrame:CGRectMake(155, 292, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore3.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore3.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore3.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore3.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore3];
                    
                    
                    
                    
                    
                    break;
                    
                    
                    
                case 3:
                    
                    
                    
                    self.fourLeagueFirst = first;
                    
                    _fourLeagueKeyId = teamId;
                    
                    self.fourLeagueKey = [leagues valueForKey:@"league_key"];
                    
                    self.leagueFourYahoo.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.leagueFourYahoo.text = [leagues valueForKey:@"name"];
                    
                    self.leagueFourYahooFirstTeam.text = teamName1;
                    
                    self.leagueFourFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueFourYahooSecondTeam.text = teamName2;
                    
                    self.leagueFourSecondTeamPoints.text = teamPoints2;
                    
                    
                    
                    self.firstMatchupOne4 = [[UILabel alloc] initWithFrame:CGRectMake(90, 240, 30, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    //self.firstMatchupOne2.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne4.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    
                    
                    //self.firstMatchupOne2.font = [UIFont systemFontOfSize:10];
                    
                    
                    
                    self.firstMatchupOne4.text = [leagues valueForKey:@"name"];
                    
                    [self.firstMatchupOne4 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne4];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(33, 343, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel4.font = [UIFont systemFontOfSize:12];
                    
                    self.leagueLabel4.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel4.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                   
                                                                  alpha:1.0f];
                    
                    
                    
                    self.leagueLabel4.text= teamName1;
                    
                    
                    
                    
                    
                    [self.view addSubview:self.leagueLabel4];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo4 = [[UILabel alloc] initWithFrame:CGRectMake(176, 343, 112, 35)];
                    
                    self.firstMatchupTwo4.text = teamName2;
                    
                    self.firstMatchupTwo4.font = [UIFont systemFontOfSize:12];
                    
                    //firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    // firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo4.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo4.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    [_firstMatchupTwo4 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo4];
                    
                    
                    
                    self.firstMatchupPlayerOneScore4 = [[UILabel alloc] initWithFrame:CGRectMake(124, 292, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    //NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore4.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore4.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore4.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore4.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore4];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore4 = [[UILabel alloc] initWithFrame:CGRectMake(155, 292, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore4.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore4.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore4.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore4.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore4];
                    
                    
                    
                    break;
                    
                    
                    
                case 4:
                    
                    
                    
                    self.fiveLeagueFirst = first;
                    
                    _fiveLeagueKeyId = teamId;
                    
                    self.fiveLeagueKey = [leagues valueForKey:@"league_key"];
                    
                    self.leagueFiveYahoo.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.leagueFiveYahoo.text = [leagues valueForKey:@"name"];
                    
                    self.leagueFiveYahooFirstTeam.text = teamName1;
                    
                    self.leagueFiveFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueFiveYahooSecondTeam.text = teamName2;
                    
                    self.leagueFiveSecondTeamPoints.text = teamPoints2;
                    
                    
                    
                    self.firstMatchupOne5 = [[UILabel alloc] initWithFrame:CGRectMake(90, 240, 30, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    //self.firstMatchupOne2.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne5.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    
                    
                    //self.firstMatchupOne2.font = [UIFont systemFontOfSize:10];
                    
                    
                    
                    self.firstMatchupOne5.text = [leagues valueForKey:@"name"];
                    
                    [self.firstMatchupOne5 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne5];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(33, 343, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel5.font = [UIFont systemFontOfSize:12];
                    
                    self.leagueLabel5.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel5.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                   
                                                                  alpha:1.0f];
                    
                    
                    
                    self.leagueLabel5.text= teamName1;
                    
                    
                    
                    
                    
                    [self.view addSubview:self.leagueLabel5];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo5 = [[UILabel alloc] initWithFrame:CGRectMake(176, 343, 112, 35)];
                    
                    self.firstMatchupTwo5.text = teamName2;
                    
                    self.firstMatchupTwo5.font = [UIFont systemFontOfSize:12];
                    
                    //firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    // firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo5.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo5.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    [_firstMatchupTwo5 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo5];
                    
                    
                    
                    self.firstMatchupPlayerOneScore5 = [[UILabel alloc] initWithFrame:CGRectMake(124, 292, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    //NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore5.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore5.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore5.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore5.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore5];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore5 = [[UILabel alloc] initWithFrame:CGRectMake(155, 292, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore5.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore5.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore5.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore5.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore5];
                    
                    
                    
                    
                    
                    break;
                    
                    
                    
                case 5:
                    
                    
                    
                    ////////////////////////
                    
                    
                    
                    
                    
                    self.sixLeagueFirst = first;
                    
                    _sixLeagueKeyId = teamId;
                    
                    self.sixLeagueKey = [leagues valueForKey:@"league_key"];
                    
                    self.leagueSixYahoo.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.leagueSixYahoo.text = [leagues valueForKey:@"name"];
                    
                    self.leagueSixYahooFirstTeam.text = teamName1;
                    
                    self.leagueSixFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueSixYahooSecondTeam.text = teamName2;
                    
                    self.leagueSixSecondTeamPoints.text = teamPoints2;
                    
                    
                    
                    self.firstMatchupOne6 = [[UILabel alloc] initWithFrame:CGRectMake(90, 240, 30, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    //self.firstMatchupOne2.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne6.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    
                    
                    //self.firstMatchupOne2.font = [UIFont systemFontOfSize:10];
                    
                    
                    
                    self.firstMatchupOne6.text = [leagues valueForKey:@"name"];
                    
                    [self.firstMatchupOne6 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne6];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel6 = [[UILabel alloc] initWithFrame:CGRectMake(33, 343, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel6.font = [UIFont systemFontOfSize:12];
                    
                    self.leagueLabel6.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel6.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                   
                                                                  alpha:1.0f];
                    
                    
                    
                    self.leagueLabel6.text= teamName1;
                    
                    
                    
                    
                    
                    [self.view addSubview:self.leagueLabel6];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo6 = [[UILabel alloc] initWithFrame:CGRectMake(176, 343, 112, 35)];
                    
                    self.firstMatchupTwo6.text = teamName2;
                    
                    self.firstMatchupTwo6.font = [UIFont systemFontOfSize:12];
                    
                    //firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    // firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo6.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo6.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    [_firstMatchupTwo6 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo6];
                    
                    
                    
                    self.firstMatchupPlayerOneScore6 = [[UILabel alloc] initWithFrame:CGRectMake(124, 292, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    //NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore6.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore6.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore6.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore6.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore6];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore6 = [[UILabel alloc] initWithFrame:CGRectMake(155, 292, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore6.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore6.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore6.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore6.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore6];
                    
                    
                    
                    
                    
                    
                    
                    break;
                    
                    
                    
            }
            
            
            
            //NSLog(@"\n\nLeague: %@\n%@ (%@) vs %@ (%@)\n\n", [league valueForKey:@"name"], teamName1, teamPoints1, teamName2, teamPoints2);
            
            
            
            i++;
            
            
            
        }
        
        
        
        
        
        
        
        ///////////////////
        
        //////////////////
        
        //////////////////
        
    } else if(![results isEqual:[NSNull null]]) {
        
        
        
        
        
        //if (![results isEqual:[NSNull null]]) {
        
        
        
        NSArray *leagues = [results objectForKey:@"league"];
        
        
        //This is where key for each league user is in
        //////NSLog(@"%@", [leagues valueForKey:@"league_key"]);
        
        
        
        
        
        
        
        int i = 0;
        
        for (NSDictionary *league in leagues) {
            
            YQLQueryRequest *request = [YQLQueryRequest requestWithSession:self.session];
            
            
            
            NSString *matchupQuery = [NSString stringWithFormat:@"select * from fantasysports.leagues.scoreboard where league_key='%@'", [league valueForKey:@"league_key"]];
            
            
            
            
            
            
            
            YOSResponseData *matchupData = [request query:matchupQuery];
            
            
            
            NSDictionary* matchupJson = [NSJSONSerialization
                                         
                                         JSONObjectWithData:matchupData.data
                                         
                                         options:kNilOptions
                                         
                                         error:&error];
            
            
            
            //NSLog(@"LEAGUE DATA%@", matchupJson);
            
            // parsing json
            
            NSArray *matchups = [[[[[[matchupJson objectForKey:@"query"] objectForKey:@"results"] valueForKey:@"league"] objectForKey:@"scoreboard"] objectForKey:@"matchups"] objectForKey:@"matchup"];
            
            
            
            NSDictionary *team1;
            
            NSDictionary *team2;
            
            
            
            NSString *teamId;
            
            
            
            BOOL first = false;
            
            
            
            // first find user's matchup
            
            for (int m = 0; m < matchups.count; m++) {
                
                NSDictionary *matchup = [matchups objectAtIndex:m];
                
                NSArray *teams = [[matchup objectForKey:@"teams"] objectForKey:@"team"];
                
                //            bool isCurrentMatchup = false;
                
                for (int t = 0; t < teams.count; t++) {
                    
                    NSDictionary *team = [teams objectAtIndex:t];
                    
                    NSDictionary *manager = [[team objectForKey:@"managers"] objectForKey:@"manager"];
                    
                    
                    
                    if ([manager objectForKey:@"is_current_login"]) {
                        
                        team1 = team;
                        
                        teamId = [NSString stringWithFormat:@"%@",[team objectForKey:@"team_key"]];
                        
                        if (t == 0) {
                            
                            team2 = [teams lastObject];
                            
                            
                            
                            first = true;
                            
                        } else {
                            
                            team2 = [teams firstObject];
                            
                            first = false;
                            
                        }
                        
                        
                        
                        break;
                        
                    }
                    
                }
                
            }
            
            
            
            //NSDictionary *matchup = [matchups firstObject];
            
            
            
            NSString *teamName1 = [[[team1 objectForKey:@"managers"] objectForKey:@"manager"] objectForKey:@"nickname"]; // [[[[matchup objectForKey:@"teams"] objectForKey:@"team" ] objectAtIndex:0] objectForKey:@"name"];
            
            NSString *teamPoints1 = [[team1 objectForKey:@"team_points"] objectForKey:@"total"]; // [[[[[matchup objectForKey:@"teams"] objectForKey:@"team"] objectAtIndex:0] objectForKey:@"team_points"] objectForKey:@"total"];
            
            
            
            //NSString *firstThree = [teamPoints1 substringToIndex:3];
            
            
            
            NSString *teamName2 = [[[team2 objectForKey:@"managers"] objectForKey:@"manager"] objectForKey:@"nickname"]; // [[[[matchup objectForKey:@"teams"] objectForKey:@"team"] objectAtIndex:1] objectForKey:@"name"];
            
            NSString *teamPoints2 = [[team2 objectForKey:@"team_points"] objectForKey:@"total"]; // [[[[[matchup objectForKey:@"teams"] objectForKey:@"team"] objectAtIndex:1] objectForKey:@"team_points"] objectForKey:@"total"];
            
            //NSLog(@"%@", teamName1);
            
            
            
            NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
            
            NSArray *arr2 = [teamPoints2 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
            
            
        
            
            
            switch (i) {
                    
                case 0:
                    
                    //NSLog(@"%@", league);
                    
                    _oneLeagueFirst = first;
                    
                    _oneLeagueKeyId = teamId;
                    
                    oneLeagueKey = [league objectForKey:@"league_key"];
                    
                    //self.leagueOneYahoo.font = [UIFont systemFontOfSize:20];
                    
                    
                    
                    
                    
                    self.leagueOneYahoo.text = [league valueForKey:@"name"];
                    
                    
                    //NSLog(@"Team points one: %@ - Team points two: %@", teamPoints1, teamPoints2);
                    //NSLog(@"%@", [league valueForKey:@"name"]);
                    
                    [@"abc xyz http://www.abc.com aaa bbb ccc" substringWithRange:NSMakeRange(8, 18)];
                    
                    self.leagueOneYahooFirstTeam.text = teamName1;
                    
                    self.leagueOneFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueOneYahooSecondTeam.text = teamName2;
                    
                    self.leagueOneSecondTeamPoints.text = teamPoints2;
                    NSLog(@"Team points one: %@", teamPoints1);
                    //[self.view addSubview:self.leagueOneFirstTeamPoints];
                    //[self.]
                    
                    self.firstMatchupOne = [[UILabel alloc] initWithFrame:CGRectMake(125, 125, 212, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    self.firstMatchupOne.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne.textColor = [UIColor blackColor];
                    
                    self.firstMatchupOne.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.firstMatchupOne.text = [league valueForKey:@"name"];
                    
                    //F\[self.firstMatchupOne sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne];
                    

                    
                    
                    
                    
                    //223
                    
                    
                    
                    self.leagueLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4.5, self.view.frame.size.height/3, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel.font = [UIFont systemFontOfSize:12];
                    
                    //self.leagueLabel.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel.textColor = [UIColor blackColor];
                    
                    
                    
                    self.leagueLabel.text= teamName1;
                    
                    
                    
                    [self.view addSubview:self.leagueLabel];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/3, 112, 35)];
                    
                    
                    
                    self.firstMatchupTwo.font = [UIFont systemFontOfSize:12];
                    
                    //self.firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                   // self.firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    //self.firstMatchupTwo.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo.textColor = [UIColor blackColor];
                    
                    
                    self.firstMatchupTwo.text = teamName2;
                    
                    
                    //[_firstMatchupTwo sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo];
                    
                    
                    
                    self.firstMatchupPlayerOneScore = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/3.75,self.view.frame.size.height/3.66, 40, 40)];
                    
                    
                
                    self.firstMatchupPlayerOneScore.text = arr[0];//teamPoints1 if you want the whole number
                    
                    self.firstMatchupPlayerOneScore.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore.textColor= [UIColor blackColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/1.65, self.view.frame.size.height/3.66, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore.text = arr2[0];//teamPoints2 if you want the whole number
                    
                    self.firstMatchupPlayerTwoScore.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore.textColor= [UIColor blackColor];
                    NSLog(@"is this running score: %@ - %@", self.firstMatchupPlayerOneScore.text,self.firstMatchupPlayerTwoScore.text);
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //self.firstMatchupPlayerTwoScore;
                    
                    
                    
                    
                    
                    break;
                    
                    
                    
                case 1:
                    
                    self.twoLeagueFirst = first;
                    
                    _twoLeagueKeyId = teamId;
                    
                    self.twoLeagueKey = [league objectForKey:@"league_key"];
                    
                    self.leagueTwoYahoo.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.leagueTwoYahoo.text = [league valueForKey:@"name"];
                    
                    self.leagueTwoYahooFirstTeam.text = teamName1;
                    
                    self.leagueTwoFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueTwoYahooSecondTeam.text = teamName2;
                    
                    self.leagueTwoSecondTeamPoints.text = teamPoints2;
                    
                    
                    
                    self.firstMatchupOne2 = [[UILabel alloc] initWithFrame:CGRectMake(125, 340, 130, 30)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    //self.firstMatchupOne2.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne2.textColor = [UIColor blackColor];
                    //self.firstMatchupOne2.constraints =
                    
                    
                    
                    //self.firstMatchupOne2.font = [UIFont systemFontOfSize:10];
                    
                    
                    
                    self.firstMatchupOne2.text = [league valueForKey:@"name"];
                    
                    //[self.firstMatchupOne2 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne2];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4.5, 443, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel2.font = [UIFont systemFontOfSize:12];
                    
                    //self.leagueLabel2.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel2.textColor = [UIColor blackColor];
                    
                    
                    
                    self.leagueLabel2.text= teamName1;
                    
                    
                    
                    
                    
                    [self.view addSubview:self.leagueLabel2];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo2 = [[UILabel alloc] initWithFrame:CGRectMake(176, 443, 112, 35)];
                    
                    self.firstMatchupTwo2.text = teamName2;
                    
                    self.firstMatchupTwo2.font = [UIFont systemFontOfSize:12];
                    
                    //firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    // firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo2.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo2.textColor = [UIColor blackColor];
                    
                    //[_firstMatchupTwo sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo2];
                    
                    
                    
                    self.firstMatchupPlayerOneScore2 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/3.75, self.view.frame.size.height/1.70, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    //NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore2.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore2.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore2.textColor= [UIColor blackColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore2];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore2 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/1.65, self.view.frame.size.height/1.70, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore2.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore2.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore2.textColor= [UIColor blackColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore2];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    break;
                    
                    
                    
                case 2:
                    
                    
                    
                    self.threeLeagueFirst = first;
                    
                    _threeLeagueKeyId = teamId;
                    
                    self.threeLeagueKey = [league objectForKey:@"league_key"];
                    
                    self.leagueThreeYahoo.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.leagueThreeYahoo.text = [league valueForKey:@"name"];
                    
                    self.leagueThreeYahooFirstTeam.text = teamName1;
                    
                    self.leagueThreeFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueThreeYahooSecondTeam.text = teamName2;
                    
                    self.leagueThreeSecondTeamPoints.text = teamPoints2;
                    
                    
                    
                    self.firstMatchupOne3 = [[UILabel alloc] initWithFrame:CGRectMake(125, 325, 30, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    //self.firstMatchupOne2.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne3.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    
                    
                    //self.firstMatchupOne2.font = [UIFont systemFontOfSize:10];
                    
                    
                    
                    self.firstMatchupOne3.text = [league valueForKey:@"name"];
                    
                    //[self.firstMatchupOne3 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne3];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(68, 443, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel3.font = [UIFont systemFontOfSize:12];
                    
                    self.leagueLabel3.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel3.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                   
                                                                  alpha:1.0f];
                    
                    
                    
                    self.leagueLabel3.text= teamName1;
                    
                    
                    
                    
                    
                    [self.view addSubview:self.leagueLabel3];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo3 = [[UILabel alloc] initWithFrame:CGRectMake(176, 443, 112, 35)];
                    
                    self.firstMatchupTwo3.text = teamName2;
                    
                    self.firstMatchupTwo3.font = [UIFont systemFontOfSize:12];
                    
                    //firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    // firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo3.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo3.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    //[_firstMatchupTwo3 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo3];
                    
                    
                    
                    self.firstMatchupPlayerOneScore2 = [[UILabel alloc] initWithFrame:CGRectMake(124, 392, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    //NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore3.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore3.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore3.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore3.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore3];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore3 = [[UILabel alloc] initWithFrame:CGRectMake(155, 392, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore3.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore3.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore3.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore3.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore3];
                    
                    
                    
                    
                    
                    break;
                    
                    /*
                    
                case 3:
                    
                    
                    
                    self.fourLeagueFirst = first;
                    
                    _fourLeagueKeyId = teamId;
                    
                    self.fourLeagueKey = [league objectForKey:@"league_key"];
                    
                    self.leagueFourYahoo.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.leagueFourYahoo.text = [league valueForKey:@"name"];
                    
                    self.leagueFourYahooFirstTeam.text = teamName1;
                    
                    self.leagueFourFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueFourYahooSecondTeam.text = teamName2;
                    
                    self.leagueFourSecondTeamPoints.text = teamPoints2;
                    
                    
                    
                    self.firstMatchupOne4 = [[UILabel alloc] initWithFrame:CGRectMake(90, 340, 30, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    //self.firstMatchupOne2.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne4.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    
                    
                    //self.firstMatchupOne2.font = [UIFont systemFontOfSize:10];
                    
                    
                    
                    self.firstMatchupOne4.text = [league valueForKey:@"name"];
                    
                    [self.firstMatchupOne4 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne4];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(33, 443, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel4.font = [UIFont systemFontOfSize:12];
                    
                    self.leagueLabel4.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel4.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                   
                                                                  alpha:1.0f];
                    
                    
                    
                    self.leagueLabel4.text= teamName1;
                    
                    
                    
                    
                    
                    [self.view addSubview:self.leagueLabel4];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo4 = [[UILabel alloc] initWithFrame:CGRectMake(176, 443, 112, 35)];
                    
                    self.firstMatchupTwo4.text = teamName2;
                    
                    self.firstMatchupTwo4.font = [UIFont systemFontOfSize:12];
                    
                    //firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    // firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo4.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo4.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    [_firstMatchupTwo4 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo4];
                    
                    
                    
                    self.firstMatchupPlayerOneScore4 = [[UILabel alloc] initWithFrame:CGRectMake(124, 392, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    //NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore4.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore4.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore4.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore4.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore4];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore4 = [[UILabel alloc] initWithFrame:CGRectMake(155, 392, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore4.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore4.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore4.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore4.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore4];
                    
                    
                    
                    break;
                    
                    
                    
                case 4:
                    
                    
                    
                    self.fiveLeagueFirst = first;
                    
                    _fiveLeagueKeyId = teamId;
                    
                    self.fiveLeagueKey = [league objectForKey:@"league_key"];
                    
                    self.leagueFiveYahoo.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.leagueFiveYahoo.text = [league valueForKey:@"name"];
                    
                    self.leagueFiveYahooFirstTeam.text = teamName1;
                    
                    self.leagueFiveFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueFiveYahooSecondTeam.text = teamName2;
                    
                    self.leagueFiveSecondTeamPoints.text = teamPoints2;
                    
                    
                    
                    self.firstMatchupOne5 = [[UILabel alloc] initWithFrame:CGRectMake(90, 340, 30, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    //self.firstMatchupOne2.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne5.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    
                    
                    //self.firstMatchupOne2.font = [UIFont systemFontOfSize:10];
                    
                    
                    
                    self.firstMatchupOne5.text = [league valueForKey:@"name"];
                    
                    [self.firstMatchupOne5 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne5];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(33, 343, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel5.font = [UIFont systemFontOfSize:12];
                    
                    self.leagueLabel5.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel5.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                   
                                                                  alpha:1.0f];
                    
                    
                    
                    self.leagueLabel5.text= teamName1;
                    
                    
                    
                    
                    
                    [self.view addSubview:self.leagueLabel5];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo5 = [[UILabel alloc] initWithFrame:CGRectMake(176, 343, 112, 35)];
                    
                    self.firstMatchupTwo5.text = teamName2;
                    
                    self.firstMatchupTwo5.font = [UIFont systemFontOfSize:12];
                    
                    //firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    // firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo5.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo5.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    [_firstMatchupTwo5 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo5];
                    
                    
                    
                    self.firstMatchupPlayerOneScore5 = [[UILabel alloc] initWithFrame:CGRectMake(124, 292, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    //NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore5.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore5.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore5.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore5.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore5];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore5 = [[UILabel alloc] initWithFrame:CGRectMake(155, 292, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore5.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore5.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore5.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore5.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore5];
                    
                    
                    
                    
                    
                    break;
                    
                    
                    
                case 5:
                    
                    
                    
                    ////////////////////////
                    
                    
                    
                    
                    
                    self.sixLeagueFirst = first;
                    
                    _sixLeagueKeyId = teamId;
                    
                    self.sixLeagueKey = [league objectForKey:@"league_key"];
                    
                    self.leagueSixYahoo.font = [UIFont systemFontOfSize:12];
                    
                    
                    
                    self.leagueSixYahoo.text = [league valueForKey:@"name"];
                    
                    self.leagueSixYahooFirstTeam.text = teamName1;
                    
                    self.leagueSixFirstTeamPoints.text = teamPoints1;
                    
                    self.leagueSixYahooSecondTeam.text = teamName2;
                    
                    self.leagueSixSecondTeamPoints.text = teamPoints2;
                    
                    
                    
                    self.firstMatchupOne6 = [[UILabel alloc] initWithFrame:CGRectMake(90, 240, 30, 21)];
                    
                    //self.firstMatchupOne.text = @"Deez";
                    
                    //self.firstMatchupOne2.contentMode = UIViewContentModeScaleAspectFill;
                    
                    self.firstMatchupOne6.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    
                    
                    //self.firstMatchupOne2.font = [UIFont systemFontOfSize:10];
                    
                    
                    
                    self.firstMatchupOne6.text = [league valueForKey:@"name"];
                    
                    [self.firstMatchupOne6 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupOne6];
                    
                    
                    
                    
                    
                    
                    
                    self.leagueLabel6 = [[UILabel alloc] initWithFrame:CGRectMake(33, 343, 112, 35)];
                    
                    //self.leagueLabel.text = @"Matthew Noakes";
                    
                    self.leagueLabel6.font = [UIFont systemFontOfSize:12];
                    
                    self.leagueLabel6.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.leagueLabel6.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                   
                                                                  alpha:1.0f];
                    
                    
                    
                    self.leagueLabel6.text= teamName1;
                    
                    
                    
                    
                    
                    [self.view addSubview:self.leagueLabel6];
                    
                    
                    
                    
                    
                    self.firstMatchupTwo6 = [[UILabel alloc] initWithFrame:CGRectMake(176, 343, 112, 35)];
                    
                    self.firstMatchupTwo6.text = teamName2;
                    
                    self.firstMatchupTwo6.font = [UIFont systemFontOfSize:12];
                    
                    //firstMatchupTwo.contentMode = UIViewContentModeScaleAspectFill;
                    
                    
                    
                    // firstMatchupTwo.contentMode = UIViewContentModeCenter;;
                    
                    
                    
                    self.firstMatchupTwo6.textAlignment = NSTextAlignmentCenter;
                    
                    
                    
                    self.firstMatchupTwo6.textColor = [UIColor colorWithRed:79.0f/255.0f green:93.0f/255.0f blue:106.0f/255.0f
                                                       
                                                                      alpha:1.0f];
                    
                    [_firstMatchupTwo6 sizeToFit];
                    
                    [self.view addSubview:self.firstMatchupTwo6];
                    
                    
                    
                    self.firstMatchupPlayerOneScore6 = [[UILabel alloc] initWithFrame:CGRectMake(124, 292, 40, 40)];
                    
                    
                    
                    //NSString *firstThree = [teamPoints1 substringToIndex:2];
                    
                    
                    
                    //NSArray *arr = [teamPoints1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerOneScore6.text = arr[0];
                    
                    self.firstMatchupPlayerOneScore6.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerOneScore6.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerOneScore6.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerOneScore6];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore6 = [[UILabel alloc] initWithFrame:CGRectMake(155, 292, 40, 40)];
                    
                    
                    
                    
                    
                    self.firstMatchupPlayerTwoScore6.text = arr2[0];
                    
                    self.firstMatchupPlayerTwoScore6.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13];
                    
                    self.firstMatchupPlayerTwoScore6.textAlignment = NSTextAlignmentCenter;
                    
                    self.firstMatchupPlayerTwoScore6.textColor= [UIColor whiteColor];
                    
                    [self.view addSubview:self.firstMatchupPlayerTwoScore6];
                    
                    
                    
                    
                    
                    
                    
                    break;
                    
                */
                    
            }
            
            
            
            //NSLog(@"\n\nLeague: %@\n%@ (%@) vs %@ (%@)\n\n", [league valueForKey:@"name"], teamName1, teamPoints1, teamName2, teamPoints2);
            
            
            
            i++;
            
            
            
        }
        
        
        
        
        
        
        
        //314.l.954537.t.1
        
        //314.l.987290.t.1
        
        //314.l.987588.t.1
        
        //314.l.987724.t.1
        
        
        
        
        
    }
    
    
    
}

@end
