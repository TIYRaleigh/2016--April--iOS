// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Instructor.h instead.

#import <CoreData/CoreData.h>

extern const struct InstructorAttributes {
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *height;
	__unsafe_unretained NSString *lastName;
} InstructorAttributes;

extern const struct InstructorRelationships {
	__unsafe_unretained NSString *students;
} InstructorRelationships;

@class Student;

@interface InstructorID : NSManagedObjectID {}
@end

@interface _Instructor : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) InstructorID* objectID;

@property (nonatomic, strong) NSString* firstName;

//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* height;

@property (atomic) int16_t heightValue;
- (int16_t)heightValue;
- (void)setHeightValue:(int16_t)value_;

//- (BOOL)validateHeight:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastName;

//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *students;

- (NSMutableSet*)studentsSet;

@end

@interface _Instructor (StudentsCoreDataGeneratedAccessors)
- (void)addStudents:(NSSet*)value_;
- (void)removeStudents:(NSSet*)value_;
- (void)addStudentsObject:(Student*)value_;
- (void)removeStudentsObject:(Student*)value_;

@end

@interface _Instructor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;

- (NSNumber*)primitiveHeight;
- (void)setPrimitiveHeight:(NSNumber*)value;

- (int16_t)primitiveHeightValue;
- (void)setPrimitiveHeightValue:(int16_t)value_;

- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;

- (NSMutableSet*)primitiveStudents;
- (void)setPrimitiveStudents:(NSMutableSet*)value;

@end
