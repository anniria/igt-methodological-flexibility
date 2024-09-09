Analyses of IGT Procedures
================
Annika Kuelpmann
2024-09-09

## IGT Variants

This section provides an overview of the IGT variants employed in the
sample.

    ## # A tibble: 17 × 3
    ##    protocol                                       n percentage
    ##    <chr>                                      <int>      <dbl>
    ##  1 indeterminable                                82      77.4 
    ##  2 original task                                  4       3.77
    ##  3 new variant                                    3       2.83
    ##  4 Bechara, Tranel & Damasio, 2000 (E'F'G'H')     2       1.89
    ##  5 Mueller, 2012                                  2       1.89
    ##  6 clinical variant                               2       1.89
    ##  7 Bechara, Damasio & Damasio 2000 (ABCD)         1       0.94
    ##  8 Bechara, Damasio, & Damasio, 2000              1       0.94
    ##  9 Becker, 2014                                   1       0.94
    ## 10 Cauffman, 2010                                 1       0.94
    ## 11 Christakou, 2009                               1       0.94
    ## 12 Crone, 2004                                    1       0.94
    ## 13 Mintzer & Stitzer, 2002                        1       0.94
    ## 14 Overman, 2004                                  1       0.94
    ## 15 Quednow, 2007                                  1       0.94
    ## 16 Windmann, 2006                                 1       0.94
    ## 17 van den Bos, 2006                              1       0.94

In order to organise the variants in a systematic manner, they have been
aggregated into the following categories:

    ## # A tibble: 5 × 3
    ##   protocol_aggr           n percentage
    ##   <chr>               <int>      <dbl>
    ## 1 indeterminable         82      77.4 
    ## 2 other cited variant    15      14.2 
    ## 3 original task           4       3.77
    ## 4 new variant             3       2.83
    ## 5 clinical variant        2       1.89

## Modifications

We conducted a descriptive analysis of the modifications that were made
to the IGT with respect to different variables.

### Number of Trials

The frequency of alterations to the number of trials was examined. The
variable “n” refers to the number of tasks with the corresponding number
of trials, represented as “n_trials”.

    ## # A tibble: 10 × 3
    ##    n_trials           n percentage
    ##    <chr>          <int>      <dbl>
    ##  1 100               89      84.0 
    ##  2 indeterminable     8       7.55
    ##  3 60                 2       1.89
    ##  4 120                1       0.94
    ##  5 135                1       0.94
    ##  6 150                1       0.94
    ##  7 200                1       0.94
    ##  8 400                1       0.94
    ##  9 50                 1       0.94
    ## 10 80                 1       0.94

    ## # A tibble: 3 × 3
    ##   trials_aggr        n percentage
    ##   <chr>          <int>      <dbl>
    ## 1 100               89      84.0 
    ## 2 deviating          9       8.49
    ## 3 indeterminable     8       7.55

    ## # A tibble: 1 × 3
    ##   min_trials max_trials valid_observations
    ##        <dbl>      <dbl>              <int>
    ## 1         50        400                 98

### Instructions and Feedback

A descriptive analysis was conducted to determine whether the
instructions, the primary goal of the task which can be considered a
part of the instruction, and the feedback provided to the participants
were consistent with the original task or modified. Additionally, we
aimed to quantify the number of instances where these elements could not
be determined (value “indeterminable”). The variable “n” represents the
number of tasks for which this is the case.

    ## # A tibble: 3 × 3
    ##   goal                             n percentage
    ##   <chr>                        <int>      <dbl>
    ## 1 standard goal                   68      64.2 
    ## 2 indeterminable                  37      34.9 
    ## 3 deviating from standard goal     1       0.94

    ## # A tibble: 3 × 3
    ##   instructions                             n percentage
    ##   <chr>                                <int>      <dbl>
    ## 1 indeterminable                          77       72.6
    ## 2 deviating from standard instructions    15       14.2
    ## 3 standard instructions                   14       13.2

    ## # A tibble: 3 × 3
    ##   feedback                             n percentage
    ##   <chr>                            <int>      <dbl>
    ## 1 indeterminable                      74       69.8
    ## 2 deviating from standard feedback    21       19.8
    ## 3 standard feedback                   11       10.4

Here, the variables of goal, instructions, and feedback were combined
into a single variable, named “characteristics”.

    ## # A tibble: 4 × 3
    ##   characteristics                               n percentage
    ##   <chr>                                     <int>      <dbl>
    ## 1 indeterminable characteristics               42      39.6 
    ## 2 partly deviating characteristics             28      26.4 
    ## 3 completely indeterminable characteristics    27      25.5 
    ## 4 standard characteristics                      9       8.49

### Loans and Currencies

Here, we present the currencies and capitals that were employed in our
sample.

    ## # A tibble: 11 × 3
    ##    currency             n percentage
    ##    <chr>            <int>      <dbl>
    ##  1 dollars             41      38.7 
    ##  2 indeterminable      39      36.8 
    ##  3 euros               10       9.43
    ##  4 pounds               5       4.72
    ##  5 points               3       2.83
    ##  6 yen                  3       2.83
    ##  7 (Tunisian) dinar     1       0.94
    ##  8 Brazilian real       1       0.94
    ##  9 Turkish liras        1       0.94
    ## 10 apples               1       0.94
    ## 11 yuan                 1       0.94

    ## # A tibble: 6 × 3
    ##   starting_capital     n percentage
    ##   <chr>            <int>      <dbl>
    ## 1 indeterminable      62      58.5 
    ## 2 2000                39      36.8 
    ## 3 200                  2       1.89
    ## 4 1000                 1       0.94
    ## 5 20                   1       0.94
    ## 6 200000               1       0.94

    ## # A tibble: 19 × 4
    ##    starting_capital currency             n percentage
    ##    <chr>            <chr>            <int>      <dbl>
    ##  1 200              (Tunisian) dinar     1       0.94
    ##  2 indeterminable   Brazilian real       1       0.94
    ##  3 2000             Turkish liras        1       0.94
    ##  4 indeterminable   apples               1       0.94
    ##  5 20               dollars              1       0.94
    ##  6 200              dollars              1       0.94
    ##  7 2000             dollars             24      22.6 
    ##  8 indeterminable   dollars             15      14.2 
    ##  9 2000             euros                8       7.55
    ## 10 indeterminable   euros                2       1.89
    ## 11 indeterminable   indeterminable      39      36.8 
    ## 12 1000             points               1       0.94
    ## 13 indeterminable   points               2       1.89
    ## 14 2000             pounds               4       3.77
    ## 15 indeterminable   pounds               1       0.94
    ## 16 2000             yen                  1       0.94
    ## 17 200000           yen                  1       0.94
    ## 18 indeterminable   yen                  1       0.94
    ## 19 2000             yuan                 1       0.94

### Gain Loss Schedules

A number of variables were examined which reflect the gain-loss schedule
of the tasks in use, including the fixed gains and losses for each deck
and the frequencies of gains and losses for a given interval of trials.
These variables were then aggregated to create a new variable which
indicates whether the gain-loss schedule is similar to that of the
original task, or whether it is deviating from it, and/or whether it
contains elements which are indeterminable.

    ## # A tibble: 4 × 3
    ##   schedule                               n percentage
    ##   <chr>                              <int>      <dbl>
    ## 1 completely indeterminable schedule    58       54.7
    ## 2 standard schedule                     17       16.0
    ## 3 deviating schedule                    16       15.1
    ## 4 partly indeterminable schedule        15       14.2

### Incentives

Here, we sought to determine whether the incentives provided to
participants were contingent upon their performance in the task or not.

    ## # A tibble: 4 × 3
    ##   incentives                                     n percentage
    ##   <chr>                                      <int>      <dbl>
    ## 1 indeterminable                                50      47.2 
    ## 2 incentives independent on task performance    33      31.1 
    ## 3 incentives dependent on task performance      20      18.9 
    ## 4 no incentives                                  3       2.83

## Lack of Reporting

One of the objectives of this study was to ascertain the degree of
transparency in the reporting of IGT procedures.

### Summary of Indeterminables

In order to achieve this, we demonstrate, for each variable, the
frequency of instances where an indeterminable value was assigned. The
variable “count” represents the number of tasks for which this occurred.

    ##            Variable count percentage
    ## 1     protocol_aggr    82      77.36
    ## 2      instructions    77      72.64
    ## 3          feedback    74      69.81
    ## 4         freq_adv1    69      65.09
    ## 5      freq_disadv1    68      64.15
    ## 6         freq_adv2    67      63.21
    ## 7      freq_disadv2    67      63.21
    ## 8        reward_adv    65      61.32
    ## 9             gain1    65      61.32
    ## 10            loss1    65      61.32
    ## 11        gain_int1    65      61.32
    ## 12        loss_int1    65      61.32
    ## 13        gain_int2    65      61.32
    ## 14        loss_int2    65      61.32
    ## 15    reward_disadv    64      60.38
    ## 16            gain2    64      60.38
    ## 17            loss2    64      60.38
    ## 18 starting_capital    62      58.49
    ## 19         currency    39      36.79
    ## 20             goal    37      34.91
    ## 21      trials_aggr     8       7.55
