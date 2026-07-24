## Project Overview

This study evaluates the batting performance of a N.Tilak Varma in T20 Internationals by comparing two phases (Phase 1: Upto Asia Cup 2025, Phase 2: Post Asia Cup 2025 i.e., from Oct 31st 2025) of the player's career using bootstrap resampling techniques. 
Traditional descriptive statistics such as batting average, strike rate, and mean runs per innings were computed separately for both phases.
A non-parametric bootstrap with 10,000 resamples was then applied to estimate confidence intervals for these performance measures and their differences. The study also examined performance against pace and spin bowling.
While descriptive statistics indicate a decline in performance during the second phase, the bootstrap confidence intervals suggest that the observed differences are not statistically significant at the 95% confidence level.

## Data Description

There are two types of data 
- One consists innings level data
  - Match No
  - Runs scored
  - Balls taken to score 
  - Outs and Avg
  - 4s and 6s scored
  - Dot ball percent
  - Career Phase either Before or After
- Another have the performanace against different bowling type either Spin / Pace in different parts of his career

## Descriptive Analysis
Overall Career
|Bowling Type| Strike Rate | Batting Average |
|------------|-------------|-----------------|
|Overall     |	143.9	     |  43.6           |
|Spin        |	125.5      |	41.23          |
|Pace        |	155.7      |	44.86          |

The player maintained an aggressive scoring rate throughout the career, particularly against pace bowling.

Phase-wise Analysis
Overall Performance
Metric	Phase 1	Phase 2
Innings	30	23
Outs	18	18
Strike Rate	149.1	136.2
Batting Average	53.4	33.7
Interpretation

Compared with Phase 1,

Strike rate decreased by approximately 9%.
Batting average decreased by approximately 37%.

These descriptive statistics suggest reduced batting performance during Phase 2.

Performance Against Spin
Metric	Phase 1	Phase 2
Strike Rate	140	111.7
Batting Average	44.38	31.6
Interpretation

The player became less effective against spin.

Strike rate reduced considerably.
Batting average also declined.

This indicates slower scoring and more frequent dismissals against spin bowling.

Performance Against Pace
Metric	Phase 1	Phase 2
Strike Rate	159.7	150.18
Batting Average	60.7	32.7
Interpretation

Against pace,

Strike rate remained relatively high.
Batting average declined sharply.

The player continued scoring aggressively but lost wickets more frequently.
