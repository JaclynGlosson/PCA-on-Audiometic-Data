# PCA on Audiometic Data
The objective was to perform a principal components analysis on audiometric data, and determine how many components should be retained, as well as what the retained components represent.

### Readme Table of Contents
* [Audiometric Data]()
* [Exploratory Analysis]()
* [Defining the Problem in terms of PCs]()
* [Values of the PCs]()
* [Variance Estimate Checks]()
* [Visual Plots and Interpretation]()
* [Use a Regression]()
* [Standardize Variables and Repeat Analysis]()
* [Use a Regression]()
* [References]()

## Audiometric Data
Audio.csv "gives the audiometric data for 100 males, age 39. An audiometer is used to expose an individual to a signal of a given frequency with an increasing intensity until the signal is perceived. These threshold measurements are calibrated in units referred to as decibel loss in comparison to a reference standard for the instrument. Observations were obtained, one ear at a time, for the frequencies 500 Hz, 1000 Hz, 2000 Hz, and 4000 Hz. The limits of the instrument are -10 to 99 decibels. A negative value does not imply better than average hearing: the audiometer had a calibration "zero" and these observations are in relation to that"

According to the journal of American Family Physician, “the prevalence of hearing loss varies with age, affecting at least 25 percent of patients older than 50 years and more than 50 percent of those older than 80 years.” As our sample consists of males of age 39, we should expect less than 25% of patients will have hearing loss. “Pure-tone testing presents tones across the speech spectrum (500 to 4,000 Hz) to determine if the patient's hearing levels fall within normal limits.” As our variables range from 500 to 4,000 Hz, we know that this is the human speech spectrum. During a hearing test, an Audiogram may be plotted to allow for visualization of hearing loss. An audiogram is plotted using decibel loss (db), with the following ranges:
* Mild hearing loss: 25 to 40 dB higher than normal
* Moderate hearing loss: 40 to 55 dB higher than normal
* Moderate-to-severe hearing loss: 55 to 70 dB higher than normal
* Severe hearing loss: 70 to 90 dB higher than normal
* Profound loss: 90 dB or more2

![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/fc2b30acecce2b8fe6f8652e0f118fd3693cc22c/Images/image19.png)

The audiogram can be helpful in diagnosing the type of hearing loss a patient experiences. For instance, a buildup of cerumen (earwax) may cause the graph to move in a uniform manner.  Sharp variations in the audiogram could be indicative of noise-induced hearing loss. Other variations can be attributed to occurrences of  tympanic membrane perforation or even vestibular schwannoma (benign tumor).

![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/fc2b30acecce2b8fe6f8652e0f118fd3693cc22c/Images/image3.png)

## Exploratory Analysis
The data consists of 8 different variables corresponding to right and left ear exposures to different frequencies within the range of human speech. Observations are recorded in units called “decibel loss”, with high numbers indicating greater hearing loss. Both left and right 4000Hz exposure have, on average, the greatest decibel loss at 21.35. Both left and right 500Hz exposure have, on average, the least decibel loss at -2.8 and -2.6 respectively. Note that left and right ear measurements appear to correspond with one another, both on averages as well as minimums and maximums. This is demonstrated in the correlation matrix, where the highest correlations are consistently between the right and left ears of the same Hz. This is expected, as noise-induced hearing loss or hearing loss from a disease would be expected to typically affect both ears in the same participant similarly. The strongest correlation is between L500 and L1000 at 0.78, meaning that any above average hearing loss at the L500 frequency is associated with above average hearing loss at the L1000 frequency. There are no negative correlations, meaning an above average hearing loss in one ear is not associated with below average hearing loss in the other, and that above average hearing loss in one frequency is not associated with below average hearing loss in another frequency. In examining the covariance matrix, it is clear that L4000 and R4000 have the largest variances (384.78 and 373.66, respectively). Note that these are corresponding right and left ear pairings, and that 4000Hz is the upper range of human speech. L4000 accounts for 33.3% of the variation in the data, and R4000 accounts for 32.4% of the variation in the data. In both right and left ears, as Hz increases, there is a trend towards larger average dB values (greater hearing loss) and larger variation in the data (aka larger variation in hearing abilities across participants). This could be because when hearing loss begins to occur, higher frequencies are lost first.

![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/fc2b30acecce2b8fe6f8652e0f118fd3693cc22c/Images/image23.png)
![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/fc2b30acecce2b8fe6f8652e0f118fd3693cc22c/Images/image49.png)
![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/fc2b30acecce2b8fe6f8652e0f118fd3693cc22c/Images/image28.png)
![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/79448ccbcc5fc74b6da2f2076deaa9f8afa14025/Images/image50.png)
![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/79448ccbcc5fc74b6da2f2076deaa9f8afa14025/Images/image2.png)







## References
* American Family Physician, Retrieved on 4/30/2021 at https://www.aafp.org/afp/2013/0101/p41.html#:~:text=Screening%20audiometry%20presents%20tones%20across,to%2020%20dB%20for%20children).&text=Threshold%20search%20audiometry%20determines%20the,50%20percent%20of%20the%20time.
* The National Hearing Test, Retrieved on 4/30/2021 at https://www.nationalhearingtest.org/wordpress/?p=786
* Audiometry Screening and Interpretations, Retrieved on 4/30/2021 at https://www.aafp.org/afp/2013/0101/afp20130101p41.pdf 
* Age Related Hearing Loss. Retrieved from https://medlineplus.gov/genetics/condition/age-related-hearing-loss/#:~:text=In%20most%20cases%2C%20the%20hearing,frequency%20sounds%2C%20such%20as%20speech.

