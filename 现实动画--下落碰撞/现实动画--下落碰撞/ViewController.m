//
//  ViewController.m
//  现实动画--下落碰撞
//
//  Created by Alan on 2019/3/28.
//  Copyright © 2019 zhaixingzhi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    //现实动画
    UIDynamicAnimator*ani;
    //现实行为
    UIDynamicItemBehavior*dynamic;
    //重力行为
    UIGravityBehavior*gravity;
    //碰撞行为
    UICollisionBehavior*collision;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //创建动画
    ani=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    //创建行为
    //现实行为需要注意不要写错，一般会写错为UIDynamicBehavior
    dynamic=[[UIDynamicItemBehavior alloc]initWithItems:nil];
    //设置弹力值
    dynamic.elasticity=0.8;
    //重力行为
    gravity=[[UIGravityBehavior alloc]initWithItems:nil];
    //气泡上升的
    //    gravity.gravityDirection=CGVectorMake(0, -1);
    
    //碰撞行为
    collision=[[UICollisionBehavior alloc]initWithItems:nil];
    //设置刚体碰撞
    collision.translatesReferenceBoundsIntoBoundary=YES;
    //把行为加入到动画中
    [ani addBehavior:dynamic];
    [ani addBehavior:gravity];
    [ani addBehavior:collision];

    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int a=self.view.frame.size.width;
    
    int x=arc4random()%a;
    int z=arc4random()%50+1;
    NSArray*array=@[@"pig_3",@"littlestone1",@"bird_11",@"circlewood1",@"bluebird1",@"bird1"];
    //每点击一次屏幕，我们创建一个ImageView
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(x, 200, z, z)];
    imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",array[arc4random()%6]]];
    
    [self.view addSubview:imageView];
    
    //把imageView遵循行为
    [dynamic addItem:imageView];
    [gravity addItem:imageView];
    [collision addItem:imageView];
    
    
    
}

@end
