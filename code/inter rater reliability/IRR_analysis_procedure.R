
# Preparations ------------------------------------------------------------

# load packages 

library(readxl)
library(dplyr)
library(irr)

# read data 

df_r1 <- readxl::read_xlsx("../../data/raw/metamethod review/codebook - rater 1/r1_procedure_aligned.xlsx")
df_r2 <- readxl::read_xlsx("../../data/raw/metamethod review/codebook - rater 2/r2_procedure_aligned.xlsx")

# combine files with correct column order

df_combined <- bind_cols(
  df_r1$article_id, df_r2$article_id,
  df_r1$authors, df_r2$authors,
  df_r1$year, df_r2$year,
  df_r1$order_number, df_r2$order_number,
  df_r1$sample_size, df_r2$sample_size,
  df_r1$variant, df_r2$variant,
  df_r1$protocol, df_r2$protocol,
  df_r1$goal, df_r2$goal,
  df_r1$instructions, df_r2$instructions,
  df_r1$feedback, df_r2$feedback,
  df_r1$incentives, df_r2$incentives,
  df_r1$currency, df_r2$currency,
  df_r1$starting_capital, df_r2$starting_capital,
  df_r1$reward_adv, df_r2$reward_adv,
  df_r1$reward_disadv, df_r2$reward_disadv,
  df_r1$gain1, df_r2$gain1,
  df_r1$gain2, df_r2$gain2,
  df_r1$loss1, df_r2$loss1,
  df_r1$loss2, df_r2$loss2,
  df_r1$gain_int1, df_r2$gain_int1,
  df_r1$gain_int2, df_r2$gain_int2,
  df_r1$loss_int1, df_r2$loss_int1,
  df_r1$loss_int2, df_r2$loss_int2,
  df_r1$freq_adv1, df_r2$freq_adv1,
  df_r1$freq_adv2, df_r2$freq_adv2,
  df_r1$freq_disadv1, df_r2$freq_disadv1,
  df_r1$freq_disadv2, df_r2$freq_disadv2,
  df_r1$n_blocks, df_r2$n_blocks,
  df_r1$n_trials, df_r2$n_trials,
  df_r1$notes_procedure, df_r2$notes_procedure,
  df_r1$rater_ID, df_r2$rater_ID
)


# Calculate Cohen's Kappa -------------------------------------------------

# Create an empty data frame to store Kappa values
kappa_results <- data.frame(Column1 = numeric(),
                               Column2 = numeric(),
                               Kappa = numeric(),
                               stringsAsFactors = FALSE)

# Loop through column pairs and calculate Cohen's Kappa
for (i in seq(1, 61, by = 2)) {
  kappa_result <- kappa2(df_combined[, c(i, i+1)])
  
  # Append results to the data frame
  kappa_results <- rbind(kappa_results, 
                            c(Column1 = i, Column2 = i+1, Kappa = kappa_result$value))
}

# add column containing column names
colnames <- colnames(df_r1)
kappa_results$col_name <- colnames

# rename column holding Kappa values
kappa_results <- kappa_results %>%
  rename(kappa = X1.1)

# delete unnecessary columns 
kappa_results <- kappa_results %>%
  dplyr::select(col_name, kappa)  

# delete unnecessary rows 
kappa_results <- kappa_results %>%
  filter(col_name != "article_id",
         col_name != "authors",
         col_name != "year",
         col_name != "order_number",
         col_name != "notes_procedure",
         col_name != "rater_ID")

