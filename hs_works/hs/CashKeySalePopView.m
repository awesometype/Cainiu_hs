//
//  CashKeySalePopView.m
//  hs
//
//  Created by PXJ on 15/12/7.
//  Copyright © 2015年 luckin. All rights reserved.
//
#define Key_DecimalPlaces productModel.decimalPlaces.intValue
#define DecimalFloatStr(a) [Helper rangeFloatString:a withDecimalPlaces:Key_DecimalPlaces]

#import "CashKeySalePopView.h"
#import "CashKeySaleModel.h"

@implementation CashKeySalePopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }

    return self;
}
- (id)initShowSucWithTitleArray:(NSArray*)btnTitleArray;
{
    self = [super init];
    if (self) {
    
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeigth);
        [self initUI];
        float itemHeight = ScreenWidth/8;
        float alertHeight = itemHeight*3;
        float alertWidth = ScreenWidth - itemHeight*2;
        float btnViewHeight = ScreenWidth/6;
        
        UIView * btnView = [[UIView alloc] init];
        btnView.center = CGPointMake(ScreenWidth/2, ScreenHeigth/2+alertHeight/2-(btnViewHeight-itemHeight)/2);
        btnView.bounds = CGRectMake(0, 0, alertWidth, btnViewHeight);
        btnView.layer.cornerRadius =itemHeight/6;
        btnView.layer.masksToBounds = YES;
        btnView.backgroundColor = K_color_red;
        [_shadeView addSubview:btnView];
        
        
        NSLog(@"%f",ScreenHeigth/2+alertHeight/2 -(btnViewHeight -itemHeight));
        
        UIView * alertView = [[UIView alloc] init];
        alertView.center = CGPointMake(ScreenWidth/2, ScreenHeigth/2-itemHeight/2);
        alertView.bounds = CGRectMake(0, 0, alertWidth, alertHeight);
        alertView.layer.cornerRadius = itemHeight/6;
        alertView.layer.masksToBounds = YES;
        alertView.backgroundColor = [UIColor whiteColor];
        [_shadeView addSubview:alertView];
        
        
        UILabel * showLab = [[UILabel alloc]init];
        showLab.center = CGPointMake(alertWidth/2, itemHeight*2/3);
        showLab.bounds = CGRectMake(0, 0, alertWidth, 20);
        showLab.text = @"委托成功";
        showLab.textAlignment = NSTextAlignmentCenter;
        showLab.font = [UIFont systemFontOfSize:itemHeight/3];
        [alertView addSubview:showLab];
        
        
        
        
//        UIImageView *imgV = [[UIImageView alloc] init];
//        imgV.center = CGPointMake(alertWidth/2, itemHeight*11/6);
//        imgV.bounds = CGRectMake(0, 0, 50*ScreenWidth/375, 55*ScreenWidth/375);
//        imgV.image = [UIImage imageNamed:@"check_entrust"];
//        [alertView addSubview:imgV];
        
        UIButton * imgbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imgbtn.center = CGPointMake(alertWidth/2, itemHeight*11/6);
        imgbtn.bounds = CGRectMake(0, 0, 50*ScreenWidth/375, 55*ScreenWidth/375);
        imgbtn.tag = 66665;
        [imgbtn setBackgroundImage:[UIImage imageNamed:@"check_entrust"] forState:UIControlStateNormal];
        [imgbtn addTarget:self action:@selector(confirmbtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [alertView addSubview:imgbtn];

             float btnWidth =(alertWidth-(btnTitleArray.count-1))/btnTitleArray.count;
        for (int i=0; i<btnTitleArray.count; i++) {
            if (i!=0) {
                
                UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake((btnWidth+1)*i-1, btnViewHeight-itemHeight, 1, itemHeight)];
                lineView.backgroundColor = K_COLOR_CUSTEM(153, 153, 153, 1);
                [btnView addSubview:lineView];
                
            }
            
            
            UIButton * confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            confirmBtn.frame  = CGRectMake((btnWidth+1)*i,btnViewHeight-itemHeight, btnWidth, itemHeight);
            confirmBtn.tag = 66666+i;
            NSString * btntitle = btnTitleArray[i];
            NSLog(@"%@",btntitle);
            [confirmBtn setTitle:btntitle forState:UIControlStateNormal];
            [confirmBtn.titleLabel setFont:[UIFont systemFontOfSize:itemHeight/3]];
            [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [confirmBtn addTarget:self action:@selector(confirmbtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btnView addSubview:confirmBtn];
            
            
        }
        
    }
    return self;
}

- (id)initShowAlertWithInfo:(CashKeySaleModel*)saleModel setBtnTitleArray:(NSArray*)btnTitleArray productModel:(FoyerProductModel *)productModel;
{
    self = [super init];
    if (self)
    {
        
        self.saleModel = saleModel;
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeigth);
        [self initUI];
        float itemHeight = ScreenWidth/8;
        float alertHeight = itemHeight*5.5;

        if([saleModel.partKeySale isEqualToString:@"1"])
        {
            alertHeight = itemHeight *6.5;
        }
        float alertWidth = ScreenWidth - itemHeight*2;
        float btnViewHeight = ScreenWidth/6;
        
        UIView * btnView = [[UIView alloc] init];
        btnView.center = CGPointMake(ScreenWidth/2, ScreenHeigth/2+alertHeight/2-(btnViewHeight-itemHeight)/2);
        btnView.bounds = CGRectMake(0, 0, alertWidth, btnViewHeight);
        btnView.layer.cornerRadius =itemHeight/6;
        btnView.layer.masksToBounds = YES;
        btnView.backgroundColor = K_color_red;
        [_shadeView addSubview:btnView];
        
        UIView * alertView = [[UIView alloc] init];
        alertView.center = CGPointMake(ScreenWidth/2, ScreenHeigth/2-itemHeight/2);
        alertView.bounds = CGRectMake(0, 0, alertWidth, alertHeight);
        alertView.layer.cornerRadius = itemHeight/6;
        alertView.layer.masksToBounds = YES;
        alertView.backgroundColor = [UIColor whiteColor];
        [_shadeView addSubview:alertView];
        
        UILabel * markLab = [[UILabel alloc] initWithFrame:CGRectMake(20, itemHeight*1/3, 20, itemHeight/3)];
        markLab.text = [saleModel.buyOrSal isEqualToString:@"B"]?@"多":@"空";
        markLab.backgroundColor = [saleModel.buyOrSal isEqualToString:@"B"]?K_color_red:K_color_green;
        markLab.textColor = [UIColor whiteColor];
        markLab.font = FontSize(11);
        markLab.textAlignment = NSTextAlignmentCenter;
        [alertView addSubview:markLab];
        
        UILabel * productNameLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(markLab.frame)+ 10, CGRectGetMinY(markLab.frame), alertWidth-70, itemHeight/3)];
        productNameLab.text = saleModel.productName;
        productNameLab.textColor = K_color_grayBlack;
        productNameLab.font = FontSize(11);
        [alertView addSubview:productNameLab];
        
        UILabel * newPriceLab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(markLab.frame)+itemHeight/3, alertWidth-40, itemHeight*2/3)];
        newPriceLab.font = FontSize(13);
        newPriceLab.textColor = K_color_grayBlack;
        [alertView addSubview:newPriceLab];
        NSString * newPrice = [NSString stringWithFormat:@"平%@价格：%@元（市价）",markLab.text,DecimalFloatStr(saleModel.nePrice)];
        NSMutableAttributedString * muNewPrice = [Helper multiplicityText:newPrice from:(int)(newPrice.length-4) to:4 color:K_color_red];
        newPriceLab.attributedText = muNewPrice;
        
        
        UILabel * numLab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(newPriceLab.frame), alertWidth-40, itemHeight*2/3)];
        numLab.text = [NSString stringWithFormat:@"平仓数量：%d手",saleModel.num.intValue];
        numLab.font = FontSize(13);
        numLab.textColor = K_color_grayBlack;

        [alertView addSubview:numLab];
        
        
        UILabel * tmpMoneyLab = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(numLab.frame), alertWidth-40, itemHeight*2/3)];
        tmpMoneyLab.text = [NSString stringWithFormat:@"参考手续费：%@元",DecimalFloatStr(saleModel.tmpMoney)];
        tmpMoneyLab.font = FontSize(13);
        tmpMoneyLab.textColor = K_color_grayBlack;

        [alertView addSubview:tmpMoneyLab];
        
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(20, itemHeight*10/3, alertWidth-40, 1)];
        lineView.backgroundColor= K_color_grayBlack;
        [alertView addSubview:lineView];
        
        UILabel * remindLab = [[UILabel alloc] initWithFrame:CGRectMake(20, itemHeight*11/3, alertWidth-40, itemHeight)];
        remindLab.text = @"1、闪电平仓目的为简化交易步骤，所以以市价报单。\n2、手续费以成交时对应手续费为准。";
        remindLab.numberOfLines = 0;
        remindLab.textColor = K_color_grayBlack;
        remindLab.font = FontSize(11);
        [alertView addSubview:remindLab];
        if([saleModel.partKeySale isEqualToString:@"1"])
        {
            UILabel * showLab = [[UILabel alloc] init];
            showLab.center = CGPointMake(alertWidth/2, itemHeight*5+5);
            showLab.bounds = CGRectMake(0, 0, alertWidth, 20);
            showLab.font = FontSize(12*ScreenWidth/375);
            showLab.textAlignment = NSTextAlignmentCenter;
            showLab.text =  @"您当前有委托单，需要撤单后才能全部平仓" ;
            showLab.textColor = K_color_red;
            [alertView addSubview:showLab];
    
            UIButton *partKeySaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            partKeySaleBtn.frame = CGRectMake(25, CGRectGetMaxY(showLab.frame), alertWidth-50, 40*ScreenWidth/375);
            partKeySaleBtn.layer.cornerRadius = 3;
            partKeySaleBtn.layer.masksToBounds = YES;
            partKeySaleBtn.layer.borderColor = K_color_red.CGColor;
            partKeySaleBtn.layer.borderWidth = 1;
            partKeySaleBtn.tag = 66665;
            [partKeySaleBtn addTarget:self action:@selector(confirmbtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [partKeySaleBtn setTitle:@"部分平仓" forState:UIControlStateNormal];
            [partKeySaleBtn setTitleColor:K_color_red forState:UIControlStateNormal];
            [partKeySaleBtn.titleLabel setFont:FontSize(13)];
            [alertView addSubview:partKeySaleBtn];

        }

        float btnWidth =(alertWidth-(btnTitleArray.count-1))/btnTitleArray.count;
        for (int i=0; i<btnTitleArray.count; i++) {
            if (i!=0) {
                
                UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake((btnWidth+1)*i-1, btnViewHeight-itemHeight, 1, itemHeight)];
                lineView.backgroundColor = K_COLOR_CUSTEM(153, 153, 153, 1);
                [btnView addSubview:lineView];
                
            }
            
            
            UIButton * confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            confirmBtn.frame  = CGRectMake((btnWidth+1)*i,btnViewHeight-itemHeight, btnWidth, itemHeight);
            confirmBtn.tag = 66666+i;
            NSString * btntitle = btnTitleArray[i];
            [confirmBtn setTitle:btntitle forState:UIControlStateNormal];
            [confirmBtn.titleLabel setFont:[UIFont systemFontOfSize:itemHeight/3]];
            [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [confirmBtn addTarget:self action:@selector(confirmbtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btnView addSubview:confirmBtn];
            
            
        }
        
    }
    return self;
}
- (void)initUI
{
    //
    _shadeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeigth)];

    [self addSubview:_shadeView];

}
- (void)confirmbtnClick:(UIButton*)button
{
    self.confirmClick(button);
    [self removeFromSuperview];
    
}
@end