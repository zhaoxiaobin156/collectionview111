//
//  XMGPhoneCell.m
//  collectionview--demo
//
//  Created by mac on 16/9/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "XMGPhoneCell.h"
@interface XMGPhoneCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation XMGPhoneCell

- (void)awakeFromNib {
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 10;
    
}
-(void)setImageName:(NSString *)imageName{
    _imageName = [imageName copy];
    self.imageView.image = [UIImage imageNamed:imageName];
}


@end
