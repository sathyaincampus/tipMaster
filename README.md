# Pre-work - *Tip Master*

**Tip Master** is a tip calculator application for iOS.

Submitted by: **Sathya Srinivasan**

Time spent: **6** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
* [X] The Tip calculator has a very primitive UI. Feel free to play with colors, layout, or even modify the UI to improve it.

The following **additional** features are implemented:

- [X] Added No. of persons to split the bill across
- [X] Added a slider so we can configure any percentage we want

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/sathyaincampus/tipMaster/blob/master/tipMasterDemo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** Initially I felt little tough, but going through the instructions and doing stuff over and over by replacing different components and associated actions for them, realized that I am doing it faster than I started. This is really good and I have a feeling that I can definitely develop some apps and publish in app store.

To other developers, outlets are the type declarations that you do for any component in your code and actions are the events for those components. For ex: You have TextBox in c#.net which is a component. Declaring a TextBox like TextBox TextBox1 is an outlet and an event like TextBox1_Click is the action (you can define a meaningful name for the action though). But you should note that, if you remove the code for the event TextBox1_Click, you might have to remove the linking / association in the texbox's event mapping property, sameway, even here, we need to right click and remove the referencing outlets or events associated with this component to ensure that we don't get an error.

Implementation:
In the backend, the components are defined as xml tags in a hierarchy in the storyboard and the attributes of the tags define where they are placed and  associated connections (tags) are created to specify multiple different actions that can be associated with this component and the action tag under the connection with attribute eventType specifies, upon which type of event, this action will be triggered. And for an outlet creation, the id of the component is linked to specify what outlet property name this component is linked to.



Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** Automatic Reference counting seems interesting, as it's different from a garbage collector (which is triggered whenever memory pressure occurs or when the collection is explicitly invoked based on different languages, to free up space) where ARC allocates some chunk of memory to store info about an instance and when the last reference to that instance is lost, ARC deallocates that chunk of memory, so it can be reused for other purposes. 

There is a possibility that we can end up in some two way strong references, which when it occurs, the ARC deallocation might fail. Strong reference means one object referencing the second object and the second object referencing the first one in turn. In this case, it expects the developer to specify the type of connection for each object. This can be resolved by setting connection types as weak and unowned references as per the needs. 

Strong reference cycle for closure means, a strong reference has happened between a class instance and a closure. Closure means self contained blocks of functionality. So inside that block if we have a reference, it cant be identified by ARC if the parent instance is assigned to nil. So to avoid this refernce cycle for closure, we need to create something called closure capture list inside the closure itself, in which we have to mention weak and unowned references and we should ensure that we add a lazy property to the closure function to ensure that this will not be accessed until its actually initialized.


## License

    Copyright [2017] [Sathya Srinivasan]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.