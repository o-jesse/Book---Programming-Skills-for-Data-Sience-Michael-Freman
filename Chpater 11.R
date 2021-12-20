library(dplyr)
install.packages("pscl")
library(pscl)
View(presidentialElections)

votes <- select(presidentialElections, year, demVote)
View(votes)

votes_baser <- presidentialElections[,c("year","demVote")]
View(votes_baser)

View(
  select(
    presidentialElections, state:year
  )
)

View(
  select(
    presidentialElections,
    -south
  )
)

votes_2008 <- filter(
  presidentialElections,
  year == 2008
)
View(votes_2008)

votes_2008_baser <- presidentialElections[presidentialElections$year == 2008,]
View(votes_2008_baser)

votes_colorado_2008 <- filter(
  presidentialElections,
  state == "Colorado",
  year == 2008
)
View(votes_colorado_2008)

#demVote = votes for Democrats

presidentialElections <- mutate(
  presidentialElections,
  other_parties_vote = 100 - demVote,
  abs_vote_diff = abs(demVote - other_parties_vote) #abs is not necessary. It could have been var1 - var2 only.
)

# testing below why used abs(). Using abs() was not actually necessary in the example. Commenting out everything to row 66
# other_parties_vote <- 100 - presidentialElections$demVote
# absence <- presidentialElections$demVote - other_parties_vote
# abs_book <- abs(presidentialElections$demVote - other_parties_vote)
# 
# votes_analysis <- matrix(
#   c(
#     presidentialElections$demVote,
#     other_parties_vote,
#     absence,
#     abs_book
#   ),
#   ncol = 4,
#   byrow = FALSE,
#   dimnames = list(NULL,c("demVote","other_parties_votes","absence","abs_book"))
# )
# 
# View(votes_analysis)

View(presidentialElections)

presidentialElections <- arrange(presidentialElections,-year,demVote)
View(presidentialElections)

average_votes <- summarise(
  presidentialElections,
  mean_demVote = mean(demVote),
  mean_other_parties = mean(other_parties_vote)
)
average_votes

furthest_from_50 <- function(vec) {
  adjusted_values <- vec - 50
  
  vec[adjusted_values == max(adjusted_values)]
}

furthest_from_50(presidentialElections[,2])

presidentialElections[
  presidentialElections$demVote > 98,
]

View(
  summarise(
    presidentialElections,
    biggest_landslide=furthest_from_50(demVote)
  )
)

votes_2008 <- filter(presidentialElections, year == 2008)
View(votes_2008)

most_dem_votes <- filter(votes_2008,demVote == max(demVote))
View(most_dem_votes)

most_dem_state <- select(most_dem_votes,state)
View(most_dem_state)


most_dem_state2 <- select(
  filter(
    filter(
      presidentialElections, year == 2008
    ),
    demVote == max(demVote)
  ),
  state
)
View(most_dem_state2)


most_dem_state_pipe <- presidentialElections %>% 
  filter(year == 2008) %>% 
  filter(demVote == max(demVote)) %>% 
  select(state)
View(most_dem_state_pipe)

View(presidentialElections)
View(arrange(presidentialElections, state))

grouped <- group_by(
  presidentialElections,
  state
)

state_voting_summary <- presidentialElections %>% 
  group_by(state) %>% 
  summarise(
    mean_dem_vote = mean(demVote),
    mean_other_parties = mean(other_parties_vote)
  )

View(state_voting_summary)



# 11.6 dplyr in Action: Analysing Flight Data

install.packages("nycflights13")
library(nycflights13)

dim(flights)
colnames(flights)
View(flights)

has_most_delays <- flights %>% 
  group_by(carrier) %>% 
  filter(dep_delay > 0) %>%
  summarise(num_delay = n()) %>% 
  filter(num_delay == max(num_delay)) %>% 
  select(carrier)
  


View(has_most_delays)  
  
most_delayed_name <- has_most_delays %>% 
  left_join(airlines, by = "carrier") %>% 
  select(name)

View(most_delayed_name)

#install.packages("writexl")
#library(writexl)


#write_xlsx(
#  summary_test_functionn,
#  "C:\\Users\\jesse\\Downloads\\functionn.xlsx"
#)

#write_xlsx(
#  flights,
#  "C:\\Users\\jesse\\Downloads\\flights.xlsx"
#)

most_delayed_name$name

most_early <- flights %>% 
  group_by(dest) %>% 
  summarise(delay = mean(arr_delay))

most_early

most_early_narm <- flights %>% 
  group_by(dest) %>% 
  summarise(delay = mean(arr_delay, na.rm = TRUE)) %>% 
  filter(delay == min(delay, na.rm = TRUE)) %>% 
  select(dest,delay) %>% 
  left_join(airports, by = c("dest" = "faa")) %>% 
  select(dest, name, delay)

most_early_narm

flights %>% 
  group_by(month) %>% 
  summarise(delay = mean(arr_delay, na.rm = TRUE)) %>% 
  filter(delay == max(delay)) %>% 
  select(month) %>% 
  print()

  
library(ggplot2)  

delay_by_month <- flights %>% 
  group_by(month) %>% 
  summarise(delay = mean(arr_delay,na.rm=TRUE)) %>% 
  mutate(month=month.name)

ggplot(data = delay_by_month) +
  geom_point(
    mapping = aes(x = delay, y = month),
    color = "blue",
    alpha = .4,
    size = 3
  ) +
  geom_vline(xintercept = 0, size = .25) +
  xlim(c(-20,20))+
  scale_y_discrete(limits = rev(month.name)) +
  labs(title = "Average Delay by Month", y= "", x = "delay (minutes)")
  
  
  