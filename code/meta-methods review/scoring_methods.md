IGT Scoring Methods
================
Annika Kuelpmann
2024-09-09

## Number of Scores

### Total Number of Scores

In our sample of 107 tasks, this is the total number of scores we
identified:

    ## [1] 806

### Number of Scores per Task

We analyzed how many scores were used per task; “number_of_scores”
represents the number of scores within a given task, “number_of_tasks”
reflects the total number of tasks that had that specific number of
scores.

    ## # A tibble: 20 × 2
    ##    number_of_scores number_of_tasks
    ##               <int>           <int>
    ##  1               49               1
    ##  2               30               2
    ##  3               28               1
    ##  4               22               3
    ##  5               20               1
    ##  6               17               1
    ##  7               16               1
    ##  8               15               2
    ##  9               14               2
    ## 10               13               3
    ## 11               12               4
    ## 12               11               1
    ## 13               10               4
    ## 14                8               5
    ## 15                7              11
    ## 16                6              25
    ## 17                5               9
    ## 18                3               2
    ## 19                2               7
    ## 20                1              22

### Summary of Number of Scores per Task

    ##    vars   n mean  sd median trimmed  mad min max range skew kurtosis   se
    ## X1    1 107 7.53 7.4      6    6.21 5.93   1  49    48 2.53     9.05 0.72

The total number and the percentage of tasks with a score range of 1 to
8 are as follows:

    ## [1] 81

    ## [1] 75.70093

## Distinct Scores

This section aims to present a descriptive overview of the distinct
scores identified in the sample.

### Number of Distinct Scores

This reflects the total number of distinct scores identified in our
sample, both prior to and following the collapsing of scores that were
initially identified as distinct but were also linear transformations of
one another. All of the following analyses are done with the collapsed
scores.

    ## [1] 281

    ## [1] 257

### Reusage of Distinct Scores

This illustrates the frequency with which scores were reused within the
sample. The variable “times_reused” reflects the number of instances in
which a score was reused within the sample, while “number_of_scores”
provides the total number of scores that were reused at that frequency.

    ## # A tibble: 12 × 2
    ##    times_reused number_of_scores
    ##           <int>            <int>
    ##  1           88                1
    ##  2           62                1
    ##  3           60                4
    ##  4           18                1
    ##  5           17                2
    ##  6           16                1
    ##  7            6                1
    ##  8            5                8
    ##  9            4                3
    ## 10            3               11
    ## 11            2               33
    ## 12            1              191

In order to simplify the overview, we have categorized the reuse of
scores according to the following criteria: A unique score is defined as
a score that has never been reused within the sample. A common score is
one that has been reused more than ten times. Finally, a rare score
corresponds to a score that has been reused up to nine times.

    ## # A tibble: 3 × 3
    ##   score_freq_category frequency percentage
    ##   <chr>                   <int>      <dbl>
    ## 1 common                    458       56.8
    ## 2 unique                    191       23.7
    ## 3 rare                      157       19.5

### Types of Scores

The following section presents a quantification of the scores,
categorized according to the types identified in the sample. “frequency”
reflects the number of distinct scores that have been categorized within
that particular group.

    ## # A tibble: 9 × 3
    ##   category                  frequency percentage
    ##   <chr>                         <int>      <dbl>
    ## 1 deck selections, single          93      36.2 
    ## 2 net score                        44      17.1 
    ## 3 indeterminable                   33      12.8 
    ## 4 deck selections, combined        30      11.7 
    ## 5 categorized score                23       8.95
    ## 6 model parameter                  16       6.23
    ## 7 choice behavior                  14       5.45
    ## 8 autocorrelation                   3       1.17
    ## 9 money                             1       0.39

A closer look at the tasks that used model parameters:

    ## # A tibble: 7 × 2
    ##   task_id scoring_approach
    ##     <int> <chr>           
    ## 1      12 VPP model       
    ## 2      13 EV model        
    ## 3      27 EV model        
    ## 4      32 EV model        
    ## 5      42 EV model        
    ## 6      45 EV model        
    ## 7     103 TDRL model

## Common Scores

This is an analysis of the most frequently used scores in our sample.
The 10 most prevalent scores were the net score across all trials
(1001), the net scores across five blocks of 20 trials (1002, 1003,
1004, 1005, 1006), and the deck selections across all trials for each of
the four decks A to D (1011, 1020, 1029, 1038). These scores were reused
more than ten times across the whole sample and thus are matching the
“common” category introduced above.

    ## # A tibble: 10 × 3
    ##    monotonic_score_id frequency percentage
    ##                 <dbl>     <int>      <dbl>
    ##  1               1001        88      10.9 
    ##  2               1006        62       7.69
    ##  3               1002        60       7.44
    ##  4               1003        60       7.44
    ##  5               1004        60       7.44
    ##  6               1005        60       7.44
    ##  7               1011        18       2.23
    ##  8               1020        17       2.11
    ##  9               1038        17       2.11
    ## 10               1029        16       1.99

The proportion of these 10 common scores within our sample is as
follows:

    ## [1] 56.82382

This is the number of tasks that would use at least one of the 10 common
scores, as well as the number of tasks that would use only common
scores:

    ## [1] 92

    ## [1] 45

### Tasks Using the Net Score

Here we present the number of tasks that employ the net score across all
trials, irrespective of the number of other scores provided.
Additionally, we present the number of tasks that solely provide the net
score without including other scores.

    ## [1] 75

    ## [1] 18

### Tasks Using the Learning Index

Here we present the number of tasks that employed net scores across five
blocks of 20 trials in conjunction with one another, thereby providing
the conventional learning index.Secondly, the number of tasks providing
only this learning index without utilising other scores is presented.

    ## [1] 56

    ## [1] 6

Here we present the number of tasks that employ both the net score
across all trials, and the learning index, irrespective of other scores.
Secondly, we present the number of tasks that provide only the net score
and learning index.

    ## [1] 41

    ## [1] 18

Here we present the number of tasks that used either the learning index
or the net score across all trials, or both.

    ## [1] 90

### Tasks Using Single Deck Selections

Here we present the number of tasks that employed the single deck
selections for decks A, B, C, and D across all trials in conjunction
with one another. Secondly, the number of tasks providing only these
four scores without utilizing other scores is presented.

    ## [1] 16

    ## [1] 0

## Unique Scores

Here we provide a descriptive analysis of the number of unique scores,
defined as those that were present only once in the sample.

    ## # A tibble: 1 × 2
    ##   times_reused number_of_scores
    ##          <int>            <int>
    ## 1            1              191

This is the proportion of unique scores within our sample:

    ## [1] 23.69727

The following table presents the number of unique scores per task:
“unique_scores” indicates the number of scores that are exclusive to a
given task, while “frequency” reflects the number of tasks in which that
number of unique scores has been obtained.

    ## # A tibble: 14 × 3
    ##    unique_scores frequency percentage
    ##            <int>     <int>      <dbl>
    ##  1             0        63      58.9 
    ##  2             1        21      19.6 
    ##  3             2         7       6.54
    ##  4             6         4       3.74
    ##  5             4         3       2.8 
    ##  6             3         1       0.93
    ##  7             5         1       0.93
    ##  8             7         1       0.93
    ##  9             8         1       0.93
    ## 10             9         1       0.93
    ## 11            10         1       0.93
    ## 12            16         1       0.93
    ## 13            22         1       0.93
    ## 14            40         1       0.93

The following table demonstrates the degree of overlap between tasks
that have been assigned unique, rare, or common scores.

    ## # A tibble: 7 × 4
    ##   has_common has_rare has_unique count
    ##   <lgl>      <lgl>    <lgl>      <int>
    ## 1 FALSE      FALSE    TRUE           9
    ## 2 FALSE      TRUE     FALSE          1
    ## 3 FALSE      TRUE     TRUE           5
    ## 4 TRUE       FALSE    FALSE         45
    ## 5 TRUE       FALSE    TRUE          18
    ## 6 TRUE       TRUE     FALSE         17
    ## 7 TRUE       TRUE     TRUE          12

### Indeterminable Scores

An indeterminable score is a score with elements that are not clearly
defined or that has not been adequately described. We have classified
indeterminable scores as a unique, given that it was not possible to
determine whether an indeterminable score was distinct or not. The total
number of indeterminable scores identified in our sample is as follows:

    ## [1] 33

Here we present the number of indeterminate scores per task.
“indeterminable_scores” represents the number of scores identified as
indeterminable within a given task, “frequency” reflects the number of
tasks with that specific number of indeterminable scores.

    ## # A tibble: 4 × 3
    ##   indeterminable_scores frequency percentage
    ##                   <int>     <int>      <dbl>
    ## 1                     0        85      79.4 
    ## 2                     1        15      14.0 
    ## 3                     2         6       5.61
    ## 4                     6         1       0.93
