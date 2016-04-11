birthYear = 1984
birthMonth = 6
birthDay = 9
currentYear = 2015
currentMonth = 3
currentDay = 2

age = currentYear - birthYear;

if (currentMonth == birthMonth)
{
	if (currentDay >= birthDay)
	{
		NSLog(@"%d years", age);
	}
	else
	{
		NSLog(@"%d years", age - 1);
	}
}
else if (currentMonth > birthMonth)
{
	NSLog(@"%d years", age);
}
else
{
	NSLog(@"%d years", age - 1);
}