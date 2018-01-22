//
//  UIWebView+ConverToOther.m
//  wentoubao
//
//  Created by iOS－Dev on 2017/5/9.
//  Copyright © 2017年 joinbank. All rights reserved.
//

#import "UIWebView+ConverToOther.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIWebView (ConverToOther)

- (NSData *)converToPDF{
    
    UIViewPrintFormatter *fmt = [self viewPrintFormatter];
    UIPrintPageRenderer *render = [[UIPrintPageRenderer alloc] init];
    [render addPrintFormatter:fmt startingAtPageAtIndex:0];
    CGRect page;
    page.origin.x=0;
    page.origin.y=0;
    page.size.width=600;
    page.size.height=768;
    
    CGRect printable=CGRectInset( page, 50, 50 );
    [render setValue:[NSValue valueWithCGRect:page] forKey:@"paperRect"];
    [render setValue:[NSValue valueWithCGRect:printable] forKey:@"printableRect"];
    
    NSMutableData * pdfData = [NSMutableData data];
    UIGraphicsBeginPDFContextToData( pdfData, CGRectZero, nil );
    
    for (NSInteger i=0; i < [render numberOfPages]; i++)
    {
        UIGraphicsBeginPDFPage();
        CGRect bounds = UIGraphicsGetPDFContextBounds();
        [render drawPageAtIndex:i inRect:bounds];
        
    }
    UIGraphicsEndPDFContext();
    return pdfData;
}

@end
