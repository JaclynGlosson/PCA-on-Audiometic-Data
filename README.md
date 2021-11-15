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

## Audiometric Data
Audio.csv "gives the audiometric data for 100 males, age 39. An audiometer is used to expose an individual to a signal of a given frequency with an increasing intensity until the signal is perceived. These threshold measurements are calibrated in units referred to as decibel loss in comparison to a reference standard for the instrument. Observations were obtained, one ear at a time, for the frequencies 500 Hz, 1000 Hz, 2000 Hz, and 4000 Hz. The limits of the instrument are -10 to 99 decibels. A negative value does not imply better than average hearing: the audiometer had a calibration "zero" and these observations are in relation to that"

According to the journal of American Family Physician, “the prevalence of hearing loss varies with age, affecting at least 25 percent of patients older than 50 years and more than 50 percent of those older than 80 years.” As our sample consists of males of age 39, we should expect less than 25% of patients will have hearing loss. “Pure-tone testing presents tones across the speech spectrum (500 to 4,000 Hz) to determine if the patient's hearing levels fall within normal limits.” As our variables range from 500 to 4,000 Hz, we know that this is the human speech spectrum. During a hearing test, an Audiogram may be plotted to allow for visualization of hearing loss. An audiogram is plotted using decibel loss (db), with the following ranges:
* Mild hearing loss: 25 to 40 dB higher than normal
* Moderate hearing loss: 40 to 55 dB higher than normal
* Moderate-to-severe hearing loss: 55 to 70 dB higher than normal
* Severe hearing loss: 70 to 90 dB higher than normal
* Profound loss: 90 dB or more2



The audiogram can be helpful in diagnosing the type of hearing loss a patient experiences. For instance, a buildup of cerumen (earwax) may cause the graph to move in a uniform manner.  Sharp variations in the audiogram could be indicative of noise-induced hearing loss. Other variations can be attributed to occurrences of  tympanic membrane perforation or even vestibular schwannoma (benign tumor).
