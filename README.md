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

## Defining the Problem in terms of PCs
The principle component formulas are as follows, where Y1 is the first principle component, and a11….a18, the eigenvectors, are as large as possible, subject to √(a112 + a122  +...+ a152 ) =1

* Y1=a11\*L500+a12\*L1000+a13\*L2000+a14\*L4000 + a15\*R500 + a16\*R1000 + a17\*R2000 + a18\*R4000
* Y2=a21\*L500+a22\*L1000+a23\*L2000+a24\*L4000 + a25\*R500 + a26\*R1000 + a27\*R2000 + a28\*R4000...
Eigenvalues demonstrate the share of importance of the PC relative to the other PCs. The sum of all eigenvalues is equal to 1154.5, the sum of all variances. The first three eigenvalues explain 86.1% of the variance in the data, which meets the 80% threshold for variation explanation. The first eigenvalue explains a very large share of the data variation, at 61%. As both R4000 and L4000 variables had the largest variances, it was expected that they would have large eigenvectors on PC1, with L4000 being the larger of the two (-0.68 and -0.66, respectively). This makes intuitive sense, because we want to magnify the variable with the largest variance on the first PC, which will account for the largest percent of variation. For PC1, a high decibel loss in L4000 and R4000 is associated with a low value of PC1. All values are negative, such that any large number of decibel loss will have a low value of PC1. For PC2, a high decibel loss in L2000 is associated with a high value of PC2. As L2000 was the variable associated with the third most variance in the data (10%) it makes sense that it would have a high eigentor. Interestingly, the highest eigenvectors in PC3 are the same for PC1- except that a high decibel loss in L4000 is associated with a high PC3 value, while a high decibel loss in R4000 is associated with a low PC3 value. Thus PC3 shows the differentiation between R and L 4000 variables.

## Values of the PCs
From PC1, individuals 98, 71, 28, 35, and 66 all have the most severe hearing loss in R and L 4000Hz, because they have the lowest values. From PC2 we can see that individuals 40, 97, and 60 have high hearing loss in L2000, because they have the highest values. This is consistent with the original data.
![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/0720d79525c1eb852c9f7ba3027193851621ee5f/Images/image11.png)

## Variance Estimate Checks

<b>Property C: Check variance estimates of PCs vs Original X and other properties.</b><br>
For this analysis, we only looked at the top three PCs. As the PCs after PC3 are a weaker percent variance than the three largest percent variances in the original variables, they should be excluded. 

![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/0720d79525c1eb852c9f7ba3027193851621ee5f/Images/image4.png)

<b>Property E: eik is proportional to correlation (Xi, Xk), p (Xi,Xk)</b><br>
Yes, as we see the eigenvectors for L4000 and R4000 are both the strongest correlations.

![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/0720d79525c1eb852c9f7ba3027193851621ee5f/Images/image30.png)

<b>Property G: Are they all uncorrelated? </b><br>
Yes!

## Visual Plots and Interpretation
The below scree plot visualizes the percent variance of each PC (red) and variable (blue). As anticipated, the percent variance of each PC (red) consistently decreases. The cluster plot graphs PC1 (low value indicates high hearing loss in L and R 4000HZ) against PC2 (a high decibel loss in L2000 is associated with a high value of PC2). Therefore, those values in the left half of the graph, particularly the upper left half, represent those with higher hearing loss. When compared to the original data, this seems fairly consistent. Visually you can see that most participants have a fairly normal range of hearing, as they are clustered to the right.

![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/ebf67f005e2ff1038565e8e62d2001d95a896f73/Images/image53.png)
![](https://github.com/JaclynGlosson/PCA-on-Audiometic-Data/blob/ebf67f005e2ff1038565e8e62d2001d95a896f73/Images/image56.png)

## Use a Regression
Running a regression between original variables and a random Y variable, and running a regression between all PCs and a random Y variable, I am able to get the same R squared (0.9804) meaning that 98% of the variance in the data can be explained by the regression line. In running a regression between the same random Y variable and L4000 and R4000, I get an R squared of 0.669, while running a regression with the first two PCs results in an R squared of 0.967. This demonstrates the dimension reduction ability of PCA.

## Standardize Variables and Repeat Analysis
Intuitively, standardization is not ideal for this type of data set, because it could make interpretation difficult for individuals. Standardization can help us identify those values that are away from the average- but interpreters should be wary if the average value for a column is actually indicative of hearing loss- because then anyone average, above average, or even slightly below average could have hearing loss.  Since interpretations for hearing loss are in decibels, it is better advised to leave the data as is, because it will lose its interpretability.
For standardized PC1, we see that all eigenvectors are negative and of similar weight, therefore PC1 can be thought of as a measure of overall hearing loss. PC2 has negative values on higher frequencies, and positive values on lower frequencies. Individuals who have hearing loss on higher frequencies will have a low PC2 value relative to those with hearing loss at lower frequencies. This PC2 could even differentiate those that have noise induced hearing loss (in which higher frequencies are the first to go) from other types of hearing loss.
For this, we use the eigenvalue-greater-than-one rule, which states that “for standardized data the amount of variance extracted by each component should, at minimum, be equal to the variance of at least one variable” (Subhash Sharma, Pg 76). Therefore we will only look at the first two PCs for our analysis. However, it is worth noting that the third PC is very close to 1. PC3 has negative values on the peripheral frequencies- the highest and lowest, while midrange frequencies are positive.




## References
* American Family Physician, Retrieved on 4/30/2021 at https://www.aafp.org/afp/2013/0101/p41.html#:~:text=Screening%20audiometry%20presents%20tones%20across,to%2020%20dB%20for%20children).&text=Threshold%20search%20audiometry%20determines%20the,50%20percent%20of%20the%20time.
* The National Hearing Test, Retrieved on 4/30/2021 at https://www.nationalhearingtest.org/wordpress/?p=786
* Audiometry Screening and Interpretations, Retrieved on 4/30/2021 at https://www.aafp.org/afp/2013/0101/afp20130101p41.pdf 
* Age Related Hearing Loss. Retrieved from https://medlineplus.gov/genetics/condition/age-related-hearing-loss/#:~:text=In%20most%20cases%2C%20the%20hearing,frequency%20sounds%2C%20such%20as%20speech.

