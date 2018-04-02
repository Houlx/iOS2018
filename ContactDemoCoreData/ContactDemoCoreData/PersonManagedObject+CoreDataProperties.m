//
//  PersonManagedObject+CoreDataProperties.m
//  
//
//  Created by 侯凌霄 on 2018/4/2.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//
//

#import "PersonManagedObject+CoreDataProperties.h"

@implementation PersonManagedObject (CoreDataProperties)

+ (NSFetchRequest<PersonManagedObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Person"];
}

@dynamic name;
@dynamic phone;
@dynamic addr;

@end
