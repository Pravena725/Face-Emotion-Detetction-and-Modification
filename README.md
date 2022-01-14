# Face-Emotion-Detetction-and-Modification

**ABSTRACT** - This project aims to detect and modify the emotion of a face present in a given image using
matlab. This was solved by making use of AlexNet. AlexNet is a convolutional neural network
(CNN) and therefore can be trained with any specific dataset in order to predict the result. This
project made use of the FER 2013 dataset consisting of faces classified by emotions. This
model predicts the emotion of any given face with 60% accuracy. The given face is further
worked upon by detecting and identifying the mouth of the face using the vision cascade object
detector. These coordinates are then used to remove the mouth of the given face using inpaint
exemplar (so that during further changes, the skin-tone of the face remains the same). By
segmenting just the lips of specific emotions such as sad, happy and neutral, we are able to
replace it onto the given face to change the overall emotion of the face. The user is given the
choice of which expression to replace onto the given face.


**PROBLEM STATEMENT** - To detect the emotion of the face detected in a given image by training and testing a dataset containing a large collection of images using deep learning models such as the Alexnet neural networks and further change the emotion of the face to either smiling, frowning or neutral by detecting the mouth of the detected face and replacing it with the chosen expression.
