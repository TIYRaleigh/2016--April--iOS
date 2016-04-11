# Homework 

## 15 - Github Friends 

Extend the functionality of the Github Friends app made in class to support a detail view that shows the name of the user as the title of the view, the location and email of the user in the upper left corner of the view, and below that a list of repositories that belong to the user.

### Steps to Success

#### Code Tasks

* [ ] Create a class called FriendDetailViewController. It will subclass from UIViewController.
* [ ] Have an instance of this new view controller push onto the navigation stack when a FriendCell is tapped.

In the FriendDetailViewController:

* [ ] Create a public property called friendInfo that is an NSDictionary.
* [ ] Create a private instance variable called repos that is an NSArray.

* [ ] In viewDidLoad:
	* [ ] Fetch the "login" attribute from the friendInfo dictionary and store it in a local variable.
	* [ ] Create a url string variable that uses the following: "https://api.github.com/users/?/repos" where ? is replaced with the username of the Github user.
	* [ ] Convert the url string created above into an NSURL object.
	* [ ] Create an NSURLRequest object with the NSURL above.
	* [ ] Run a synchronous request with the request above and save the response in an NSData object.
	* [ ] Convert the NSData object above into a native object (hint, you created a private instance variable to store this).
		* [ ] Print the contents of the native object above to the console.
	* [ ] Create two UILabel objects and place them on the screen with a frame. The first one should be in the upper left corner and the second one should be left aligned with the first and just below it with a small amount of padding.
		* [ ] The two labels above should display the location and the email address of the user.
	* [ ] Create a UITableView object and set its frame to be just below the second label from above. It should be the same width as the view and should extend to the bottom of the view.
	* [ ] The tableview object created above should have its datasource and delegate set to this view controller (hint: you'll need to declare this view controller as implementing these in the private interface).
	* [ ] Be sure to add both labels and the tableview to the view as subviews.

* [ ] Implement the three tableview data source methods
* [ ] In each cell in the tableview, display the "name" of the repo in the textLabel.
* [ ] Bonus points: If the repo has a "description" display it in the detailTextLabel.
