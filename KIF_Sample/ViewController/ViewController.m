//
//  ViewController.m
//  KIF_Sample
//
//  Created by daisuke on 2015/12/5.
//  Copyright © 2015年 dse12345z. All rights reserved.
//

#import "ViewController.h"
#import "DaiInboxHUD.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UITextField *acountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSInteger dataCount;

@end

@implementation ViewController

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndetifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
    }
    cell.imageView.image = [UIImage imageNamed:@"daisuke"];
    cell.textLabel.text = @"daisuke";
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - IBAction

- (IBAction)submitButtonAction:(id)sender {
    NSString *acount = self.acountTextField.text;
    NSString *password = self.passwordTextField.text;
    if ([acount isEqualToString:@"daisuke"] && [password isEqualToString:@"daisuke"]) {
        __weak typeof(self) weakSelf = self;
        [self alertViewMessage:@"登入成功！" completion:^{
            [DaiInboxHUD show];
            [weakSelf performSelector:@selector(fetchDataEnd) withObject:nil afterDelay:10];
        }];
    }
    else {
        [self alertViewMessage:@"帳號密碼錯誤！" completion:nil];
    }
}

#pragma mark - private instance method

#pragma mark * init

- (void)setupInitValues {
    self.submitButton.accessibilityLabel = @"登入";
    self.dataCount = 0;
}

#pragma mark * fetch data

- (void)fetchDataEnd {
    [DaiInboxHUD hide];
    self.loginView.hidden = YES;
    self.dataCount = 10;
    [self.tableView reloadData];
}

#pragma mark * UIAlertController

- (void)alertViewMessage:(NSString *)message completion:(void(^)())completion {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"系統訊息" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler: ^(UIAlertAction *action) {
        [alertView dismissViewControllerAnimated:YES completion:nil];
        if (completion) {
            completion();
        }
    }];
    [alertView addAction:cancel];
    [self presentViewController:alertView animated:YES completion:nil];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupInitValues];
}

@end
