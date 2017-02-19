# Project 3 - *Yelp*

**NearMe** is a Yelp search app using the [Yelp API](http://www.yelp.com/developers/documentation/v2/search_api).

Time spent: *12** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] Table rows for search results should be dynamic height according to the content height.
- [x] Custom cells should have the proper Auto Layout constraints.
- [x] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).

The following **optional** features are implemented:

- [x] Search results page
   - [ ] Infinite scroll for restaurant results.
   - [ ] Implement map view of restaurant results.
- [ ] Implement the restaurant detail page.

The following **additional** features are implemented:

- [x] Search bar will filter to show businesses for which the search text is the PREFIX of any WORD in the business title (so, typing “h” won’t give you every result that has “thai” in the title or any other word with an h as the common range filter does, but you also aren’t limited to the “House of Thai” result or other businesses whose name has “h” as the first letter of the very first word - if you don’t trust your spelling of “Tamarind”, you can simply search “Hall” and get the “Tamarind Hall” you wanted).
- [x] Customize navigation bar (Yelp color, buttons)
- [x] Map view navigation bar button changes icon to a list view when in map mode, guiding users to click it again to return to viewing results as a list (table view)
- [x] Map view button icon made in house (no legal issues!  Made by me, in Sketch3)
- [x] List view icon made in house (no legal issues!  Made by me, in Sketch3)


Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. One feature I was thinking of implementing was a sort-by-distance option on the table view.  I couldn’t think of a great UI/UX prompt for this though.  My best thought so far has been a user interaction with the distance stat in the business cell, but that would be unexpected.  The table view seems too full to add anything else.  I guess it could be a more permanent choice in a settings controller, to always present results sorted by rating, or distance, or something else.  I would be interested in ideas.

2. I want my detail view to include a map with a route from the current location to the business.  I was thinking of implementing this with an framework/API that would let users set mode of transport.  I’d be curious if anyone has experience doing this.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/hlpostman/Yelp/blob/mapView/Video_Walkthrough_Yelp_inprogress.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

This is a work in progress!  (I was sick 1/2 of the week it was assigned.  But I’ll keep working on it.)

This project built on a starter project that CodePath cofounder Timothy Lee put up and made available to students for this assignment.  That is why some files say they are copyrighted by him.

## License

    Copyright 2017 H. L. Postman

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
