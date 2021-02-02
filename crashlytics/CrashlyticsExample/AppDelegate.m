//
//  Copyright (c) 2018 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "AppDelegate.h"

@import FirebaseCore;
@import Vision;
#import <CrashlyticsExample-Swift.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  [FIRApp configure];

    
    NSLog(@"Calling performRequests SWIFT");
    [[[VisionTest alloc] init] doStuff];
    
  if (@available(iOS 13.0, *)) {
      NSLog(@"Calling performRequests OBJC");

      
    CGSize size = CGSizeMake(64, 64);
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    [[UIColor whiteColor] setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    VNImageRequestHandler *handler = [[VNImageRequestHandler alloc] initWithCGImage:image.CGImage options:@{}];
    VNGenerateAttentionBasedSaliencyImageRequest *request = [[VNGenerateAttentionBasedSaliencyImageRequest alloc] init];
    NSError *error = nil;
    [handler performRequests:@[request] error:&error];

        
  } else {
    NSLog(@"Did not call");
  }

    return YES;
}

@end
