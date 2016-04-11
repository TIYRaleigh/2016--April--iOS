// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Student.h instead.

#import <CoreData/CoreData.h>

extern const struct StudentAttributes {
	__unsafe_unretained NSString *age;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
} StudentAttributes;

extern const struct StudentRelationships {
	__unsafe_unretained NSString *instructor;
} StudentRelationships;

@class Instructor;

@interface StudentID : NSManagedObjectID {}
@end

@interface _Student : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) StudentID* objectID;

@property (nonatomic, strong) NSNumber* age;

@property (atomic) int16_t ageValue;
- (int16_t)ageValue;
- (void)setAgeValue:(int16_t)value_;

//- (BOOL)validateAge:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* firstName;

//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastName;

//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Instructor *instructor;

//- (BOOL)validateInstructor:(id*)value_ error:(NSError**)error_;

@end

@interface _Student (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAge;
- (void)setPrimitiveAge:(NSNumber*)value;

- (int16_t)primitiveAgeValue;
- (void)setPrimitiveAgeValue:(int16_t)value_;

- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;

- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;

- (Instructor*)primitiveInstructor;
- (void)setPrimitiveInstructor:(Instructor*)value;

@end
