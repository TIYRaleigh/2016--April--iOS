// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Student.m instead.

#import "_Student.h"

const struct StudentAttributes StudentAttributes = {
	.age = @"age",
	.firstName = @"firstName",
	.lastName = @"lastName",
};

const struct StudentRelationships StudentRelationships = {
	.instructor = @"instructor",
};

@implementation StudentID
@end

@implementation _Student

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Student";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Student" inManagedObjectContext:moc_];
}

- (StudentID*)objectID {
	return (StudentID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"ageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"age"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic age;

- (int16_t)ageValue {
	NSNumber *result = [self age];
	return [result shortValue];
}

- (void)setAgeValue:(int16_t)value_ {
	[self setAge:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveAgeValue {
	NSNumber *result = [self primitiveAge];
	return [result shortValue];
}

- (void)setPrimitiveAgeValue:(int16_t)value_ {
	[self setPrimitiveAge:[NSNumber numberWithShort:value_]];
}

@dynamic firstName;

@dynamic lastName;

@dynamic instructor;

@end

