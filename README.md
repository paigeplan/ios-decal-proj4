# Glyph #

## Authors ##
Paige Plander

## Purpose ##
Glyph is an Image-based communication app created for non-verbal individuals. It can be thought of as a app replacement for traditional picture card binders (see image)

## Features ##
*	Ability to add icons to the the “IconTiles” CollectionView. Each icon will have an image and a label. When the user presses an Icon, it will audibly read out the label that corresponds to it. This feature replaces the traditional picture card binders that many orally impaired or autistic individuals use. 
*	Ability to create custom keyboards that are based off of words rather than individual characters. That will enable the user to more easily type out sentences, if they are not comfortable with typing or able to type out full sentences using a standard keyboard. Once they complete typing out the sentence, they can press a “Speak” button that will audibly read out the sentence (if they are non-verbal, this automated voice will allow them to “speak” to others).

## Control Flow ##
*   Users initially are presented with a log in screen, to access their saved icons
*	Once logged in, they will be directed the main “Tiles” page, which displays all of their icon images and corresponding labels. At the bottom of the view, their will be a tab bar allowing them to switch instead to the “Text Speech” mode, where they can type out sentences with a custom keyboard based off a words, rather than individual characters. 
*	At the top of the view, Users will be able to access the app’s settings and filter through tile sets and keyboard sets (for example, a user would might have a different folder for “Food,” “Activities,” and “People.” Clicking on a different folder name will filter the table view to only display tiles that fall under those categories.
*	The Settings button will lead the user to a separate settings page. Here, the user can choose to do one of the following:
    *	**Add an Icon Tile** - Allows the user to add a new image icon, which involves adding an image, adding a title, and specifying what folder it should be added to. 
	*	**Add a Keyboard** - Allows the user to add a new word-based keyboard, which will be limited to a certain number of words. This keyboard can be accessed in the “Text-Speech” Mode
	*	**Add a New Folder / Remove Folder** - Allows the user to either create a new folder for the “Tiles” mode or Remove an existing Folder, and all the icons inside of it.
	*	**Switch to Basic Mode** - If the user is not able to scroll on an iPhone (my brother has not yet learned to do this), switching to basic mode will disable scrolling within the table view, and instead replace this feature with forward and back buttons. 
	*	**Log out** - this allows the user to log out, so that a different user can use the app (each user has their own set of icons and keyboards)

## Implementation ##
### Model ###
* **User.swift** — Since each user has their own set of icons and keyboards, this class will store a dictionary for the corresponding user’s icons and keyboards.
* **UserDataModel.swift** — Since what tiles and keyboards are available depends on what user is currently using the app, this data model will store an array of Users, corresponding to how many users are currently on this phone. This will need to be stored with Core Data, so it is accessible each time the app is opened.
* **IconTile.swift** — a class for Icon Tiles, which will store their images, icon names, and folder name
* **IconTilesDataModel.swift** — will store the data model that holds a dictionary of the icon tiles and their corresponding folders (maps Folder Names to Icon objects). I will also implement the necessary Core Data methods so that I am able to save the Icon Sets for each user (since each time the user accesses the app, their icons made before need to be accessible)
* **IconTileCollectionViewCell.swift** - since I am making custom Collection View cells, this class will store the extra properties needed for the “Tiles” page 
* **TextSpeechDataModel.swift** — will store the custom keyboards for the “Text-Speech” mode. Since these custom keyboards need to also be accessible each time the user opens the app, they will be stored using Core Data.

### View ###
* **TilesCollectionView** - Collection view that displays all of the tiles icons. When a user taps one of the icons, it will audibly read out the label associated with that tile. If the user is in basic mode, there will be two buttons at the bottom of the screen allowing them to navigate through tiles (as an alternative to scrolling)
* **TextSpeechView** - view that displays the current keyboard and a text field. When the user presses the “Speak” button, the app will audibly read out whatever sentence is currently in the text field.
* **AddIconTileView** - View will be composed of a textfield for inserting an icon name, a UIImage view / button allowing a user to add a photo (and see it while still editing the icon), a Picker allowing the user to pick which folder they want their new icon to be in, and an “Add Icon” button, allowing the user to add the completed Icon Tile to the “Tiles” data set.
* **AddKeyboardView** - View will have a text field for created the keyboard’s name, and another one for adding keyboard buttons. 
* **SettingsTableView** - the view for the settings page (described above). Since there are multiple settings the user can select, it makes sense that it is in a Table View, so they can scroll through the various options
* **LoginView** - will have a UIPicker for choosing an already existing user, and a button for adding a new user. If a new User is added, a text field will appear, allowing the user to input a username.

### Controller ###
*   **IconTilesTableViewController.swift** — will be a subclass of UICollectionViewController. This class will implement all the necessary delegate and data source methods of a Collection View Controller, and will have access to the TilesDataModel to update the Table View with the correct data. Since the user controls what tile icons are in the app, this table view will be dynamic.
*   **TextSpeechViewController.swift** — will provide the TextSpeechView with the appropriate keyboard data from the TextSpeechDataModel depending on which keyboard the user has selected
*   **SettingsTableViewController.swift** — implements the necessary table view delegate and data source methods. Since the user cannot customize what settings are available, this table view will be static.
*   **LoginViewController.swift** — alerts the data model of which user was selected from the user picker. Whatever user is selected will determine which icon tiles / keyboards are accessible. If a new user is created, it will update the data model to have another User, and will create blank dictionaries for that new users Icon Tiles and Keyboards.
*   **AddIconViewController.swift** — takes the data inputed into the text field for the tile name, the image that the user has selected, and the folder name to create a new IconTile object. This new Icon Tile will be added to the IconTiles Collection View.
*   **AddKeyboardViewController.swift** — takes the inputted strings to create a new keyboard, which can be accessed by its keyboard name (which is taken from the text field on the AddKeyboardView). This new keyboard will be added to the data model for the current user.
