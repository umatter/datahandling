#################################################
# Data Handling Lecture 9: PVS example
# Introduction to pvsR, show some examples from 
# PLOS One Article
#################################################


# PREAMBLE -----------

# load packages
library(pvsR)
library(tidyverse)

# load api key
pvs.key <- read_file("../../../../Projects/influence/keys/pvs.txt") # key UM


# BASIC EXAMPLES -----------

# data on officials
ob <- Officials.getByLastname(lastName = "Trump")
ob[, 1:6]


# highly granular data on official's background (local politics)
ca_senators <- Officials.getByOfficeState(stateId = "CA", officeId = 9)
sen_bio <- CandidateBio.getBio(candidateId = ca_senators$candidateId) # takes a while
summary(sen_bio$candidate.gender)




# LAWYERS IN POLITICS -------------------

bills <- Votes.getBillsByYearState(year = 2000, stateId = "NA")
# string matching of the term "Liability" in the title column
bills <- bills[grep("Liability", bills$title),]

# get details of the bill, extract data on bill actions separately
bill <- Votes.getBill(bills$billId, separate = "actions")

# get the actionId related to the passage of the bill
aId <- bill[["actions"]]$actionId[bill[["actions"]]$stage == "Passage"]
votes <- Votes.getBillActionVotes(actionId = aId)

# After removing absentees and delegates from the roll-call record, we obtain biographical data on all representatives participating in the votes:
bio <- CandidateBio.getBio(candidateId = votes$candidateId[1:10])

