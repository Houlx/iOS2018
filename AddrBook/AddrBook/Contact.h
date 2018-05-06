//
//  Contact.h
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/6.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *office;
@property(nonatomic, copy) NSString *phoneOffice;
@property(nonatomic, copy) NSString *phonePersonal;
@property(nonatomic, copy) NSString *email;

@end
