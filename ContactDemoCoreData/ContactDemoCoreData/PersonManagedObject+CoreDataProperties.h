//
//  PersonManagedObject+CoreDataProperties.h
//  
//
//  Created by 侯凌霄 on 2018/4/2.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//
//

#import "PersonManagedObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PersonManagedObject (CoreDataProperties)

+ (NSFetchRequest<PersonManagedObject *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *phone;
@property (nullable, nonatomic, copy) NSString *addr;

@end

NS_ASSUME_NONNULL_END
