//
//  ButtonUITests.m
//  KIF_Sample
//
//  Created by daisuke on 2015/12/6.
//  Copyright © 2015年 dse12345z. All rights reserved.
//

#import "ButtonUITests.h"

@implementation ButtonUITests

- (void)beforeEach {
}

- (void)afterEach {
}

- (void)testTapButton {
    if ([tester tryFindingViewWithAccessibilityLabel:@"登入" traits:UIAccessibilityTraitButton error:nil]) {
        [tester tapViewWithAccessibilityLabel:@"登入"];
        [tester waitForTimeInterval:5.0f];
    }
    if ([tester tryFindingViewWithAccessibilityLabel:@"確定" traits:UIAccessibilityTraitButton error:nil]) {
        [tester tapViewWithAccessibilityLabel:@"確定"];
        [tester waitForTimeInterval:5.0f];
    }
}

@end
