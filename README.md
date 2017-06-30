# Smaato iOS Coding Challenge
Write an iOS application using Objective-C that should make an HTTP GET request to
http://private-d847e-demoresponse.apiary-mock.com/questions.
Once loaded, application should randomly select one object from the response and display its
content which is either text or image. The application should also display the user information
and the date it was created e.g. “23.02.2016” or “1 day ago”, “just now”..
A user can mark the displayed content as favorite. There should be another screen where users
can see what they have marked as favorite.

## Constraints
1. No 3rd party library can be used.
2. No need to use any image/icon. No point will be awarded for UI beautification.

## Bonus Points
1. Write a Framework/Library to separate the responsibilities and to make it reusable.
2. Add features as you like, use your imagination, but coding standard and overall
architecture will have the highest value.

## Deliverables
1. XCode project/s with source code
2. Integration steps if created a Framework/Library and if needed.

## API Response Format
A JSON array representing image or text information along with user name and country. The
response is NOT case sensitive.
### Image Object Format
```
{
    "created": -449280, /* number of seconds passed since created */
    "type": "IMG",
    "data": { "url": "https://pixabay.com/xxxx" },
    "user" : { "name": "John", "country":"USA" }
}
```
### Text Object Format
```
{
    "created": -280800, /* number of seconds passed since created */
    "type": "TEXT",
    "data": { "text": "The real danger is not that computers will begin to think like men, but that men will begin to think like computers." },
    "user": { "name": "Sydney Harris", "country":"USA" }
}
```
Please note that the JSON array might have invalid or incomplete object e.g.
```
{
"created": 0
}
```
