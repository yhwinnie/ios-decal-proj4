{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf130
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset0 Monaco;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab529
\pard\tx529\pardeftab529\pardirnatural\partightenfactor0

\f0\fs22 \cf0 \CocoaLigature0 \
\'95	Story your pictures \
\'95	Winnie Wen\
	\'95	n/a\
\'95	Purpose\
	\'95	Allow users to post a set of pictures and from the set of 	pictures, other users can write their own stories (it can be funny, sad, romantic, etc).\
\'95	Features\
	\'95	Ability to post set of pictures\
	\'95	Ability to view the pictures and edit it by writing stories\'a0\
	\'95	Ability for different users to read different versions of the same set of stories posted by other users.\'a0\
	\'95	Ability for readers to comment on stories\'a0\
	\'95	Ability to like stories\
	\'95	Ability to share stories\'a0\
	\'95	Ability to view trending stories\'a0\
\'95	Control Flow\
	\'95	A front page for today\'92s trending stories and another tab on the same page for users to look at set of pictures that are trending.\'a0\
	\'95	If user clicks on the edit button on the pictures, it will lead users to login if not already logged in. Once logged in, users can start editing and share.\
	\'95	If user clicks on a trending story, it will lead to another view controller to allow user to read the story/ comment/ like\
	\'95	When tapping on the share button, it will lead to your home page.\
\'95	Implementation\
	\'95	Model\
		
\f1 \uc0\u8259 
\f0 	pictures.swift (to store your pictures for this post into a list)\'a0\
		
\f1 \uc0\u8259 
\f0 	stories.swift (to store you edited stories)\'a0\
	\'95	View\
		
\f1 \uc0\u8259 
\f0 	TrendingListTableView\'a0\
		
\f1 \uc0\u8259 
\f0 	HomepageView\
		
\f1 \uc0\u8259 
\f0 	EditView\
		
\f1 \uc0\u8259 
\f0 	viewStoryView\'a0\
		
\f1 \uc0\u8259 
\f0 	LoginView\
\'95	Controller\
		
\f1 \uc0\u8259 
\f0 	TrendingListTableViewController\
		
\f1 \uc0\u8259 
\f0 	HomepageViewController\
		
\f1 \uc0\u8259 
\f0 	EditViewController\
		
\f1 \uc0\u8259 
\f0 	viewStoryViewController\
		
\f1 \uc0\u8259 
\f0 	loginViewController}