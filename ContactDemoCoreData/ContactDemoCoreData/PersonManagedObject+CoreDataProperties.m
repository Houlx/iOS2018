//
//  PersonManagedObject+CoreDataProperties.m
//  ContactDemoCoreData
//
//  Created by 侯凌霄 on 2018/3/31.
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
