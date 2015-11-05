#    •   Story your pictures 
##    •   Winnie Wen
*        n/a

##    •	Purpose
*       	Allow users to post a set of pictures and from the set of pictures, other users can write their own stories (it can be funny, sad, romantic, etc).

##    •	Features
*  	    	Ability to post set of pictures
*  	    	Ability to view the pictures and edit it by writing stories
*  	    	Ability for different users to read different versions of the same set of stories posted by other users.
*  	    	Ability for readers to comment on stories
*  	    	Ability to like stories
*  	    	Ability to share stories
*  	    	Ability to view trending stories

##    •	Control Flow
* 	    	A front page for today’s trending stories and another tab on the same page for users to look at set of pictures that are trending.
* 	    	If user clicks on the edit button on the pictures, it will lead users to login if not already logged in. Once logged in, users can start editing and share.
* 	    	If user clicks on a trending story, it will lead to another view controller to allow user to read the story/ comment/ like
* 	    	When tapping on the share button, it will lead to your home page.

##    •	Implementation
###	    •	Model
* 		    	pictures.swift (to store your pictures for this post into a list)
* 		    	stories.swift (to store you edited stories)

    ###	    •	View
* 		    	TrendingListTableView
* 		    	HomepageView
* 		    	EditView
* 		    	viewStoryView
* 		    	LoginView

    ###		•	Controller
* 		    	TrendingListTableViewController
* 		    	HomepageViewController
* 		    	EditViewController
* 		    	viewStoryViewController
* 		    	loginViewController