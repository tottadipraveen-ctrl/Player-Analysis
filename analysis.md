Initially I tried plotting runs scored in each match and runs per inning

<img width="937" height="516" alt="image" src="https://github.com/user-attachments/assets/9b06005d-30e0-44b7-bbbf-1d7144ece693" />

It looks fine, no unusual findings

Later I plotted Cummulative Batting Average 

<img width="937" height="516" alt="image" src="https://github.com/user-attachments/assets/da9f0231-87d1-4716-b082-084766f946ba" />

Initial fluctuations are common because less number of matches are played and slight change in runs scored and getting out can alter it.
But, after it got some consistency and dropped a bit this happens when the batsman gets out scoring lesser than previous batting average.
This trend can be observed from 30th match.

After being the Player of the Match in Asia Cup 2025 Final (September 28, 2025) by scoring an unbeaten 69 off 53 while anchoring the innings in his 30th game, the next game he played was on 31st October 2025 vs Australia, in Australia from then batting average dropped significantly from 53.4 (after 30th match) to 42.4 (after 53rd match).

# Bootstrap 
BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
Based on 10000 bootstrap replicates

## Mean Runs 
|Phase| Bootstrap mean| 95% Confidence Interval|
|-----|---------------|------------------------|
|Early Career| 32.01419 | (22.03, 43.10 )|
|Late Career| 26.36094 | (18.83, 34.43 ) | 

<img width="937" height="516" alt="image" src="https://github.com/user-attachments/assets/ea0c3220-1e78-45b2-b623-725de16ff965" />
<img width="937" height="516" alt="image" src="https://github.com/user-attachments/assets/7e7f0785-f109-4938-a169-cbbc2e747058" />



Bootstrap difference in runs 
|2.5%   |  97.5% |
|-------|--------|
|-7.230978 |19.198623 |

Zero is within the interval. So, we cannot conclude from it.

Average runs declined during Phase 2. However, the confidence intervals overlap considerably.
Therefore, the reduction cannot be considered statistically significant.

## Dot Ball Percentage
|Phase| Dot Ball % |
|-----|------------|
|Overall| 32.75229 |
|Before| 32.09302 | 
|After| 33.70787 |  

It didn't change much

## Strike Rate
|Phase| Bootstrap mean| 95% Confidence Interval|
|-----|---------------|------------------------|
|Early Career| 148.6211 | (130.0, 170.1 )|
|Late Career|136.1606 |(113.6, 160.4 ) | 

Bootstrap difference in SR 
|2.5%   |  97.5% |
|-------|--------|
| -18.71794 | 43.39881 |


The player scored at a slightly slower rate during the later part. However, the overlap between confidence intervals indicates that the observed difference may be due to sampling variability.

<img width="937" height="516" alt="image" src="https://github.com/user-attachments/assets/665aa33a-6024-43ea-8211-17634b3d2281" />
<img width="937" height="516" alt="image" src="https://github.com/user-attachments/assets/016ee140-8d61-4fe5-8b1b-5f55da65ad2b" />

## Batting Average
|Phase| Bootstrap mean| 95% Confidence Interval|
|-----|---------------|------------------------|
|Early Career| 55.55936 | (31.40, 95.08 )|
|Late Career| 32.16575 | (21.81, 44.89 ) | 

Bootstrap difference in SR 
|2.5%   |  97.5% |
|-------|--------|
| -4.429825 | 63.921726 |

Batting average declined substantially.
Although the confidence intervals overlap slightly, the difference is larger than for strike rate and average runs, suggesting a stronger indication of reduced consistency. However, this evidence is still insufficient to conclude a statistically significant decline at the 95% confidence level.


The descriptive statistics consistently show lower performance in later part of his career.
Especially, when  it comes to batting average, strike rate, average runs.
However, descriptive statistics alone cannot determine whether these differences reflect genuine changes in performance or are simply due to random variation.

Bootstrap resampling addresses this by estimating the uncertainty associated with each statistic.
The bootstrap confidence intervals for the two phases overlap for all major batting metrics, and the confidence interval for the difference in mean runs includes zero. Consequently, there is insufficient statistical evidence to conclude that the player's batting performance changed significantly between the two phases.
This illustrates an important advantage of bootstrap methods: they quantify the uncertainty in observed statistics and prevent conclusions based solely on apparent differences in sample averages.

## Conclusion
The player's batting statistics suggest lower performance during the second phase of the career. Mean runs, strike rate, and batting average all decreased, and performance against both pace and spin bowling was weaker than in the first phase.

Nevertheless, bootstrap analysis indicates that these observed differences are not statistically significant at the 95% confidence level. The overlap in confidence intervals and the inclusion of zero in the confidence interval for the difference in mean runs suggest that the apparent decline may be attributable to natural variation rather than a true deterioration in batting ability.

The large bootstrap standard error and wide confidence interval indicate considerable variability in the estimated performance. Therefore, the observed difference between the phases should be interpreted cautiously.

Therefore, based on the available data, the bootstrap analysis does not provide sufficient evidence to conclude that the player's batting performance changed significantly between the two career phases.

## Limitations
 - The analysis is based on only 53 innings, resulting in relatively small phase-wise sample sizes.
 - Only batting statistics were considered.
 - Match conditions, opposition quality, venue, batting position, and match situation were not incorporated into the analysis.
 - The analysis compares two career phases but does not establish a causal reason for any observed differences.
