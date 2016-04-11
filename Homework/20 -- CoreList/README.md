# Homework 20

## CoreList

Create a simple tableview-based app that lists items that are added by the user. The tableview should have a `UIBarButtonItem` in the upper right of its navbar that displays a plus button. When tapped, the app should show a view modally that will ask for a string of text. Two buttons, _save_ and _cancel_ will allow the user to either close the modal view without creating a CoreData object or create a new CoreData object (be sure to save the `managedObjectContext`before closing the modal view). On `viewWillAppear:` in the base tableviewcontroller, be sure to fetch the latest list of item objects from CoreData and reload the tableview.

### Screenshots
![On launch](https://github.com/TheIronYard--Orlando/iOS--2015--SPRING/blob/master/Homework/20%20--%20CoreList/1-onLaunch.png)
![Add item modal](https://github.com/TheIronYard--Orlando/iOS--2015--SPRING/blob/master/Homework/20%20--%20CoreList/2-addItemModal.png)
![Item added, reload table](https://github.com/TheIronYard--Orlando/iOS--2015--SPRING/blob/master/Homework/20%20--%20CoreList/3-itemAddedReloadTable.png)