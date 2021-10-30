name <- c("Ada",
          "Bob",
          "Chris",
          "Diya",
          "Emma"
          )

height <- c(64,74,69,69,71)

weight <- c(135,156,139,144,152)

people <- data.frame(
  name,
  height,
  weight,
  stringsAsFactors = FALSE
)

people

people2 <- data.frame(
  name2 = c("Ada", "Bob", "Chris", "Diya", "Emma"),
  height2 = c(64,74,69,69,71),
  weight2 = c(135,156,139,144,152)
)

people2

nrow(people2)
ncol(people)
dim(people)
colnames(people)
rownames(people)

new_col_names <- c("first_name","how_tall","how_heavy")

colnames(people2) <- new_col_names

people2

people2[2,3]

rownames(people) <- people$name
rownames(people)

people["Ada",]

people[,"height"]

people["height"]

people[,c("height","weight")]

people[2:4,]

people[people$height > 70,]

is.list(people)

shirt_size <- as.factor (c(
  "small",
  "medium",
  "small",
  "large",
  "medium",
  "large"
))

cost <- c(15.5,17,17,14,12,23)

shirts_factor <- data.frame(shirt_size,cost)

is.factor(shirts_factor$shirt_size)

shirts_factor[1,1] <- "extra-large"

shirt_size2 <- c(
  "small",
  "medium",
  "small",
  "large",
  "medium",
  "large"
)

shirts <- data.frame(shirt_size2,cost,stringsAsFactors = FALSE)

is.factor(shirts$shirt_size2)



shirts_factor <- data.frame(shirt_size,cost)
shirts_factor

shirt_size_frames <- split(shirts_factor,shirts_factor$shirt_size)
shirt_size_frames

tapply(shirts_factor$cost, shirts_factor$shirt_size, mean)












