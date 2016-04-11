// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Instructor.m instead.

#import "_Instructor.h"

const struct InstructorAttributes InstructorAttributes = {
	.firstName = @"firstName",
	.height = @"height",
	.lastName = @"lastName",
};

const struct InstructorRelationships InstructorRelationships = {
	.students = @"students",
};

@implementation InstructorID
@end

@implementation _Instructor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Instructor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Instructor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Instructor" inManagedObjectContext:moc_];
}

- (InstructorID*)objectID {
	return (InstructorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"heightValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"height"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic firstName;

@dynamic height;

- (int16_t)heightValue {
	NSNumber *result = [self height];
	return [result shortValue];
}

- (void)setHeightValue:(int16_t)value_ {
	[self setHeight:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveHeightValue {
	NSNumber *result = [self primitiveHeight];
	return [result shortValue];
}

- (void)setPrimitiveHeightValue:(int16_t)value_ {
	[self setPrimitiveHeight:[NSNumber numberWithShort:value_]];
}

@dynamic lastName;

@dynamic students;

- (NSMutableSet*)studentsSet {
	[self willAccessValueForKey:@"students"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"students"];

	[self didAccessValueForKey:@"students"];
	return result;
}

@end

