//
//  ViewController.m
//  DQBirthDate
//
//  Created by  on 16/11/16.
//  Copyright © 2016年 GuanzhouDQ. All rights reserved.
//

#import "ViewController.h"
#import "DQBirthDateView.h"
#import "DQconstellationView.h"
#import "DQAgeModel.h"
#import "CalculateTool.h"

@interface ViewController ()<DQBirthDateViewDelegate,DQconstellationViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *ageLab;
@property (weak, nonatomic) IBOutlet UILabel *ConstellationLab;

@property (nonatomic, strong) DQBirthDateView *DQBirthView;
@property (nonatomic, strong) DQconstellationView *DQconstellationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.DQBirthView = [DQBirthDateView new];
    self.DQBirthView.delegate = self;
    self.DQconstellationView = [DQconstellationView new];
    self.DQconstellationView.delegate = self;
}

- (IBAction)ClickSelectAgeAction:(UIButton *)sender {
    
    [self.DQBirthView startAnimationFunction];
    
}
//点击选中哪一行 的代理方法
- (void)clickDQBirthDateViewEnsureBtnActionAgeModel:(DQAgeModel *)ageModel andConstellation:(NSString *)str{
    NSInteger age = [CalculateTool calculateNowAge:ageModel];
    self.ageLab.text = [NSString stringWithFormat:@"%@年 %@月 %@日 %zd岁",ageModel.year,ageModel.month,ageModel.day,age];
    self.ConstellationLab.text = str;
}
- (IBAction)clickConstellationAction:(UIButton *)sender {
    
    [self.DQconstellationView startAnimationFunction];
}
//点击选中哪一行 的代理方法
- (void)clickDQconstellationEnsureBtnActionConstellationStr:(NSString *)str{

    self.ConstellationLab.text = str;

}
@end
