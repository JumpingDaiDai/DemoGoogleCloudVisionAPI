//
//  FaceDetectionViewController.m
//  DemoGoogleCloudVisionAPI
//
//  Created by Alan.Yen on 2016/2/24.
//  Copyright © 2016年 17Life. All rights reserved.
//

#import "LabelDetectionViewController.h"
#import "GCVLabelDetection.h"
#import "SVProgressHUD.h"

@interface LabelDetectionViewController ()

@property (strong, nonatomic) GCVLabelDetection *labelDetection;

@end

@implementation LabelDetectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Label Detection";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - [Call Google Cloud Vision API]

- (void)processDetection {
    
    [SVProgressHUD show];
    [self processImage];
    
    __weak LabelDetectionViewController *weakSelf = self;
    self.labelDetection = [[GCVLabelDetection alloc] init];
    [self.labelDetection getLabelDetection:[self base64EncodeImage:self.image]
                                 maxResult:10
                                completion:^(NSDictionary *errorDict)
     {
         NSMutableString *textString = [NSMutableString new];
         for (GCVEntityAnnotation *annotation in weakSelf.labelDetection.annotations) {
             [textString appendString:annotation.annotationsDescription];
             [textString appendString:@" ("];
             [textString appendString:[@(annotation.score) stringValue]];
             [textString appendString:@")"];
             [textString appendString:@"\n"];
         }
         weakSelf.textView.text = textString;
         
         [SVProgressHUD dismiss];
     }];
}

@end
