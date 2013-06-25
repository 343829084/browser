//
//  ViewController.m
//  Browser
//
//  Created by JacksonTian on 13-6-25.
//  Copyright (c) 2013年 wanshanglaiwojiachifan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)go:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UIWebView *browser;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.browser.scalesPageToFit = YES;
    self.browser.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)go:(id)sender {
    [self.address resignFirstResponder];
    NSString *urlString = self.address.text;
    NSLog(@"%@", urlString);
    [self.address resignFirstResponder];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self.browser loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"start load");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"finished");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@", error.description);
}

@end
