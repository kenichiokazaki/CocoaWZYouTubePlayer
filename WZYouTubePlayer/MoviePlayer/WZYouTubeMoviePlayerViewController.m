//
//  WZYouTubeMoviePlayerViewController.m
//  WZYouTubePlayer
//
//  Copyright (c) 2012-2013 makoto_kw. All rights reserved.
//

#import "WZYouTubeMoviePlayerViewController.h"
#import "WZYouTubeVideo.h"

@interface WZYouTubeMoviePlayerViewController ()

@end

@implementation WZYouTubeMoviePlayerViewController
{
    WZYouTubeVideo *_video;
}

@synthesize video = _video;

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

- (id)initWithWatchURL:(NSURL *)watchURL
{
    if (self = [super init]) {
        WZYouTubeVideo *video = [[WZYouTubeVideo alloc] initWithWatchURL:watchURL];
        [self setVideo:video];
    }
    return self;
}

- (id)initWithVideoID:(NSString *)videoID
{
    if (self = [super init]) {
        WZYouTubeVideo *video = [[WZYouTubeVideo alloc] initWithVideoID:videoID];
        [self setVideo:video];
    }
    return self;
}

- (id)initWithVideo:(WZYouTubeVideo *)video
{
    if (self = [super init]) {
        [self setVideo:video];
    }
    return self;
}

- (void)setVideo:(WZYouTubeVideo *)video
{
    _video = video;
    __weak WZYouTubeMoviePlayerViewController *me = self;
    [_video retriveteDataFromWatchPageWithCompletionHandler:^(NSError *error) {
        if (!error) {
            NSURL *mediaURL = [video mediaURLWithQuality:WZYouTubeVideoQualityLarge];
            me.moviePlayer.contentURL = mediaURL;
            [me.moviePlayer play];
        }
    }];
}

-(void)youTubeVideo:(WZYouTubeVideo *)video didFailProcessWatchPageWithError:(NSError *)error
{
    
}

@end
