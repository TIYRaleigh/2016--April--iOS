# Homework

## 16 - Forecaster

Build a simple weather app that utilizes both the Google Maps API to convert a zip code provided by the user into a set of latitute and longitude coordinates, as well as the Dark Sky API to use those coordinates to find the local weather conditions for that location.

This is the API call to use to get coordinates from a zip code:
http://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:12345&sensor=false
(Where 12345 is the zipcode. The address field has a city name in it, which is ignored by the API server for this request)

Go to [Forecast.io Developer](https://developer.forecast.io) to sign up for a developer account. All you need to provide is an email address. Once logged in you should see your API key at the bottom of the screen. Use this key anywhere the API doc says "APIKEY". Here is a link to the Forecast.io [API docs](https://developer.forecast.io/docs/v2). We're going to use the API call that does NOT include the time in the URL. This will give us forecast info for today and the next week.

Here are some design layout ideas for the views:

![City Table View](https://github.com/TheIronYard--Orlando/iOS--2015--SPRING/blob/master/Homework/16%20--%20Forecaster/CityTableView.png)
![Add City View](https://github.com/TheIronYard--Orlando/iOS--2015--SPRING/blob/master/Homework/16%20--%20Forecaster/AddCityView.png)
![Forecast Detail View](https://github.com/TheIronYard--Orlando/iOS--2015--SPRING/blob/master/Homework/16%20--%20Forecaster/DetailedForecast.png)

### Steps to Success

#### Storyboard Tasks

* [ ] Build a table view controller that will display location information for the zipcode provided. One cell per location.
* [ ] Provide a plus button in the navbar that will open the modal view to prompt for zipcode. 
* [ ] Build a modal view controller that will prompt the user for a zip code.
* [ ] Build a view that will be pushed onto the main navigation stack when a city cell it tapped. This view will display detailed forecast information about the current weather as well as provide a button to show the forecast for the next week.
* [ ] Build a table view that shows the next seven days of weather for the selected location. It will also be pushed onto the navigation stack from the weather detail view from the previous step.
* [ ]
* [ ]
* [ ]
* [ ]
* [ ]
* [ ]

#### Code Tasks

* [ ] Create a model object to store information about a particular location.
* [ ] Perform an asynchronous network call to ask the Google Maps API for a lat/long pair based on a given zipcode.
* [ ] Perform an asynchronous network call to ask the Forecast.io weather API for weather info on each location in the list.
* [ ] Create a model object to store the weather info for each location.
* [ ]
* [ ]
* [ ]
* [ ]
* [ ]
* [ ]
