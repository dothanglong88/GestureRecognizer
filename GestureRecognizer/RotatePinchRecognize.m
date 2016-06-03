//
//  RotatePinchRecognize.m
//  GestureRecognizer
//
//  Created by Xmob - Longdt on 6/3/16.
//  Copyright © 2016 Cuong Trinh. All rights reserved.
//

#import "RotatePinchRecognize.h"
#import "UIImageView+Photo.h"

@interface RotatePinchRecognize () <UIGestureRecognizerDelegate>

@end

@implementation RotatePinchRecognize
{
    UIImageView* girl;
    NSTimer* timer;
    
    UIPinchGestureRecognizer* pinch;
    UIRotationGestureRecognizer* rotation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    girl = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"playboy.jpg"]];
    girl.frame = CGRectMake(40, 80, 300, 425);
    girl.contentMode = UIViewContentModeScaleAspectFit;
    girl.userInteractionEnabled = true;
    girl.multipleTouchEnabled = true;
    [girl makeItCool];
    [self.view addSubview:girl];

    
    pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchBullEye:)];
    pinch.delegate = self;
    [girl addGestureRecognizer:pinch];
    
    rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationBullEye:)];
    rotation.delegate = self;
    [girl addGestureRecognizer:rotation];
    
//    [rotation requireGestureRecognizerToFail:pinch];
}

-(void) pinchBullEye: (UIPinchGestureRecognizer*) pinchRec{
    if (pinchRec.state == UIGestureRecognizerStateBegan || pinchRec.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Pinch");
        girl.transform = CGAffineTransformScale(girl.transform, pinchRec.scale, pinchRec.scale);
        pinchRec.scale = 1.0;
    }
    
}

-(void) rotationBullEye: (UIRotationGestureRecognizer*) rotateRec{
    if (rotateRec.state == UIGestureRecognizerStateBegan || rotateRec.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Rotate");
        girl.transform = CGAffineTransformRotate(rotateRec.view.transform, rotateRec.rotation);
        rotateRec.rotation = 0.0;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
 return true;
 }


//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
// if ([gestureRecognizer isMemberOfClass:[UIRotationGestureRecognizer class]] &&
// [otherGestureRecognizer isMemberOfClass:[UIPinchGestureRecognizer class]]) {
// return true;
// } else {
// return false;
// }
// }

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    if ([gestureRecognizer isMemberOfClass:[UIRotationGestureRecognizer class]] &&
//        [otherGestureRecognizer isMemberOfClass:[UIPinchGestureRecognizer class]]) {
//        return true;
//    } else {
//        return false;
//    }
//}



@end
