################################################################################ 
#                                                                              #
#!                             DATA PROCESSING                                  #
#                                                                              #
# This script takes the data as exported from FileMaker and turns it into      #
# something that can be used for other analyses                                #
#                                                                              #
# In short, it                                                                 #
#* - Corrects typos and recodes missing values                                 #
#  - Calculates lifespan                                                       #
#? - Adds father and mother IDs                                                #
#  - Calculates maternal and paternal age                                      #
#  - Calculates age at first and last reproduction                             #
#  - Calculates lifetime reproductive success based on all offspring and       #
#-   on married offspring                                                      ##                                                                              #
################################################################################

################
#+ Import data #
################

rm(list=ls())
wd <- "/Users/domiadmin/Documents/GLARUS_PROJECT/Exports/"
file <- "export_all_for_IDmom_IDdad_oldDB.txt"

setwd(wd)
data <- read.table(file, sep="\t", header=F, as.is=T, stringsAsFactors=F, quote="")

# data <- read.delim("~/Desktop/GLARUS/Raw data (export of 03 Oct 2016)/export_20161003.txt", 
# 	sep="\t", 
# 	header=F, 
# 	as.is=T, 
# 	stringsAsFactors=F
# 	)
# dim(data)
colnames(data) = c("IDp",
                   "sex", 
                   "IDc", 
                   "ckey_calc", 
                   "ckey_bis", 
                   "IDs", 
                   "skey_calc", 
                   "skey_bis", 
                   "byear", 
                   "bmonth_raw", 
                   "bmonth", 
                   "bday", 
                   "age",
                   "dyear", 
                   "dmonth_raw", 
                   "dmonth", 
                   "dday", 
                   "cregcode", 
                   "cnr", 
                   "sregcode", 
                   "snr", 
                   "cpg", 
                   "spg",
                   "crank", 
                   "crank_calc", 
                   "srank", 
                   "srank_calc", 
                   "wyear", 
                   "B1stCy", 
                   "blastCy", 
                   "ctot", 
                   "agemarr", 
                   "agefirst", 
                   "agelast", 
                   "single", 
                   "married", 
                   "diedyoung", 
                   "divorced", 
                   "occ.nr", 
                   "mistake", 
                   "maiden_name", 
                   "lastname", 
                   "dvyear", 
                   "birthCity", 
                   "deathCity", 
                   "weddingCity", 
                   "von_City", 
                   "und_City", 
                   "in_City",
                   "check_marriage_age",
                   "check_pat_age",
                   "check_mat_age")
	
dim(data)
pnum <- data$IDp
pnum <- substr(pnum, 1, 11)
data$pnum <- pnum
dim(data)

################################################
# Recode missing values and correct some typos #
################################################

table(data$sex, exclude=NULL)
data$sex[data$sex==""] <- NA

data$IDc[data$IDc==""] <- NA  # IDc = family ID as child
data$IDs[data$IDs==""] <- NA  # IDs = family ID as spouse

table(data$srank, exclude=NULL)
data$srank[data$srank==""]  <- NA
data$srank[data$srank=="?"] <- NA
data$srank <- as.numeric(data$srank)

table(data$crank, exclude=NULL)

table(data$cregcode, exclude=NULL)
data$cregcode[data$cregcode==' NP'] <- NA
data$cregcode[data$cregcode=='NP']  <- NA
data$cregcode[data$cregcode==''] <- NA
data$cregcode[data$cregcode=='GW14'] <- 'GL14'
data$cregcode[data$cregcode=="GL??"] <- NA

table(data$sregcode, exclude=NULL)
data$sregcode <- toupper(data$sregcode)
data$sregcode[data$sregcode == "GL??"] <- NA

table(data$married, exclude=NULL)
data$married[data$married=='\v'] <- NA

table(data$diedyoung, exclude=NULL)
data$diedyoung[data$diedyoung=='\v'] <- NA

table(data$single, exclude=NULL)
data$single[data$single=='\v'] <- NA

table(data$byear, exclude = NULL)

table(data$bmonth, exclude = NULL)
data$bmonth[data$bmonth == "1"] <- "01"
data$bmonth[data$bmonth == "2"] <- "02"
data$bmonth[data$bmonth == "3"] <- "03"
data$bmonth[data$bmonth == "4"] <- "04"
data$bmonth[data$bmonth == "5"] <- "05"
data$bmonth[data$bmonth == "6"] <- "06"
data$bmonth[data$bmonth == "7"] <- "07"
data$bmonth[data$bmonth == "8"] <- "08"
data$bmonth[data$bmonth == "9"] <- "09"
table(data$bmonth, exclude = NULL)

table(data$bmonth_raw[data$bmonth == "NA"], exclude = NULL) # Should match number of NAs above, otherwise additional information on birth months could be added to 'bmonth' column

table(data$bday, exclude = NULL)
data$bday[data$bday == ""] <- "15"  # Missing days are assigned the middle day of the month
data$bday[data$bday == "?"] <- "15"  # Missing days are assigned the middle day of the month
data$bday[data$bday == "1"] <- "01"
data$bday[data$bday == "2"] <- "02"
data$bday[data$bday == "3"] <- "03"
data$bday[data$bday == "4"] <- "04"
data$bday[data$bday == "5"] <- "05"
data$bday[data$bday == "6"] <- "06"
data$bday[data$bday == "7"] <- "07"
data$bday[data$bday == "8"] <- "08"
data$bday[data$bday == "9"] <- "09"
table(data$bday, exclude = NULL)
 
data$birthday <- as.Date(paste(data$byear, data$bmonth, data$bday, sep = "-")) 
 
table(data$dyear, exclude = NULL)

table(data$dmonth, exclude= NULL)
data$dmonth[data$dmonth == "1"] <- "01"
data$dmonth[data$dmonth == "2"] <- "02"
data$dmonth[data$dmonth == "3"] <- "03"
data$dmonth[data$dmonth == "4"] <- "04"
data$dmonth[data$dmonth == "5"] <- "05"
data$dmonth[data$dmonth == "6"] <- "06"
data$dmonth[data$dmonth == "7"] <- "07"
data$dmonth[data$dmonth == "8"] <- "08"
data$dmonth[data$dmonth == "9"] <- "09"
table(data$dmonth, exclude = NULL)

table(data$dmonth_raw[data$dmonth == "NA"], exclude = NULL)  # Should match number of NAs in previous table, otherwise dditional information on death months could be incorporated

table(data$dday, exclude = NULL)
data$dday[data$dday == "?"] <- "15"  # Missing days are assigned the middle day of the month
data$dday[data$dday ==""] <- "15"  # Missing days are assigned the middle day of the month
data$dday[data$dday == "14\v"] <- "14"  # Entry is actually supposed to be "14"
data$dday[data$dday == "1"] <- "01"
data$dday[data$dday == "2"] <- "02"
data$dday[data$dday == "3"] <- "03"
data$dday[data$dday == "4"] <- "04"
data$dday[data$dday == "5"] <- "05"
data$dday[data$dday == "6"] <- "06"
data$dday[data$dday == "7"] <- "07"
data$dday[data$dday == "8"] <- "08"
data$dday[data$dday == "9"] <- "09"
table(data$dday, exclude = NULL)

data$deathday <- as.Date(paste(data$dyear, data$dmonth, data$dday, sep = "-")) 



#######################
# Calculate lifespans #
#######################

data$lifespan <- as.numeric((data$deathday - data$birthday)/365.25)
data$lifespan[data$lifespan < 0] <- 0
#hist(data$lifespan, breaks = 0:105)

data$age.married <- data$wyear - data$byear
data$age.married[data$age.married < 10] <- NA
data$age.married[data$age.married > 110] <- NA
table(data$age.married)

#par(mfrow = c(2,2))
#hist(data$byear)
#hist(data$age.married)
#hist(data$wyear)
#hist(data$lifespan)

male.data <- subset(data, data$sex =="M")
female.data <- subset(data, data$sex =="F")

# Plotting distributions of age at marriage for women (top) and men (bottom)
#par(mfrow = c(2,1))
#x.axis <- c(10,80)
#hist(female.data$age.married, freq = FALSE, xlim = x.axis)
#hist(male.data$age.married, freq = FALSE, xlim = x.axis)

# Plotting distributions of lifespan in females (top) and males (bottom)
#par(mfrow = c(2,1))
#x.axis <- c(0,110)
#hist(female.data$lifespan, freq = FALSE, xlim = x.axis, breaks = c(0,1,2,5,10,15,20,40,60,80,100,110))
#hist(male.data$lifespan, freq = FALSE, xlim = x.axis, breaks = c(0,1,2,3,4,5,10,15,20,25,30,40,50,60,70,80,90,100,110))


##########################
#  Add father and mother #
##########################

# Get number of individuals with missing crank or srank
table(data$crank, data$sex, useNA='always') # Number of individuals with missing crank
table(data$srank, data$sex, useNA='always')  # Number of individuals with missing srank (spouse rank)
data$srank[data$sex=='M' & data$srank==2] <- 0  # Doesn't alter current data (3rd Oct 2016)
data$srank[data$sex=='F' & data$srank==0] <- NA   # Also doesn't alter current data (3rd Oct 2016)

# Look up ID of father for each individual
fathers <- data[data$sex=="M" & is.na(data$IDs)==F, c("IDp", "IDs")]
colnames(fathers)[1] <- "IDf"

data$IDf <- fathers$IDf[match(data$IDc, fathers$IDs)]

# Look up mother
mothers <- data[data$sex=="F" & is.na(data$IDs)==F, c("IDp", "IDs","srank")]
colnames(mothers)[1] <- "IDm"

# If crank is not NA, match IDc + crank with IDs + srank
data.1 <- data[is.na(data$crank)==F, ]
data.1$IDm <- mothers$IDm[match(paste(data.1$IDc, data.1$crank), paste(mothers$IDs, mothers$srank))]

# If crank is NA, only match cid and sid
data.2 <- data[is.na(data$crank)==T, ]
data.2$IDm <- mothers$IDm[match(data.2$IDc, mothers$IDs)]

data <- rbind(data.1, data.2)

subdata <- subset(data, select = c("IDp", "IDf", "IDm"))
write.table(subdata, "R_output_with_IDmom_IDdad.txt", sep="\t", col.names=T, row.names=F, quote=F) ### by import into DB merge "IDp" of txt with "pe_ID_PK" of DB


#################################
# Count number of times married #
#################################

# Men
n.married <- aggregate(data$srank[is.na(data$srank)==F & is.na(data$sex)==F & data$sex=="F"], by=list(data$IDs[is.na(data$srank)==F & is.na(data$sex)==F & data$sex=="F"]), FUN=max) # maximum srank value from among women with non-NA value for srank
colnames(n.married) <- c("IDs", "n.married")
data <- merge(data, n.married, by="IDs", all.x=T, all.y=F)
data$n.married[data$sex=='F' & is.na(data$sex)==F] <- NA

# Women
data$n.married[data$sex=='F' & is.na(data$sex)==F] <- ifelse(nchar(data$IDp[data$sex=='F' & is.na(data$sex)==F])>11, 2, 1)

data.female <- data[data$sex == "F",]
pnum.counts <- as.data.frame(table(data$pnum[data$sex == "F"]))
colnames(pnum.counts) <- c("pnum", "pnum.count")

data$n.married[data$sex=="F" & is.na(data$sex==F)] <- pnum.counts$pnum.count[match(data$pnum, pnum.counts$pnum)]

n.married <- aggregate(data$pnum[data$sex=="F"], by=list(data$pnum[is.na(data$srank)==F & is.na(data$sex)==F & data$sex=="F"]), FUN=length)

table(data$n.married)
table(data$n.married[data$sex=="M"])
table(data$n.married[data$sex=="F"])

###################################
# Calculate parental age at birth #
###################################

birthdays <- subset(data, select = c("IDp", "birthday"))

birthdays.mother <- birthdays
colnames(birthdays.mother) <- c("IDp", "birthday.mother")
data <- merge(data, birthdays.mother, by.x = "IDm", by.y = "IDp", all.x = TRUE, all.y = FALSE)

birthdays.father <- birthdays
colnames(birthdays.father) <- c("IDp", "birthday.father")
data <- merge(data, birthdays.father, by.x = "IDf", by.y = "IDp", all.x = TRUE, all.y = FALSE)

data$age.father <- data$birthday-data$birthday.father
data$age.father <- as.numeric(data$age.father)
data$age.father <- data$age.father/365.25  # convert age measured in days into age measured in years
#data[is.na(data$age.father)==F & data$age.father<20,]
#data[is.na(data$age.father)==F & data$age.father>80,]
data$age.father[is.na(data$age.father)==F & (data$age.father<12 | data$age.father>100)] <- NA

data$age.mother <- data$birthday-data$birthday.mother
data$age.mother <- as.numeric(data$age.mother)
data$age.mother <- data$age.mother/365.25  # convert age measured in days into age measured in years
max(data$age.mother, na.rm = T)
min(data$age.mother, na.rm = T)

#par(mfrow = c(2,1))
#hist(data$age.mother)
#hist(data$age.father)

######################################################
# Calculate AFR and ALR - USING PNUM RATHER THAN IDp #
######################################################

fathers <- subset(data, select=c("IDf", "age.father"))
afr.fathers <- aggregate(fathers$age.father, by=list(fathers$IDf), FUN=min) # Only if parental age for all children is known
alr.fathers <- aggregate(fathers$age.father, by=list(fathers$IDf), FUN=max)

fathers <- cbind(afr.fathers, alr.fathers[,2])  
colnames(fathers) <- c("pnum", "afr", "alr")

mothers <- subset(data, select=c("IDm", "age.mother", "IDf"))
mothers$IDm <- substr(mothers$IDm, 1, 11) # Convert IDp identifiers to pnumbers (each individual is unique)
afr.mothers <- aggregate(mothers$age.mother, by=list(mothers$IDm), FUN=min)
alr.mothers <- aggregate(mothers$age.mother, by=list(mothers$IDm), FUN=max)
mothers <- cbind(afr.mothers, alr.mothers[,2])
colnames(mothers) <- c("pnum", "afr", "alr")

timing <- rbind(mothers, fathers) # ALR and AFR data for males AND females

data <- merge(data, timing, by="pnum", all.x=T, all.y=F)
data$alr[is.na(data$lifespan)==TRUE] <- NA  # Only use alr for individuals with known lifespan 

#par(mfrow=c(1,2)) 
#hist(data$afr[data$sex=="F" & is.na(data$afr)==FALSE & is.na(data$alr)==FALSE], breaks=seq(5,70,5), xlab='age at first reproduction', main="")
#hist(data$alr[data$sex=="F" & is.na(data$afr)==FALSE & is.na(data$alr)==FALSE], breaks=seq(5,70,5), xlab='age at last reproduction', main="")


##################################
# CALCULATING MOTHER'S AFR & ALR #
##################################

mother_timing <- mothers
colnames(mother_timing) <- c("maternal.pnum", "mother_afr", "mother_alr")
maternal.pnum <- data$IDm
maternal.pnum <- substr(maternal.pnum, 1, 11)
data$maternal.pnum <- maternal.pnum
data <- merge(data, mother_timing, by = "maternal.pnum", all.x = TRUE, all.y = FALSE)
data$mother_alr[is.na(data$mother_alr)==TRUE] <- NA  # mother_alr only given when mother's lifespan is known


##################################
# Calculating father's AFR & ALR #
##################################

father_timing <- fathers
colnames(father_timing) <- c("IDf", "father_afr", "father_alr")
data <- merge(data, father_timing, by = "IDf", all.x = TRUE, all.y = FALSE)
data$father_alr[is.na(data$father_alr)==TRUE] <- NA  # father_alr only given when father's lifespan is known


##############################################################
# Calculate completed family size (total number of children) #
##############################################################

fathers <- data[is.na(data$IDf)==F, c("IDf", "age.father")]
CFS.fathers <- aggregate(fathers$IDf, by=list(fathers$IDf), FUN=length)
colnames(CFS.fathers) <- c("pnum", "CFS")

mothers <- data[is.na(data$IDm)==F, c("IDm", "age.mother")]
mothers$IDm <- substr(mothers$IDm, 1, 11)
CFS.mothers <- aggregate(mothers$IDm, by=list(mothers$IDm), FUN=length)
colnames(CFS.mothers) <- c("pnum", "CFS")

CFS <- rbind(CFS.fathers, CFS.mothers)
data <- merge(data, CFS, by="pnum", all.x=T, all.y=F)

data$CFS[is.na(data$afr)==T | is.na(data$alr)==T] <- NA

#par(mfrow=c(1,1)) 
#hist(data$CFS)

#par(mfrow=c(1,2)) 
#plot(data$afr, data$CFS)
#plot(data$alr, data$CFS)



################################################################
# Calculate LRS based on number of children reaching age of 15 #
# (following, e.g., Pettay et al. 2005 PNAS)                   #
################################################################

data$surv <- NA  # Sets all entries to be NA
data$surv[is.na(data$diedyoung)==F] <- 0 
data$surv[is.na(data$married)==F] <- 1
data$surv[is.na(data$single)==F] <- 1
data$surv[is.na(data$lifespan)==F & data$lifespan>=15] <- 1
data$surv[is.na(data$lifespan)==F & data$lifespan<15] <- 0

lrs.fathers.surv <- aggregate(data$surv, by=list(data$IDf), sum)
colnames(lrs.fathers.surv) <- c("pnum", "LRS")
dim(lrs.fathers.surv)[1] 

lrs.mothers.surv <- aggregate(data$surv, by=list(data$IDm), sum)
colnames(lrs.mothers.surv) <- c("pnum", "LRS")
dim(lrs.mothers.surv)[1] 

lrs.surv <- rbind(lrs.fathers.surv, lrs.mothers.surv)  # Combine men and women
dim(lrs.surv)[1]

data <- merge(data, lrs.surv, by="pnum", all.x=T, all.y=F)  # Add LRS column

#par(mfrow=c(1,1)) 
#plot(data$lrs, data$LRS)

#plot(data$afr, data$LRS)


##################################
# Calculate decadal birth cohort #
##################################

data$decadal.cohort <- round(data$byear/10)*10 # Create decadal cohorts


####################################
# CALCULATE SPOUSE FOR FIRST BIRTH #
####################################


male.spouses <- data[is.na(data$maternal.pnum)==F, c("maternal.pnum", "age.mother", "birthday", "IDf")]
spouse <- male.spouses[order(male.spouses$maternal.pnum, male.spouses$birthday), ]  # Order individuals by their age (eldest first) within maternal identity
spouse <- spouse[!duplicated(spouse$maternal.pnum), ]  # Remove all listings except earliest child of each mother
father.of.firstborn <- spouse[, c("maternal.pnum", "IDf")]  # Isolate women and the father of their first child
colnames(father.of.firstborn) <- c("pnum", "coparent.of.firstborn")
dim(father.of.firstborn)[1]
length(unique(father.of.firstborn$pnum))  # Should match above if no mothers are listed more than once


female.spouses <- data[is.na(data$IDf)==F, c("IDf", "birthday", "maternal.pnum")]  # Isolate fathers
mans.spouse <- female.spouses[order(female.spouses$IDf, female.spouses$birthday), ]  # Order individuals by their age (eldest first) within paternal identity
mans.spouse <- mans.spouse[!duplicated(mans.spouse$IDf), ]  # Remove all listings except first child of each father
mother.of.firstborn <- mans.spouse[, c("IDf", "maternal.pnum")] # Isolate man and the mother of their first child
colnames(mother.of.firstborn) <- c("pnum", "coparent.of.firstborn")
dim(mother.of.firstborn)[1]
length(unique(mother.of.firstborn$pnum))  # Should match above if no fathers are listed more than once

coparent.lookup <- rbind(father.of.firstborn, mother.of.firstborn)
length(coparent.lookup$pnum)
length(unique(coparent.lookup$pnum))  # check entries are unique
 
 
data <- merge(data, coparent.lookup, by = "pnum", all.x=T, all.y = F)  # Add list to main data as new column 

########################################
########################################
## EXPORTING INDIVIDUAL-LEVEL DATASET ##
########################################
########################################

##############################################################
# Create single record for each woman married multiple times #
##############################################################

pnum.counts <- as.data.frame(table(data$pnum))
colnames(pnum.counts) <- c("pnum", "pnum.count")

data <- merge(x=data, y=pnum.counts, by="pnum", all.x=T, all.y=F)   # Create new column indexing frequency of every individual in the exported dataset
sum(is.na(data$pnum.count))  # Check that all individuals have been indexed
 
multi.data <- data[data$pnum.count>1,]  # Subset individuals with multiple records
table(multi.data$sex, exclude=NULL)  # Check all multiply-represented individuals are women

data <- data[data$pnum.count == "1",]



# LIMIT TO INDIVIDUALS ASSOCIATED WITH ELM (GL03) OR LINTHAL (GL09)
ElmLinthal.data <- data[data$cregcode == "GL03" | data$cregcode == "GL09" | data$sregcode == "GL03" | data$sregcode == "GL09",]

# EXPORTING DATASET

write.csv(ElmLinthal.data, "~/Desktop/GLARUS/Individual-level ElmLinthal dataset (03 Oct 2016 export; coparent of firstborn listed).csv", quote=F, row.names=T)



#######################
#######################
##                   ##
## CREATING PEDIGREE ##
##                   ##
#######################
#######################

data <- read.csv("~/Desktop/GLARUS/Individual-level ElmLinthal dataset (03 Oct 2016 export).csv", header = T)

library(pedantics)  # Required to fix and sort pedigree

# Sorting out repeat representation of females
mother.pnum <- data$IDm
mother.pnum <- substr(mother.pnum, 1, 11)
data$mother.pnum <- mother.pnum

pedigree.data <- subset(data, select=c("pnum", "mother.pnum", "IDf", "sex", "byear"))
colnames(pedigree.data) <- c("id", "dam", "sire", "sex", "cohort")

ped <- subset(pedigree.data, select = c("id", "dam", "sire"))
more.data <- subset(pedigree.data, select = c("id", "sex", "cohort"))

fix.ped <- fixPedigree(ped, dat=more.data)
ped <- fix.ped[,c(1:3)]

write.csv(x = ped, file = "~/Desktop/GLARUS/ped_09Nov2016.csv", quote=F, row.names=T)