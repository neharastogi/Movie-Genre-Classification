The dataset was too big so couldn't upload on courseworks
It can be downloaded from -
https://drive.google.com/file/d/0B0Mq5p3AWxUldkpESld5WlRqWVE/edit?usp=sharing

Unzip the "posters.zip" and place it in the same folder as the rest of files.

The "posters" folder contains all the movie posters and it should be in the same folder as the rest of the matlab files.
So copy the "posters" folder to the same level as the rest of the matlab code files.

The only setup required to run this project is - VLFeat should be installed for running this project
Or run the VLFeat setup before running the project.

The main function of the project is "movie_classifier"
In order to call this function, if the trainfile and testfile are in the same directory use this -
"movie_classifier('trainfile.txt','testfile.txt')"

The 'trainfile.txt' contains the labelled set of training posters. 
In this file, I have used "1" for comedy, "2" for horror and "3" for action.

It would display as output the accuracy achieved after the classification.

