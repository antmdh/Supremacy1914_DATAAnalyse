##### ANALYSE DES PARTIES SUPREMACY 1914
##### CARTES 31 JOUEURS 
##### Langues FR


rm(list=ls()) 
gc()


# INdiquer la configuration
#PC_BUREAU
#MAC_MAISON
config <-"MAC_MAISON"

############ 14/10/2022
# CODE VIDEO 100 CARTES TAILLE 31
#avec R studio (machine windows I7)
###########
## TO DO 
#Le fichier production militaire n'est pas bon avec SUD comme pays' le proble vient que % et nom c'est la richesse et % et pays c'est la puissance militaire. Je dois pas filter sur base uniquement du mot %
# les cartes GOOGLE drives n'indique pas le nom du pays dans "DF_Liste_joueurs_pays". Mais bon c'est pas super grave
# retelecharger la carte https://www.supremacy1914.fr/game.php?L=11&bust=1#/game/:gameID=5831550
# IL y a des noms de joueurs qui n'apparaissent pas dans la liste des joueurs tel que Clozel
# Dans liste des joueurs, il y a un pays qui est centre au lieu d'état centraux d'amerique (voir joueur user27296893 )

## 1. LIBRAIRIES ET MODULES  -----
#install.packages("data.tables")
library(data.table)
#install.packages("dplyr")
library(dplyr)
#install.packages((tidyr))
#install.packages("ggpubr")
library(ggpubr)
#install.packages("ggplot2")
library(ggplot2)
# The easiest way to get tidyr is to install the whole tidyverse:
#install.packages("tidyverse")
library(tidyverse)

# Alternatively, install just tidyr:
#install.packages("tidyr")
library(tidyverse)
#install.packages("readxl")
library("readxl")


## 2. CONSTRUCTION DU FICHIER DATA BASE -----
### 2.1 Creation d'un fichier vide ----

if(config == "MAC_MAISON"){
  path <- "/Users/holly/Documents/SOURCE/"
}else{path <- "C:/PROJET_100_CARTE_LOCAL/SOURCE/"}



file<- "SCRAP_CARTES/5827679_0_33.csv"
dbtemp<- read.csv(paste0(path,file ),header = TRUE, sep=",",encoding = "UTF-8", colClasses=c( 'character'))

DATABASE_A <- dbtemp
rm(file)
### 2.2 Importation des CSV  (INPUT POSSSIBLE) -----
#Pour copier le nom du chemin,aller sur acceuil dans l'explorateur windoows et copier chemin fichier 
#voir egalement ici https://definir-tech.com/info/28819/comment-copier-les-noms-de-fichiers-d-un-repertoire#:~:text=Aller%20%C3%A0%20le%20dossier%20dans,cliquez%20sur%20Copier%20le%20chemin.
#Ensuite rajouter virgule à la main
# pc boulot 
#Et changer automatiquement \ en /



listecartesintegrer <- c(paste0(path,'SCRAP_CARTES/','826524_84_36.csv'),
                         paste0(path,'SCRAP_CARTES/','5822991_0_71.csv'),
                         paste0(path,'SCRAP_CARTES/','5822991_55_21.csv'),
                         paste0(path,'SCRAP_CARTES/','5823131_0_31.csv'),
                         paste0(path,'SCRAP_CARTES/','5823131_55_21.csv'),
                         paste0(path,'SCRAP_CARTES/','5823261_0_31.csv'),
                         paste0(path,'SCRAP_CARTES/','5823261_1_84.csv'),
                         paste0(path,'SCRAP_CARTES/','5823432_0_31.csv'),
                         paste0(path,'SCRAP_CARTES/','5823432_0_50.csv.csv'),
                         paste0(path,'SCRAP_CARTES/','5823432_23_57.csv'),
                         paste0(path,'SCRAP_CARTES/','5823432_33_72.csv'),
                         paste0(path,'SCRAP_CARTES/','5823432_82_43.csv'),
                         paste0(path,'SCRAP_CARTES/','5823552_0_31.csv'),
                         paste0(path,'SCRAP_CARTES/','5823682_0_31.csv'),
                         paste0(path,'SCRAP_CARTES/','5823756_0_31.csv'),
                         paste0(path,'SCRAP_CARTES/','5823756_1_84.csv'),
                         paste0(path,'SCRAP_CARTES/','5823756_23_57.csv'),
                         paste0(path,'SCRAP_CARTES/','5823756_49_84.csv'),
                         paste0(path,'SCRAP_CARTES/','5823886_0_31.csv'),
                         paste0(path,'SCRAP_CARTES/','5823886_0_72.csv'),
                         paste0(path,'SCRAP_CARTES/','5823886_33_72.csv'),
                         paste0(path,'SCRAP_CARTES/','5823886_68_83.csv'),
                         paste0(path,'SCRAP_CARTES/','5823962_0_31.csv'),
                         paste0(path,'SCRAP_CARTES/','5824044_0_31.csv'),
                         paste0(path,'SCRAP_CARTES/','5824044_1_84.csv'),
                         paste0(path,'SCRAP_CARTES/','5824395_0_31.csv'),
                         paste0(path,'SCRAP_CARTES/','5824531_0_32.csv'),
                         paste0(path,'SCRAP_CARTES/','5824531_18_57.csv'),
                         paste0(path,'SCRAP_CARTES/','5824531_49_84.csv'),
                         paste0(path,'SCRAP_CARTES/','5824672_0_32.csv'),
                         paste0(path,'SCRAP_CARTES/','5824846_0_32.csv'),
                         paste0(path,'SCRAP_CARTES/','5825762_0_32.csv'),
                         paste0(path,'SCRAP_CARTES/','5826127_0_32.csv'),
                         paste0(path,'SCRAP_CARTES/','5826354_0_32.csv'),
                         paste0(path,'SCRAP_CARTES/','5826354_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5826354_0_36.csv'),
                         paste0(path,'SCRAP_CARTES/','5826524_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5826524_18_57.csv'),
                         paste0(path,'SCRAP_CARTES/','5826688_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5826848_0_36.csv'),
                         paste0(path,'SCRAP_CARTES/','5826848_20_57.csv'),
                         paste0(path,'SCRAP_CARTES/','5826848_20_58.csv'),
                         paste0(path,'SCRAP_CARTES/','5826848_32_71.csv'),
                         paste0(path,'SCRAP_CARTES/','5826848_64_83.csv'),
                         paste0(path,'SCRAP_CARTES/','5827100_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5827205_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5827431_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5827431_35_84.csv'),
                         paste0(path,'SCRAP_CARTES/','5827679_0_32.csv'),
                         paste0(path,'SCRAP_CARTES/','5827679_0_33.csv'),
                         paste0(path,'SCRAP_CARTES/','5827679_18_57.csv'),
                         paste0(path,'SCRAP_CARTES/','5827679_32_72.csv'),
                         paste0(path,'SCRAP_CARTES/','5827679_68_84.csv'),
                         paste0(path,'SCRAP_CARTES/','5827811_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5827811_27_66.csv'),
                         paste0(path,'SCRAP_CARTES/','5828008_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5828107_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5828878.csv'),
                         paste0(path,'SCRAP_CARTES/','5829783_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5830090_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5830090_26_65.csv'),
                         paste0(path,'SCRAP_CARTES/','5830427_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5830427_28_66.csv'),
                         paste0(path,'SCRAP_CARTES/','5830427_33_70.csv'),
                         paste0(path,'SCRAP_CARTES/','5830618_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5831027_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5831027_66_27.csv'),
                         paste0(path,'SCRAP_CARTES/','5831277_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5831550_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5831550_0_36.csv'),
                         paste0(path,'SCRAP_CARTES/','5831550_27_66.csv'),
                         paste0(path,'SCRAP_CARTES/','5831787_0_35.csv'),
                         paste0(path,'SCRAP_CARTES/','5831787_27_66.csv'),
                         paste0(path,'SCRAP_CARTES/','5831787_36_75.csv'),
                         paste0(path,'SCRAP_CARTES/','5832073_0_36.csv'),
                         paste0(path,'SCRAP_CARTES/','5832073_27_66.csv'),
                         paste0(path,'SCRAP_CARTES/','5832073_36_75.csv'),
                         paste0(path,'SCRAP_CARTES/','5832386_0_34.csv'),
                         paste0(path,'SCRAP_CARTES/','5832484_0_37.csv.csv'),
                         paste0(path,'SCRAP_CARTES/','5832799_0_39.csv'),
                         paste0(path,'SCRAP_CARTES/','5832799_27_66.csv'),
                         paste0(path,'SCRAP_CARTES/','5832799_44_77.csv'),
                         paste0(path,'SCRAP_CARTES/','5833027_0_39.csv'),
                         paste0(path,'SCRAP_CARTES/','5833027_0_39(1).csv'),
                         paste0(path,'SCRAP_CARTES/','5833027_27_65.csv'),
                         paste0(path,'SCRAP_CARTES/','5833027_28_67.csv'),
                         paste0(path,'SCRAP_CARTES/','5833027_29_67.csv'),
                         paste0(path,'SCRAP_CARTES/','5833985_0_39.csv.csv'),
                         paste0(path,'SCRAP_CARTES/','5834215_0_39.csv'),
                         paste0(path,'SCRAP_CARTES/','5834215_29_68.csv'),
                         paste0(path,'SCRAP_CARTES/','5834215_53_77.csv'),
                         paste0(path,'SCRAP_CARTES/','5834215_57_79.csv'),
                         paste0(path,'SCRAP_CARTES/','5834446_0_39.csv'),
                         paste0(path,'SCRAP_CARTES/','5834650_0_39.csv'),
                         paste0(path,'SCRAP_CARTES/','5834650_29_68.csv'),
                         paste0(path,'SCRAP_CARTES/','5834799_0_39.csv'),
                         paste0(path,'SCRAP_CARTES/','5834977_0_40.csv'),
                         paste0(path,'SCRAP_CARTES/','5834977_0_40(1).csv.csv'),
                         paste0(path,'SCRAP_CARTES/','5835213_0_40.csv'),
                         paste0(path,'SCRAP_CARTES/','5835330_0_40.csv'),
                         paste0(path,'SCRAP_CARTES/','5835653_0_40.csv'),
                         paste0(path,'SCRAP_CARTES/','5835899_0_50.csv'),
                         paste0(path,'SCRAP_CARTES/','5836294_0_50.csv'),
                         paste0(path,'SCRAP_CARTES/','5837029_0_50.csv'),
                         paste0(path,'SCRAP_CARTES/','5837029_29_68.csv'),
                         paste0(path,'SCRAP_CARTES/','5837029_60_78.csv'),
                         paste0(path,'SCRAP_CARTES/','5837242_0_49.csv'),
                         paste0(path,'SCRAP_CARTES/','5838227_0_49.csv'),
                         paste0(path,'SCRAP_CARTES/','5838227_25_78.csv'),
                         paste0(path,'SCRAP_CARTES/','5838227_28_67.csv'),
                         paste0(path,'SCRAP_CARTES/','5838640_0_49.csv'),
                         paste0(path,'SCRAP_CARTES/','5838640_28_67.csv'),
                         paste0(path,'SCRAP_CARTES/','5839037_0_49.csv'),
                         paste0(path,'SCRAP_CARTES/','5839037_28_67.csv'),
                         paste0(path,'SCRAP_CARTES/','5839462_0_49.csv'),
                         paste0(path,'SCRAP_CARTES/','5839719_0_49.csv'),
                         paste0(path,'SCRAP_CARTES/','5839719_28_67.csv'),
                         paste0(path,'SCRAP_CARTES/','5839719_39_77.csv'),
                         paste0(path,'SCRAP_CARTES/','5839946_0_49.csv'),
                         paste0(path,'SCRAP_CARTES/','5839946_29_68.csv'),
                         paste0(path,'SCRAP_CARTES/','5840566_0_77.csv'),
                         paste0(path,'SCRAP_CARTES/','5840566_29_68.csv'),
                         paste0(path,'SCRAP_CARTES/','5842220_0_49.csv'),
                         paste0(path,'SCRAP_CARTES/','5842466_0_49.csv'),
                         paste0(path,'SCRAP_CARTES/','5842634_0_49.csv'),
                         paste0(path,'SCRAP_CARTES/','5843064_1_77.csv'),
                         paste0(path,'SCRAP_CARTES/','5843064_27_68.csv'),
                         paste0(path,'SCRAP_CARTES/','6018608_0_69.csv'),
                         paste0(path,'SCRAP_CARTES/','5831550_51_85.csv'),
                         paste0(path,'SCRAP_CARTES/','5830618_85_27.csv'),
                         paste0(path,'SCRAP_CARTES/','5830090__37_86.csv'),
                         paste0(path,'SCRAP_CARTES/','5828008_1_86.csv'),
                         paste0(path,'SCRAP_CARTES/','5827431_86_14.csv'),
                         paste0(path,'SCRAP_CARTES/','5831550_86_52.csv'),
                         paste0(path,'SCRAP_CARTES/','5830618_81_89.csv'),
                         paste0(path,'SCRAP_CARTES/','5828008_80_90.csv'),
                         paste0(path,'SCRAP_CARTES/','5826848_80_90.csv'),
                         paste0(path,'SCRAP_CARTES/','5827679_81_90.csv'),
                         paste0(path,'SCRAP_CARTES/','5843064_66_84.csv'),
                         paste0(path,'SCRAP_CARTES/','5840566_67_87.csv'),
                         paste0(path,'SCRAP_CARTES/','5838227_67_86.csv'),
                         paste0(path,'SCRAP_CARTES/','5837029_86_69.csv'),
                         paste0(path,'SCRAP_CARTES/','5834650_28_87.csv'),
                         paste0(path,'SCRAP_CARTES/','5834215_65_85.csv'),
                         paste0(path,'SCRAP_CARTES/','5832799_68_86.csv'),
                         paste0(path,'SCRAP_CARTES/','5831787_85_73.csv')
)


### 2.3 Fusion des fichiers CSV et creation DATABASE_A ----

#formule

creationdbA <- function(chemincomplet){
  
  if(config == "MAC_MAISON"){
    path <- "/Users/holly/Documents/SOURCE/"
  }else{path <- "C:/PROJET_100_CARTE_LOCAL/SOURCE/"}
  
  
  
  file<- "SCRAP_CARTES/5827679_0_33.csv"
  dbtemp<- read.csv(paste0(path,file ),header = TRUE, sep=",",encoding = "UTF-8", colClasses=c( 'character'))
  
  dbtemp2<- read.csv(chemincomplet,header = TRUE, sep=",",encoding = "UTF-8", colClasses=c( 'character'))
  dbtemp<- rbind(dbtemp,dbtemp2)
  
  return(dbtemp)
}

dbtemp<-lapply(listecartesintegrer, creationdbA)
dbtemp<- rbindlist(dbtemp)
DATABASE_A<- rbind(DATABASE_A,dbtemp)

#Nettoyage des doublons

if(config == "MAC_MAISON")
{
  DATABASE_A<- DATABASE_A%>%
    mutate(lignetout = paste0(Text,Textbox_value,Title,Info))
}#version mac 

if(config == "PC_BUREAU"){
  DATABASE_A<- DATABASE_A%>%
    mutate(lignetout = paste0(X.U.FEFF.Text,Textbox_value,Title,Info))
}#version PC




DATABASE_A<- DATABASE_A%>%
  mutate(doublon = duplicated(lignetout))

DATABASE_A<- DATABASE_A%>%filter(doublon== "FALSE")

# Renomme les colonnes et vire celle qui sont inutiles

if(config == "MAC_MAISON")
{
  DATABASE_A<- DATABASE_A%>%rename(numcarte = Text)
}#version mac 

if(config == "PC_BUREAU"){
  DATABASE_A<- DATABASE_A%>%rename(numcarte = X.U.FEFF.Text)#version PC
}#version PC



DATABASE_A<- DATABASE_A%>%rename(jour = Textbox_value)
DATABASE_A<- DATABASE_A%>%select(-lignetout,-doublon,-Image, -Image1, -Image3)


# Transforme la colonne article_body_text en dataframe
DATABASE_A<- separate_rows(DATABASE_A, article_body_text, sep = "\n")
x<- DATABASE_A%>%group_by(jour)%>%tally()

#etablis la liste des jour du fichier
DATABASE_A$jour[DATABASE_A$jour=="Title"]<- ""

DATABASE_A$jour <- as.integer(unlist(DATABASE_A$jour))
DATABASE_A%>%glimpse()
y<- DATABASE_A%>%group_by(jour, numcarte)%>%tally()
w<- y%>%summarise(max = max(jour), groups = numcarte)
w<- w%>%group_by(groups)%>%tally()%>%mutate(jourmoins2 = n-2)
w$jourmoins2<- as.integer(w$jourmoins2)
w


# Enleve les deux deniers jours

DBmoinsdeuxjours <- function(numcartef){
  dbtemp2 <- DATABASE_A%>%filter(Title == "RÈGLES DU JEU SUPPLÉMENTAIRES")%>%
    filter(article_body_text == "")
  dbtemp2$numcarte<- ""
  dbtemp2<-dbtemp2[1,]
  
  y<- DATABASE_A%>%
    filter(numcarte ==numcartef)%>%
    summarize(max(jour))
  y<-y-2
  y<-y[1,]
  dbtemp<- DATABASE_A%>%
    filter(numcarte == numcartef)%>%
    filter(jour <= y)
  dbtemp<- rbind(dbtemp,dbtemp2)
  return(dbtemp)}

### 2.4 Création Database B -----
DATABASE_B <- DATABASE_A%>%filter(Title == "RÈGLES DU JEU SUPPLÉMENTAIRES")%>%
  filter(article_body_text == "")
DATABASE_B$numcarte<- ""
#DATABASE_B<-dbtemp2[1,] je ne comprend pas cette ligne
#rm(DATABASE_A)
#rm(dbtemp)
gc()


dbtemp<- lapply(w$groups, DBmoinsdeuxjours)
dbtemp<- rbindlist(dbtemp)
DATABASE_B<- rbind(DATABASE_B,dbtemp)

#Nous avons donc une base de données DATABASE B identique à un scrapping manuel avec Google drive

#rajout de la liste des cartes


dbtemp<- read.csv(paste0(path,'SCRAP_CARTES/','les100Cartes.csv'),header = TRUE, sep=",",encoding = "UTF-8", colClasses=c( 'character'))
DATABASE_B<- rbind(DATABASE_B,dbtemp)

#sauvegarde du fichier
write.csv2(DATABASE_B, paste0(path, "0_Database_B.csv"), fileEncoding = "UTF-8")
#temps = 15 secondes

### 2.5 rajout des deux cartes googles drives (historique) ----

if(config == "MAC_MAISON")
{
  liste_carte_temoins1 <- read.csv("/Users/holly/Documents/SOURCE/Data_gdrive/Carte_4678346_carte31_S1914_78_FIN - Commentaire.csv",header = TRUE, sep=",",encoding = "UTF-8", colClasses=c( 'character'))
  liste_carte_temoins2 <- read.csv("/Users/holly/Documents/SOURCE/Data_gdrive/Carte_5420045_carte31_S1914_Jour91_FIN - Commentaire.csv",header = TRUE, sep=",",encoding = "UTF-8", colClasses=c( 'character'))
  
}#version mac 

if(config == "PC_BUREAU"){
  liste_carte_temoins1 <- read.csv("C:/PROJET_100_CARTE_LOCAL/SOURCE/Data_gdrive/Carte_4678346_carte31_S1914_78_FIN - Commentaire.csv",header = TRUE, sep=",",encoding = "UTF-8", colClasses=c( 'character'))
  liste_carte_temoins2 <- read.csv("C:/PROJET_100_CARTE_LOCAL/SOURCE/Data_gdrive/Carte_5420045_carte31_S1914_Jour91_FIN - Commentaire.csv",header = TRUE, sep=",",encoding = "UTF-8", colClasses=c( 'character'))
}#version PC


liste_carte_temoins1<-liste_carte_temoins1%>%rename(X= DATA)
cartes_temoins<-rbind(liste_carte_temoins1,liste_carte_temoins2)%>%
  rename(numcarte = N..carte)%>%
  rename(jour = Jour)%>%
  mutate(Title = "")%>%
  mutate(Info = "")%>%
  mutate(func_country_link = "")%>%
  mutate(Info2 = "")%>%
  rename(article_body_text = Commentaire)%>%
  select(numcarte, jour, Title,Info,func_country_link,Info2,article_body_text )
cartes_temoins%>%glimpse()
DATABASE_B%>%glimpse()
DATABASE_B<-rbind(DATABASE_B,cartes_temoins)

rm(DATABASE_A)
rm(dbtemp)
rm(liste_carte_temoins1, liste_carte_temoins2)
gc()



DATABASE_B$numcarte<-as.character(DATABASE_B$numcarte)
DATABASE_B$numcarte<- str_replace_all(DATABASE_B$numcarte,",","")
rm(w,y, listecartesintegrer, creationdbA,DBmoinsdeuxjours,cartes_temoins)




### 2.6 Nettoyage base de données-----

DATABASE_B$numcarte<-str_replace(DATABASE_B$numcarte, "﻿","")
DATABASE_B$jour<-str_replace(DATABASE_B$jour, "﻿","")
DATABASE_B$Title<-str_replace(DATABASE_B$Title, "﻿","")
DATABASE_B$func_country_link<-str_replace(DATABASE_B$func_country_link, "﻿","")
DATABASE_B$Info<-str_replace(DATABASE_B$Info, "﻿","")
DATABASE_B$Info2<-str_replace(DATABASE_B$Info2, "﻿","")
DATABASE_B$article_body_text<-str_replace(DATABASE_B$article_body_text, "﻿","")

# DATABASE_B$numcarte<-str_replace(DATABASE_B$numcarte, "  "," ")
# DATABASE_B$jour<-str_replace(DATABASE_B$jour, "  "," ")
# DATABASE_B$Title<-str_replace(DATABASE_B$Title, "  "," ")
# DATABASE_B$func_country_link<-str_replace(DATABASE_B$func_country_link, "  "," ")
# DATABASE_B$Info<-str_replace(DATABASE_B$Info, "  "," ")
# DATABASE_B$Info2<-str_replace(DATABASE_B$Info2, "  "," ")
# DATABASE_B$article_body_text<-str_replace(DATABASE_B$article_body_text, "  "," ")



### 2.7 tableau de controle des jours----
#Nettoyage des cartes incompletes
DATABASE_B<-DATABASE_B%>%
  filter(numcarte != "5839037")%>%
  filter(numcarte != "5831027")



x<- DATABASE_B
x$jour<-as.integer(x$jour)
x$numcarte<-as.integer(x$numcarte)
x<- x%>%group_by(jour, numcarte)%>%
  tally()%>%
  mutate(doublon = paste0(jour,numcarte))%>%
  mutate(double = duplicated(doublon))
x<- x%>%mutate(n2=1)%>%
  filter(!is.na(numcarte))%>%
  filter(!is.na(jour))
#x$jour<-as.character(x$jour)
x$numcarte<-as.character(x$numcarte)

DF_MAX_JOUR<-x%>%
  group_by(numcarte)%>%
  summarise(max = max(jour))

#calcul pour vérifer qu'on oublie aucun jour
jourmax <- DF_MAX_JOUR$max [match(x$numcarte,DF_MAX_JOUR$numcarte)]

jourmax<-data.frame(jourmax)

x<-cbind(x,jourmax)

x<-x%>%arrange(desc(jourmax))

ctrljour<-x%>%select(jour, numcarte,n2, jourmax)
ctrljour%>%
  #filter(numcarte=="5831550")%>%
  ggplot(aes(x=jour, y = numcarte, fill = n2))+geom_point()+
  ggtitle("Carte et jour : controle continuité (partie 31 joueurs)")+
  geom_vline(xintercept = 20,color = "blue")+
  geom_vline(xintercept = 40,color = "blue")+
  geom_vline(xintercept = 60,color = "blue")+
  geom_vline(xintercept = 80,color = "blue")


#Histogramme des jours de parties
DF_MAX_JOUR%>%
  ggplot(aes(numcarte=max, x = max, fill=numcarte))+geom_col()

ordre2<- DF_MAX_JOUR%>%arrange(max)%>%select(numcarte)
ordre2<- ordre2%>%pull(numcarte)

DF_MAX_JOUR$numcarte<-fct_relevel(ordre2)
levels(DF_MAX_JOUR$numcarte)


ctrljour%>%
  ggplot(aes(y=numcarte))+geom_bar()

ordre<- ctrljour%>%arrange(jourmax)%>%pull(numcarte)

ctrljour$numcarte<-fct_relevel(ordre)
levels(ctrljour$numcarte)

#sauvegarde du fichier
write.csv2(DF_MAX_JOUR, paste0(path, "DF_MAX_JOUR.csv"), fileEncoding = "UTF-8")


## 3 CREATION DE TABLE AVEC VALEUR FIXES  ----

### 3.1 Liste des pays carte 31 ----

DF_Liste_pays_carte31 <- DATABASE_B%>%
  filter(str_detect(article_body_text," tonnes."))%>% #je prends les tonnes
  mutate(col1_1erdeuxpoints = str_locate(article_body_text, " : "))%>%#trouve le 1er ":"
  mutate(col2_txtapres1er2point = str_sub(article_body_text, start = (col1_1erdeuxpoints[,1])+2, end = -1L))%>% #Ecris le texte après le 1er double point
  mutate(col3_2edeuxpoints = str_locate(col2_txtapres1er2point, " : "))%>% #trouve le 2er ":"
  mutate(col4_txtapres2e2point = str_sub(col2_txtapres1er2point, start = (col3_2edeuxpoints[,1])+3, end = -1L))%>% #on prend le texte après le 2epoint
  mutate(col5_txt_pays_OK = str_sub(col2_txtapres1er2point, start = (1L)+1, end = col3_2edeuxpoints[,1]-1))%>%
  mutate(col6_espaceapres2e2points = str_locate(col4_txtapres2e2point, " "))%>%
  mutate(col7_tonnes = str_sub (col4_txtapres2e2point, start = (1L) , end = col6_espaceapres2e2points[,1]))%>%
  filter(!is.na(col7_tonnes))%>%
  mutate(col8_tonnes_sansvirgules = str_replace(col7_tonnes, ",",""))%>%
  mutate(col9_tonnes_OK= as.integer(col8_tonnes_sansvirgules))
DF_Liste_pays_carte31$jour<- as.integer(DF_Liste_pays_carte31$jour)
DF_Liste_pays_carte31$col5_txt_pays_OK<-str_to_title(DF_Liste_pays_carte31$col5_txt_pays_OK)
DF_Liste_pays_carte31<- DF_Liste_pays_carte31%>%group_by(col5_txt_pays_OK)%>%tally()%>%select(col5_txt_pays_OK)%>%
  mutate(pays_minuscule = str_to_lower(col5_txt_pays_OK))%>%
  mutate(pays_majuscule = str_to_upper(col5_txt_pays_OK))%>%
  mutate(pays_title = str_to_title(col5_txt_pays_OK))%>%
  rename(pays_original = col5_txt_pays_OK)

#Rajout des nationalité des armées tel que apparait dans les commentaires du jeur


df_natinonalite_armee<- read_excel(paste0(path,"Data_input_manuel/Nationalite_armee.xlsx" ))


DF_Liste_pays_carte31<- DF_Liste_pays_carte31%>%mutate(nationalite_armee_MAJUSCULE = df_natinonalite_armee$Nationalite [match(DF_Liste_pays_carte31$pays_majuscule,df_natinonalite_armee$PAYS )])

DF_Liste_pays_carte31%>%filter(is.na(nationalite_armee_MAJUSCULE))#Controle qu'aucune province n'est oublié
rm(df_natinonalite_armee)


DF_Liste_pays_carte31

liste_43 <-1:43
liste_43<-data_frame(liste_43)
DF_Liste_pays_carte31<- cbind(DF_Liste_pays_carte31,liste_43)%>%
  mutate(deuxlettre= str_sub(pays_original, start = -4 ))%>%arrange(deuxlettre)
liste_43_alea <-1:43
liste_43_alea<-data_frame(liste_43_alea)
DF_Liste_pays_carte31<- cbind(DF_Liste_pays_carte31,liste_43_alea)%>%select(-deuxlettre)%>%
  arrange(pays_original)
DF_Liste_pays_carte31


### 3.2 Liste des joueurs et leur pays----


#Methode 1

#On identifie tout les types de phrases a un nouveau 
typedeanouveau <- DATABASE_B%>%
  filter(str_detect(article_body_text, " a un nouveau "))%>%
  select(article_body_text, numcarte)%>%mutate(debuttxt =  str_locate(article_body_text," a un nouveau "))%>%
  mutate(letypedephrase = str_sub(article_body_text, start = debuttxt[,1]))%>%group_by(letypedephrase)%>%tally()


#On identifie tout les types de phrases qui annonce un nouveau chef
df_joueur_pays <-DATABASE_B%>%
  filter(
    str_detect(article_body_text, "a un nouveau Empereur.") |
      str_detect(article_body_text, "a un nouveau Gouverneur Général.") |
      str_detect(article_body_text, "a un nouveau Gouverneur.") |
      str_detect(article_body_text, "a un nouveau Grand Duc.") |
      str_detect(article_body_text, "a un nouveau Hetman.") |
      str_detect(article_body_text, "a un nouveau Imam.") |
      str_detect(article_body_text, "a un nouveau Marzalek.") |
      str_detect(article_body_text, "a un nouveau Pape.") |
      str_detect(article_body_text, "a un nouveau Premier Ministre.") |
      str_detect(article_body_text, "a un nouveau Président.") |
      str_detect(article_body_text, "a un nouveau Roi.") |
      str_detect(article_body_text, "a un nouveau Sultan.") |
      str_detect(article_body_text, "a un nouveau Tsar.") |
      str_detect(article_body_text, "a un nouveau Vasilias."))%>%
  select(jour, article_body_text, Title, numcarte)


#df_joueur_pays <-DATABASE_B%>%
#  filter(str_detect(Title, " EST LE NOUVEAU "))%>%
#  select(jour,Title,numcarte)

#Rajoute une colonne avec le début de la phrase EST
df_joueur_pays<- df_joueur_pays%>%mutate(debutprahseEST = str_locate (df_joueur_pays$Title," EST LE NOUVEAU ")[,1])
df_joueur_pays<- df_joueur_pays%>%mutate(finprahseEST = str_locate (df_joueur_pays$Title," EST LE NOUVEAU ")[,2])

#Etablis la colonne nom du joueur
df_joueur_pays<- df_joueur_pays%>%mutate(NOMJOUEUR = str_sub(df_joueur_pays$Title,start = 1, end = df_joueur_pays$debutprahseEST-1))




#Prendre la fin du commentaire pour éviter qu'il prenne deux fois DE et D' par exemple 
df_joueur_pays<-df_joueur_pays%>%mutate(fincommentaire =str_sub(df_joueur_pays$Title,start = df_joueur_pays$finprahseEST, end = -1))

#Rajoute une colonne avec le début de la phrase DU, DE, D'
df_joueur_pays<- df_joueur_pays%>%mutate(DE = str_locate (df_joueur_pays$fincommentaire,"DE ")[,1])
df_joueur_pays<- df_joueur_pays%>%mutate(DU = str_locate (df_joueur_pays$fincommentaire,"DU ")[,1])
df_joueur_pays<- df_joueur_pays%>%mutate(D_apostrophe = (str_locate (df_joueur_pays$fincommentaire,"D\'")[,1])-1)
#Remplace tout les NA par ""

df_joueur_pays$DE <- as.character(df_joueur_pays$DE)
df_joueur_pays$DU <- as.character(df_joueur_pays$DU)
df_joueur_pays$D_apostrophe <- as.character(df_joueur_pays$D_apostrophe)
df_joueur_pays$DE[is.na(df_joueur_pays$DE)] <- ""
df_joueur_pays$DU[is.na(df_joueur_pays$DU)] <- ""
df_joueur_pays$D_apostrophe[is.na(df_joueur_pays$D_apostrophe)] <- ""


df_joueur_pays<- df_joueur_pays%>%mutate(resultat = (paste0(df_joueur_pays$DE,df_joueur_pays$DU, df_joueur_pays$D_apostrophe)))

df_joueur_pays<- df_joueur_pays%>%mutate(DU_DE_D = as.integer(str_sub(df_joueur_pays$resultat,1,2)))

#Rajoute le nom du pays du joueur et on vire les doublons
df_joueur_pays<-df_joueur_pays%>%
  mutate(paysjoueur = str_sub(df_joueur_pays$fincommentaire,start = df_joueur_pays$DU_DE_D+3, end = -1))%>%
  mutate(lignecomplete= paste0(numcarte, Title))%>% 
  mutate(doublon = duplicated(lignecomplete))%>%filter(doublon == FALSE)

df_joueur_pays<- df_joueur_pays%>%select(paysjoueur,NOMJOUEUR, numcarte)%>%mutate (paysjoueur_title = str_to_title(paysjoueur) )%>%mutate (Nomjoueeur_little = str_to_lower(NOMJOUEUR))


#On complete avec coup d'état 
#on filtre les données avec le coup d'état
typecoupetat <- DATABASE_B%>%
  filter(str_detect(article_body_text, " a manqué à ses responsabilités ")) #on filtre les données avec le coup d'état


typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Empereur ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Gouverneur ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Gouverneur Général ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Grand Duc ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Hetman ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Imam ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Marzalek ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Pape ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Premier Ministre ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Président ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Roi ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Sultan ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Tsar ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text, "Vasilias ", "")
typecoupetat$article_body_text<- str_replace(typecoupetat$article_body_text,"                        ","")


typecoupetat<- typecoupetat%>%
  mutate(col21ervigule = str_locate(article_body_text,","))%>%
  mutate(col3_nomjoueur = str_sub(article_body_text, start = 1L, end =col21ervigule[,1]-1 ))

#fusion liste"a un nouvean" avec liste coup d'état
typecoupetat<-typecoupetat%>%
  rename(paysjoueur = Info2)%>%
  mutate(NOMJOUEUR = str_to_upper(col3_nomjoueur))%>%
  mutate(paysjoueur_title = str_to_title(paysjoueur))%>%
  mutate(Nomjoueeur_little = str_to_title(NOMJOUEUR))%>%
  select(paysjoueur, NOMJOUEUR, numcarte, paysjoueur_title, Nomjoueeur_little)

df_joueur_pays<- rbind(df_joueur_pays,typecoupetat)
df_joueur_pays<- df_joueur_pays%>%
  mutate(lignecomplete= paste0(paysjoueur, NOMJOUEUR, numcarte))%>% 
  mutate(doublon = duplicated(lignecomplete))%>%
  filter(doublon == FALSE)

df_joueur_pays<-df_joueur_pays%>%select(paysjoueur, NOMJOUEUR, numcarte, paysjoueur_title, Nomjoueeur_little)


DF_Liste_joueurs_pays <-df_joueur_pays
rm(df_joueur_pays)
DF_Liste_joueurs_pays<-DF_Liste_joueurs_pays%>%
  rename(Pays_joueur_upper = paysjoueur)%>%
  rename(Nomjoueeur_upper = NOMJOUEUR)

rm(typecoupetat, typedeanouveau)
#la liste
DF_Liste_joueurs_pays
# les cartes GOOGLE drives n'indique pas le nom du pays. Mais bon c'est pas super grave

### 3.3 Liste des provinces -----

#on identifie tout les textes entre PM ou AM et "a un nouveau" #"	12:11 am Cagliari a un nouveau Port."

aunnouveau<- DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  filter(str_detect(article_body_text, " a un nouveau "))%>% #on filtre les données des nouvelles constructions
  mutate(col1_1erpm = str_locate(article_body_text, " pm "))%>%#trouve le 1er "pm"
  mutate(col2_1eram = str_locate(article_body_text, " am "))#trouve le 1er "am"
aunnouveau$col1_1erpm[is.na(aunnouveau$col1_1erpm)]<-0 #remplace les NA par zero
aunnouveau$col2_1eram[is.na(aunnouveau$col2_1eram)]<-0 #remplace les NA par zero
aunnouveau<-aunnouveau%>%
  mutate(col3_1eramoupm =  col1_1erpm + col2_1eram )%>%
  mutate(col4_txtapresPMorAM = str_sub(article_body_text, start = (col3_1eramoupm[,1])+2, end = -1L))%>% #Ecris le texte après le 1er pm ou am
  mutate(col_1er_aunnouveau_dasncol4 = str_locate(col4_txtapresPMorAM, " a un nouveau "))%>%#trouve le 1er "a un nouveau"
  mutate(nom_province = str_sub(col4_txtapresPMorAM, start = 3, end = col_1er_aunnouveau_dasncol4[,1]-1))%>%
  select(nom_province)%>%
  arrange(nom_province)%>%
  mutate(doublon = duplicated(nom_province))%>%
  filter(doublon== FALSE)%>%
  select(nom_province)
aunnouveau$nom_province<- str_replace(aunnouveau$nom_province,"                   ","") #on efface les zones avec beaucoup d'espace
aunnouveau$nom_province<- str_replace(aunnouveau$nom_province,"  ","")
aunnouveau<- aunnouveau%>%
  mutate(doublon = duplicated(nom_province))%>%
  filter(doublon== FALSE)%>%
  select(nom_province)%>%
  mutate(ncar = nchar(nom_province))%>%
  filter(ncar<21)%>%
  select(nom_province)

aunnouveau

#Puis tout les villes ou une unité à été détruite  #"1:40 pm Awaynat : Le 38e UKRAINIEN Brigade Artillerie (BR 38) a été détruit a"

unitedetruite<- DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  filter(str_detect(article_body_text, " a été détruit "))%>% #on filtre les données des provinces où une unité a été détruite
  mutate(col1_1erpm = str_locate(article_body_text, " pm "))%>%#trouve le 1er "pm"
  mutate(col2_1eram = str_locate(article_body_text, " am "))#trouve le 1er "am"
unitedetruite$col1_1erpm[is.na(unitedetruite$col1_1erpm)]<-0 #remplace les NA par zero
unitedetruite$col2_1eram[is.na(unitedetruite$col2_1eram)]<-0 #remplace les NA par zero
unitedetruite<-unitedetruite%>%
  mutate(col3_1eramoupm =  col1_1erpm + col2_1eram )%>%
  mutate(col4_txtapresPMorAM = str_sub(article_body_text, start = (col3_1eramoupm[,1])+2, end = -1L))%>% #Ecris le texte après le 1er pm ou am
  mutate(col5_1er_deuxpoints_dasncol4 = str_locate(col4_txtapresPMorAM, " : "))%>%#trouve le 1er ":"
  mutate(nom_province = str_sub(col4_txtapresPMorAM, start = 3, end = col5_1er_deuxpoints_dasncol4[,1]-1))%>%
  select(nom_province)%>%
  arrange(nom_province)%>%
  mutate(doublon = duplicated(nom_province))%>%
  filter(doublon== FALSE)%>%
  select(nom_province)

unitedetruite<- unitedetruite%>%
  mutate(ncar = nchar(nom_province))%>%
  filter(ncar<21)%>%
  select(nom_province)

unitedetruite

#puis toute les provinces qui ont été conquises # "2:31 pm Le 34e UKRAINIEN Division Infanterie a conquis Tan-Tan."

aconquis<- DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  filter(str_detect(article_body_text, " a conquis "))%>% #on filtre les données des provinces où la producation a cessé
  mutate(col1_1erpm = str_locate(article_body_text, " pm "))%>%#trouve le 1er "pm"
  mutate(col2_1eram = str_locate(article_body_text, " am "))#trouve le 1er "am"
aconquis$col1_1erpm[is.na(aconquis$col1_1erpm)]<-0 #remplace les NA par zero
aconquis$col2_1eram[is.na(aconquis$col2_1eram)]<-0 #remplace les NA par zero
aconquis<-aconquis%>%
  mutate(col3_1eramoupm =  col1_1erpm + col2_1eram )%>%
  mutate(col4_txtapresPMorAM = str_sub(article_body_text, start = (col3_1eramoupm[,1])+2, end = -1L))%>% #Ecris le texte après le 1er pm ou am
  mutate(col5_1er_aconquis_dasncol4 = str_locate(col4_txtapresPMorAM, " a conquis "))%>%#trouve le 1er " a conquis "
  mutate(nom_province = str_sub(col4_txtapresPMorAM, start = col5_1er_aconquis_dasncol4[,1]+11, end = -2L))%>%
  select(nom_province)%>%
  arrange(nom_province)%>%
  mutate(doublon = duplicated(nom_province))%>%
  filter(doublon== FALSE)%>%
  select(nom_province)

aconquis<- aconquis%>%
  mutate(ncar = nchar(nom_province))%>%
  filter(ncar<21)%>%
  select(nom_province)

aconquis



#Puis tout les provinces avec un manque de ressources #"4:56 pm Le Caserne à Paris a arrêté de travailler à cause d'un manque de ressources."

manqueressource<- DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  filter(str_detect(article_body_text, " a arrêté de travailler à cause d'un manque de ressources."))%>% #on filtre les données des provinces où la producation a cessé
  mutate(col1_1erpm = str_locate(article_body_text, " pm "))%>%#trouve le 1er "pm"
  mutate(col2_1eram = str_locate(article_body_text, " am "))#trouve le 1er "am"
manqueressource$col1_1erpm[is.na(manqueressource$col1_1erpm)]<-0 #remplace les NA par zero
manqueressource$col2_1eram[is.na(manqueressource$col2_1eram)]<-0 #remplace les NA par zero
manqueressource<-manqueressource%>%
  mutate(col3_1eramoupm =  col1_1erpm + col2_1eram )%>%
  mutate(col4_txtapresPMorAM = str_sub(article_body_text, start = (col3_1eramoupm[,1])+2, end = -1L))%>% #Ecris le texte après le 1er pm ou am
  mutate(col5_1er_aaccent_dasncol4 = str_locate(col4_txtapresPMorAM, " à "))%>%#trouve le 1er "à"
  mutate(col6_1er_arreterdetravailler_dasncol4 = str_locate(col4_txtapresPMorAM, " a arrêté de travailler à cause d'un manque de ressources."))%>%#trouve le 1er "a arrêté de travailler à cause d'un manque de ressources."
  mutate(nom_province = str_sub(col4_txtapresPMorAM, start = col5_1er_aaccent_dasncol4[,1]+3, end = col6_1er_arreterdetravailler_dasncol4[,1]-1))%>%
  select(nom_province)%>%
  arrange(nom_province)%>%
  mutate(doublon = duplicated(nom_province))%>%
  filter(doublon== FALSE)%>%
  select(nom_province)

manqueressource<- manqueressource%>%
  mutate(ncar = nchar(nom_province))%>%
  filter(ncar<21)%>%
  select(nom_province)

manqueressource

#Puis les deux capitales
"	
7:35 am 35e UKRAINIEN Brigade Infanterie capture la capitale de FRANCE, Paris. Le moral du pays en FRANCE chute considérablement, alors que les citoyens font la fête dans les rues de BRINDISI."


#On crée une seule data base avec toute les provinces
DF_liste_provinces<-rbind( aconquis, manqueressource)
#on vire les doublons

DF_liste_provinces<-DF_liste_provinces%>%
  mutate(doublon = duplicated(nom_province))%>%
  filter(doublon== FALSE)%>%
  select(nom_province)

#on vire les pays
#DF_liste_provinces<- DF_liste_provinces%>%
#  mutate(province_minuscule = str_to_lower(nom_province))%>%
#  mutate(pays_prov = if_else(province_minuscule %in% DF_Liste_pays_carte31$pays_minuscule, "pays", "province"))%>%
#  filter(pays_prov=="province")%>%
#  select(nom_province) 

#On créé la liste des provinces à la main #ancienne méthode

liste_province_main<- c("Aalborg",
                        "Aalesund",
                        "Abadla",
                        "Abou Simbel",
                        "Adrar",
                        "Agadir",
                        "Ajaccio",
                        "Akulivik",
                        "Akureyri",
                        "Al Iskandariyah",
                        "Al Ula",
                        "Alba",
                        "Alba Iulia",
                        "Alger",
                        "Alta",
                        "Amman",
                        "Amsterdam",
                        "An",
                        "An Nabk",
                        "Angora",
                        "Antalya",
                        "Anvers",
                        "Arar",
                        "Arhus",
                        "Arkhangelsk",
                        "Armavir",
                        "Asheville",
                        "At",
                        "At Tanfo",
                        "Athènes",
                        "Atlanta",
                        "Awaynat",
                        "Badajoz",
                        "Baia Mare",
                        "Barcelone",
                        "Bardai",
                        "Barramiya",
                        "Batsfjord",
                        "Batumi",
                        "Béchar",
                        "Beirut",
                        "Béjaïa",
                        "Belfast",
                        "Belgrade",
                        "Benghazi",
                        "Bergen",
                        "Berlin",
                        "Berne",
                        "Bialystok",
                        "Bir Mogrein",
                        "Birak",
                        "Birmingham",
                        "Bologne",
                        "Bône",
                        "Bordeaux",
                        "Boston",
                        "Breslau",
                        "Brest",
                        "Brest-Litovsk",
                        "Brousse",
                        "Bruxelles",
                        "Brydah",
                        "Bucarest",
                        "Budapest",
                        "Bur Said",
                        "Burgos",
                        "Bursa",
                        "Cagliari",
                        "Casablanca",
                        "Cettigne",
                        "Charleston",
                        "Charlotte",
                        "Cherepovets",
                        "Cherkessk",
                        "Chernigov",
                        "Chernushka",
                        "Christiania",
                        "Cincinnati",
                        "Cleveland",
                        "Coimbra",
                        "Cologne",
                        "Columbia",
                        "Columbus",
                        "Concord",
                        "Constanţa",
                        "Constantine",
                        "Constantinople",
                        "Copenhague",
                        "Corner",
                        "Corner Brook",
                        "Cracovie",
                        "Craiova",
                        "Dantzig",
                        "Darnah",
                        "Detroit",
                        "Dimashq",
                        "Djanet",
                        "Drama",
                        "Dublin",
                        "Eigersund",
                        "Ekaterinoslav",
                        "El' Argoub",
                        "El'Argoub",
                        "Elista",
                        "Enontekio",
                        "Ezbet Tileitla",
                        "Faiyum",
                        "Famagusta",
                        "Fderik",
                        "Fés",
                        "Forestville",
                        "Francfort",
                        "Frederiksdal",
                        "Frederikshab",
                        "Fudukwan",
                        "Galatz",
                        "Gènes",
                        "Ghardaïa",
                        "Ghat",
                        "Glasgow",
                        "Godthab",
                        "Golea",
                        "Göteborg",
                        "Groenland Danois",
                        "Ha'Il",
                        "Haleb",
                        "Halifax",
                        "Hambourg",
                        "Hanovre",
                        "Hauterive",
                        "Helsingfors",
                        "Homyel",
                        "Hosteinborg",
                        "Houn",
                        "Iaşi",
                        "Illizi",
                        "In",
                        "In Salah",
                        "Inari",
                        "Innsbruck",
                        "Inverness",
                        "Ivigtuut",
                        "Jacksonville",
                        "Jalu",
                        "Jérusalem",
                        "Kairouan",
                        "Kalmar",
                        "Kaltstad",
                        "Kamenka",
                        "Kandalakcha",
                        "Kandalaksha",
                        "Kangiqsualujjuaq",
                        "Kangiqsujuaq",
                        "Karlstad",
                        "Kaunas",
                        "Kharkov",
                        "Kherson",
                        "Khofra",
                        "Kielce",
                        "Kiev",
                        "Kimmirut",
                        "Kishinev",
                        "Klaipeda",
                        "Knoxville",
                        "Koenigsberg",
                        "Kokkola",
                        "Konich",
                        "Konstantinovsk",
                        "Kostomuksha",
                        "Kostroma",
                        "Kotlas",
                        "Koursk",
                        "Krasnokamsk",
                        "Kronstadt",
                        "Kuopio",
                        "Kuujjuarapik",
                        "Kuusamo",
                        "La",
                        "La Canée",
                        "La Haye",
                        "Laayoune",
                        "Labrador City",
                        "Lagos",
                        "Larissa",
                        "Le Caire",
                        "Lemberg",
                        "Lexington-Fayette",
                        "Lille",
                        "Limerick",
                        "Limoges",
                        "Lincoln",
                        "Lisbonne",
                        "Liverpool",
                        "Łódź",
                        "Londres",
                        "Louisville",
                        "Lublin",
                        "Luleå",
                        "Lyon",
                        "Madama",
                        "Madrid",
                        "Makkah",
                        "Málaga",
                        "Mali",
                        "Malung",
                        "Manchester",
                        "Marble Arch",
                        "Mariupol'",
                        "Maroc",
                        "Marrakech",
                        "Marseille",
                        "Massif des Eglab",
                        "Ma'tan as Sarah",
                        "Médenine",
                        "Melilla",
                        "Miami",
                        "Mikhaylovka",
                        "Milan",
                        "Minsk",
                        "Miskolc",
                        "Misurata",
                        "Mogilev",
                        "Moncton",
                        "Montgomery",
                        "Montréal",
                        "Moose",
                        "Moose Factory",
                        "Morgantown",
                        "Moscou",
                        "Mozyr",
                        "Muchkas",
                        "Munich",
                        "Mut",
                        "Nalut",
                        "Nancy",
                        "Naples",
                        "New York",
                        "Nicosie",
                        "Nikolaistad",
                        "Nikol'sk",
                        "Nisk",
                        "North",
                        "North Bay",
                        "Novi-Bazar",
                        "Novorossiysk",
                        "Oran",
                        "Orenbourg",
                        "Orlando",
                        "Orsha",
                        "Östersund",
                        "Ottawa",
                        "Oued",
                        "Palerme",
                        "Palma",
                        "Palma de Majorque",
                        "Palmyre",
                        "Paris",
                        "Pembroke",
                        "Penza",
                        "Perm",
                        "Philadelphie",
                        "Pinsk",
                        "Pittsburgh",
                        "Pleven",
                        "Plock",
                        "Plonsk",
                        "Plovdiv",
                        "Podolia",
                        "Poltava",
                        "Port Hope Simpson",
                        "Port-Cartier",
                        "Portland",
                        "Porto",
                        "Portsmouth",
                        "Potsdam",
                        "Prague",
                        "Primorsko-Akhatars",
                        "Pyrgos",
                        "Québec",
                        "Rabat",
                        "Rachidia",
                        "Raleigh",
                        "Rana",
                        "Reggane",
                        "Reggio",
                        "Reykjavik",
                        "Richmond",
                        "Riga",
                        "Rize",
                        "Roanoke",
                        "Rome",
                        "Rostov-sur-le-Don",
                        "Sabhah",
                        "Salamanque",
                        "Salonique",
                        "Sarajevo",
                        "Saratov",
                        "Sarir Tibisti",
                        "Savannah",
                        "Schneemannshausen",
                        "Scranton",
                        "Sebastopol",
                        "Séville",
                        "Sherbrooke",
                        "Sidi Barrani",
                        "Siedlce",
                        "Simbirsk",
                        "Sinope",
                        "Siwa",
                        "Slatina",
                        "Smolensk",
                        "Smyrne",
                        "Snasa",
                        "Sofia",
                        "Sorsele",
                        "St.",
                        "St.Petersbourg",
                        "Stavropol",
                        "St-Jacques-de-Compostelle",
                        "Stockholm",
                        "Strasbourg",
                        "Sudbury",
                        "Sukhumi",
                        "Sukkertoppen",
                        "Summerville",
                        "Sundsvall",
                        "Surt",
                        "Syktyvkar",
                        "Szeged",
                        "Tabuk",
                        "Tall 'Afar",
                        "Tallahassee",
                        "Tallinn",
                        "Tanger",
                        "Tan-Tan",
                        "Tazirbu",
                        "Timimoun",
                        "Timmins",
                        "Tinfouchy",
                        "Tirana",
                        "Tmassah",
                        "Torneå",
                        "Toronto",
                        "Touggourt",
                        "Toulouse",
                        "Trieste",
                        "Tripoli",
                        "Tromsø",
                        "Trondheim",
                        "Tubruq",
                        "Tunis",
                        "Turnu",
                        "Turnu Severin",
                        "Ukhta",
                        "Umeå",
                        "Umiujaq",
                        "Uskub",
                        "Usogorsk",
                        "Utorqarmiut",
                        "Valence",
                        "Valmiera",
                        "Varna",
                        "Varsovie",
                        "Venise",
                        "Vermont",
                        "Viatka",
                        "Viborg",
                        "Vienne",
                        "Vilnius",
                        "Vitebsk",
                        "Volgodonsk",
                        "Volhynia",
                        "Vologda",
                        "Waddan",
                        "Washington",
                        "Yanina",
                        "Zamosc",
                        "Zaouatanlaz",
                        "Zurich","Brindisi","Kotka","St. Petersbourg")
df_liste_manuel<- data.frame(liste_province_main)%>%
  mutate(nomprovincemanuel_minuscule = str_to_lower(liste_province_main))

x<- DF_liste_provinces%>%
  mutate(nomminusucle = str_to_lower(nom_province))%>%
  mutate(manuel = if_else( nomminusucle%in% df_liste_manuel$nomprovincemanuel_minuscule, "OK", "NOK"))%>%
  filter(manuel=="NOK")
x
#Ca semble OK mais il y a quelques nom qu'il faut vier pour obtenir une liste correct et chercher pour certaines provinces
#test de chaque base de donnée

aconquis%>%
  mutate(nomminusucle = str_to_lower(nom_province))%>%
  mutate(manuel = if_else( nomminusucle%in% df_liste_manuel$nomprovincemanuel_minuscule, "OK", "NOK"))%>%
  filter(manuel=="NOK")
#resultat 3


x<-aunnouveau%>%
  mutate(nomminusucle = str_to_lower(nom_province))%>%
  mutate(manuel = if_else( nomminusucle%in% df_liste_manuel$nomprovincemanuel_minuscule, "OK", "NOK"))%>%
  filter(manuel=="NOK")
#resultat 50

manqueressource%>%
  mutate(nomminusucle = str_to_lower(nom_province))%>%
  mutate(manuel = if_else( nomminusucle%in% df_liste_manuel$nomprovincemanuel_minuscule, "OK", "NOK"))%>%
  filter(manuel=="NOK")
#resultat 3



x<-unitedetruite%>%
  mutate(nomminusucle = str_to_lower(nom_province))%>%
  mutate(manuel = if_else( nomminusucle%in% df_liste_manuel$nomprovincemanuel_minuscule, "OK", "NOK"))%>%
  filter(manuel=="NOK")%>%
  filter(nom_province!="")

#resultat 48 mais trouve province en plus et les MER








#la liste est prete
DF_liste_provinces<-DF_liste_provinces%>%
  mutate(nom_province_majuscule = str_to_upper(nom_province))

DF_liste_provinces

### 3.4 Rajout de la liste des zeros conquis -----
df_listezeroconquismanuel<- read.csv(paste0(path,"Data_input_manuel/Manuel_zero_conquis.csv" ),header = TRUE, sep=",",encoding = "UTF-8", colClasses=c( 'character'))


if(config == "MAC_MAISON"){
  df_listezeroconquismanuel<-data.frame(df_listezeroconquismanuel)%>%rename(pays = Pays)
}else{
  df_listezeroconquismanuel<-data.frame(df_listezeroconquismanuel)%>%rename(pays = X.U.FEFF.Pays)
}


DF_liste_provinces<- DF_liste_provinces%>%mutate(province_zeroconquis = df_listezeroconquismanuel$pays [match(DF_liste_provinces$nom_province,df_listezeroconquismanuel$province )])

DF_liste_provinces%>%filter(is.na(province_zeroconquis))#Controle qu'aucune province n'est oublié
rm(df_listezeroconquismanuel)

### 3.5 Liste des mer -----
#x<- DATABASE_B%>%
#filter(numcarte == "5420045")%>%
#  filter(str_detect(article_body_text," mer ") |str_detect(article_body_text," Mer ") ) #on recherhche mer ou Mer
#x$article_body_text<-str_to_lower(x$article_body_text)
#x<-x%>%
#  mutate(col1_motmer = str_locate(article_body_text, " mer "))%>%#trouve le 1er " mer "
#  mutate(col2_txtapres_col1 = str_sub(article_body_text, start = (col1_motmer[,1])+1, end = -1L))%>% #Ecris le texte après le mot mer
#  mutate(col3_1erdeuxpoint_apres_col2 = str_locate(col2_txtapres_col1, " : "))%>%#trouve le 1er ":" après le mot mer
#  mutate(col4_txtapres2e2point = str_sub(col2_txtapres_col1, start = 1, end = col3_1erdeuxpoint_apres_col2[,1]-1)) #on prend le texte après le 2point

#DF_Liste_Mers<-x%>%rename(Mer = col4_txtapres2e2point)%>%group_by(Mer)%>%tally()%>%select(Mer)%>%filter(!is.na(Mer))
DF_Liste_Mers<-unitedetruite%>%
  mutate(nomminusucle = str_to_lower(nom_province))%>%
  mutate(manuel = if_else( nomminusucle%in% df_liste_manuel$nomprovincemanuel_minuscule, "OK", "NOK"))%>%
  filter(manuel=="NOK")%>%
  filter(nom_province!="")


#nettoyage
rm(aunnouveau, unitedetruite, aconquis, manqueressource, df_liste_manuel)

## 4. ANALYSE ----
gc()
### 4.1 DATABASE TONNES Evolution dans le temps du nombre de tonnes par pays ----
DATABASE_B%>%group_by(numcarte)%>%tally()
DATABASE_Btonnes<- DATABASE_B%>%
  #filter(numcarte == "5,827,679")%>% #Je travaille avec une version light pour éviter de surcharger la machine
  filter(str_detect(article_body_text," tonnes."))%>% #je prends les tonnes
  mutate(col1_1erdeuxpoints = str_locate(article_body_text, " : "))%>%#trouve le 1er ":"
  mutate(col2_txtapres1er2point = str_sub(article_body_text, start = (col1_1erdeuxpoints[,1])+2, end = -1L))%>% #Ecris le texte après le 1er double point
  mutate(col3_2edeuxpoints = str_locate(col2_txtapres1er2point, " : "))%>% #trouve le 2er ":"
  mutate(col4_txtapres2e2point = str_sub(col2_txtapres1er2point, start = (col3_2edeuxpoints[,1])+3, end = -1L))%>% #on prend le texte après le 2epoint
  mutate(col5_txt_pays_OK = str_sub(col2_txtapres1er2point, start = (1L)+1, end = col3_2edeuxpoints[,1]-1))%>%
  mutate(col6_espaceapres2e2points = str_locate(col4_txtapres2e2point, " "))%>%
  mutate(col7_tonnes = str_sub (col4_txtapres2e2point, start = (1L) , end = col6_espaceapres2e2points[,1]))%>%
  filter(!is.na(col7_tonnes))%>%
  mutate(col8_tonnes_sansvirgules = str_replace(col7_tonnes, ",",""))%>%
  mutate(col9_tonnes_OK= as.integer(col8_tonnes_sansvirgules))
DATABASE_Btonnes$jour<- as.integer(DATABASE_Btonnes$jour)
DATABASE_Btonnes$col5_txt_pays_OK<-str_to_title(DATABASE_Btonnes$col5_txt_pays_OK)

DATABASE_Btonnes$numcarte <- as.integer(DATABASE_Btonnes$numcarte)
DATABASE_Btonnes$numcarte <- as.character(DATABASE_Btonnes$numcarte)
DATABASE_Btonnes<-DATABASE_Btonnes%>%filter(!is.na(numcarte))

#GRAPHIQUE 1a : Evolution dans le temps du nombre de tonnes par pays et par carte
DATABASE_Btonnes%>%
  ggplot(aes(x= jour, y= col9_tonnes_OK, color = col5_txt_pays_OK))+
  geom_point()+
  geom_line()+ 
  theme(legend.position = "none")+ #pas de legende
  facet_wrap(~numcarte)+
  ggtitle("Evolution en tonnes des 100 cartes (partie 31 joueurs) par carte")+
  geom_vline(xintercept = 20,color = "blue")+
  geom_vline(xintercept = 40,color = "blue")+
  geom_vline(xintercept = 60,color = "blue")+
  geom_vline(xintercept = 80,color = "blue")

#etudes d'une seule carte
DATABASE_Btonnes%>%filter(numcarte == "5832799")%>%ggplot(aes(x= jour, y= col9_tonnes_OK, color = col5_txt_pays_OK))+geom_point()



#GRAPHIQUE 1b : Evolution dans le temps du nombre de tonnes par pays et par carte
#Les pires
DATABASE_Btonnes%>%
  filter(col5_txt_pays_OK == "Afrique Occidentale Française" |
           col5_txt_pays_OK == "Astrakhan" |
           col5_txt_pays_OK == "Bulgarie" |
           col5_txt_pays_OK == "Danemark" |
           col5_txt_pays_OK == "Serbie" |
           col5_txt_pays_OK == "Perm Krai" |
           col5_txt_pays_OK == "Sibérie Occidentale" |
           col5_txt_pays_OK == "Terre-Neuve" |
           col5_txt_pays_OK == "Portugal" |
           col5_txt_pays_OK == "Livonie" 
           )%>%
  ggplot(aes(x= jour, y= col9_tonnes_OK, color = numcarte))+
  geom_point(size = 3)+
  geom_line()+ 
  theme(legend.position = "none")+ #pas de legende
  facet_wrap(~col5_txt_pays_OK)+
  ylim(0, 800000)+
  ggtitle("Evolution production en tonnes par pays et par parties - les pires")

#Les challengers
DATABASE_Btonnes%>%
  filter(col5_txt_pays_OK == "Russie" |
           col5_txt_pays_OK == "Suède" |
           col5_txt_pays_OK == "Égypte" |
           col5_txt_pays_OK == "L'empire Ottoman" |
           col5_txt_pays_OK == "Algérie Orientale" |
           col5_txt_pays_OK == "Finlande" |
           col5_txt_pays_OK == "Libye Occidentale" |
           col5_txt_pays_OK == "Libye Orientale" 
  )%>%
  ggplot(aes(x= jour, y= col9_tonnes_OK, color = numcarte))+
  geom_point(size = 3)+
  geom_line()+ 
  theme(legend.position = "none")+ #pas de legende
  facet_wrap(~col5_txt_pays_OK)+
  ylim(0, 800000)+
  ggtitle("Evolution production en tonnes par pays et par parties - les challengers")


#Les leaders
DATABASE_Btonnes%>%
  filter(col5_txt_pays_OK == "États Unis Du Sud" |
           col5_txt_pays_OK == "Groenland" |
           col5_txt_pays_OK == "Russie Du Nord"
  )%>%
  ggplot(aes(x= jour, y= col9_tonnes_OK, color = numcarte))+
  geom_point(size = 3)+
  geom_line()+ 
  theme(legend.position = "none")+ #pas de legende
  facet_wrap(~col5_txt_pays_OK)+
  ylim(0, 800000)+
  ggtitle("Evolution production en tonnes par pays et par parties - les leaders")



  geom_vline(xintercept = 20,color = "blue")+
  geom_vline(xintercept = 40,color = "blue")+
  geom_vline(xintercept = 60,color = "blue")+
  geom_vline(xintercept = 80,color = "blue")

x<-DATABASE_Btonnes%>%group_by(col5_txt_pays_OK)%>%tally()

#GRAPHIQUE 2 : Les pays jamais cités dans le top tonnes
gc()
DATABASE_Btonnes%>%
  mutate(jour_20 = case_when(
    jour <=20 ~ "20",
    jour <=40 ~ "40",
    jour <=60 ~ "60",
    jour <=80 ~ "80",
    jour <=100 ~ "100"
  ))%>%
  #filter(col5_txt_pays_OK == "Maroc")%>%
  select(jour_20, numcarte, col5_txt_pays_OK)%>%
  ggplot(aes(x=jour_20, group= numcarte))+
  geom_bar()+
  facet_wrap(~col5_txt_pays_OK)+
  ggtitle("Nombre de fois ou un pays est cité dans le top tonnes par jour toute carte confondue")
#Ce graphique nous montre que certains pays ne sont jamais cité dans quasiment aucune partie et donc on peut de chance d'etre un challenger

#CARTE 3 = les pays qui dépasse les 40 jours dans le top tonnes


x<- DATABASE_Btonnes%>%
  mutate(jour_20 = case_when(
    jour <=20 ~ 20,
    jour <=40 ~ 40,
    jour <=60 ~ 60,
    jour <=80 ~ 80,
    jour <=100 ~ 100
  ))%>%
  filter(jour_20!=20)%>%
  filter(jour_20!=40)%>%
  filter(jour_20!=60)%>%
  #filter(col5_txt_pays_OK == "Maroc")%>%
  select(jour_20, numcarte, col5_txt_pays_OK)
nbrligne<- count(x%>%group_by(numcarte)%>%tally())

x%>%
  ggplot(aes(x=jour_20))+
  geom_bar()+
  facet_wrap(~col5_txt_pays_OK)+
  labs(subtitle ="Nombre de fois ou un pays est cité dans le top tonnes par jour après le jour 60 ", 
       caption =paste(nbrligne, "parties observés")  )


### 4.2 DATABASE MILITAIRE Evolution dans le temps de la puissance militaire ----
gc()
DATABASE_B%>%glimpse()
#DATABASE_Bpuissancesmilitaires

#on identifie tout les textes avec %
x<- DATABASE_B%>%filter(str_detect(article_body_text, "%"))%>%select(jour, article_body_text, numcarte)
#on filtre pour ne prendre que les pays
x<-x%>%mutate(richesseoumilitaire = case_when(
  str_detect(article_body_text,"Empereur")~"richesse",
  str_detect(article_body_text,"Gouverneur")~"richesse",
  str_detect(article_body_text,"Grand Duc")~"richesse",
  str_detect(article_body_text,"Hetman")~"richesse",
  str_detect(article_body_text,"Imam")~"richesse",
  str_detect(article_body_text,"Marzalek")~"richesse",
  str_detect(article_body_text,"Pape")~"richesse",
  str_detect(article_body_text,"Premier Ministre")~"richesse",
  str_detect(article_body_text,"Président")~"richesse",
  str_detect(article_body_text,"Roi")~"richesse",
  str_detect(article_body_text,"Sultan")~"richesse",
  str_detect(article_body_text,"Tsar")~"richesse",
  str_detect(article_body_text,"Vasilias")~"richesse",
  str_detect(article_body_text,"Vasilias")~"richesse",  
  TRUE~"militaire"
  
  
))

DF_richesse_pourcent<-x%>%filter(richesseoumilitaire == "richesse")
DF_militaire_pourcent<-x%>%filter(richesseoumilitaire == "militaire")


#on identifie la place de ":" et on la rajoute dans une colonne
z<- str_locate(DF_militaire_pourcent$article_body_text, ":")
DF_militaire_pourcent<-DF_militaire_pourcent%>% mutate(ledoublepoint = z[,1])

#on trouve le texte entre les deux paranthese et on le rajoute
DF_militaire_pourcent<-DF_militaire_pourcent%>%mutate(letexte = gsub('.*\\((.*)\\).*', '\\1', DF_militaire_pourcent$article_body_text))

#on trouve la 1ere et la deuxieme parantheses et on les rajoutes dans le dataframe 
paranthesestart <- str_locate(DF_militaire_pourcent$article_body_text, DF_militaire_pourcent$letexte)[,1]
parantheseend <- str_locate(DF_militaire_pourcent$article_body_text, DF_militaire_pourcent$letexte)[,2]
DF_militaire_pourcent<-DF_militaire_pourcent%>%mutate(paranthesestart = paranthesestart)%>%mutate(parantheseend = parantheseend)

#on rajoute le dataframe la phrase entre les : et la paranthese
DF_militaire_pourcent<- DF_militaire_pourcent%>%mutate(paysetnom = str_sub(DF_militaire_pourcent$article_body_text,start = DF_militaire_pourcent$ledoublepoint+2, end = DF_militaire_pourcent$paranthesestart-3))

#On transforme le texte en valeur
DF_militaire_pourcent$letexte<- as.integer(str_sub(DF_militaire_pourcent$letexte,start = 1, end = -2))

#on va isoler le nom du joueur
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Empereur ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Gouverneur ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Gouverneur Général ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Grand Duc ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Hetman ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Imam ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Marzalek ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Pape ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Premier Ministre ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Président ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Roi ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Sultan ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Tsar ", "")
DF_militaire_pourcent$paysetnom<- str_replace(DF_militaire_pourcent$paysetnom, "Vasilias ", "")

#On rend tout les noms utilisateurs en minuscule
DF_militaire_pourcent$paysetnom<-str_to_lower(DF_militaire_pourcent$paysetnom)

#On va comparer la liste avec le dataframe df_jour_pays

DF_militaire_pourcent<-DF_militaire_pourcent%>%mutate(pays_VF = DF_militaire_pourcent$paysetnom %in% DF_Liste_pays_carte31$pays_minuscule)

#On enleve les pays lignes qui ne sont pas des pays
DF_militaire_pourcent<-DF_militaire_pourcent%>%filter(pays_VF == TRUE)

#On rajoute une colonne qui met le nom en titre
DF_militaire_pourcent<-DF_militaire_pourcent%>%mutate(paysetnomcourt20 = str_to_title(paysetnom))

#ON change le nom de la variable texte en pourcentage militaire
DF_militaire_pourcent<- rename(DF_militaire_pourcent, "%_force militaire"="letexte" )

DF_militaire_pourcent$jour<- as.integer(DF_militaire_pourcent$jour)

nbrligne <- count(DF_militaire_pourcent%>%group_by(numcarte)%>%tally())

#Production du graphique
DF_militaire_pourcent%>%filter(pays_VF == TRUE)%>%
  ggplot(aes(x=jour, y = `%_force militaire`,  color = numcarte, group=paysetnomcourt20 ))+
  geom_point()+
  #geom_line() +
  facet_wrap(~paysetnomcourt20,ncol = 4)+
  theme(legend.position='none')+
  labs(subtitle ="Production militaire par pays pour toute les cartes", 
       caption =paste(nbrligne, "parties observés")  )


#Production du graphique2
DF_militaire_pourcent%>%filter(pays_VF == TRUE)%>%
  ggplot(aes(x=jour, y = `%_force militaire`,  color = paysetnomcourt20, group=numcarte ))+
  geom_point()+
  #geom_line() +
  facet_wrap(~numcarte)+
  theme(legend.position='none')+
  labs(subtitle ="Production militaire par pays par carte", 
       caption =paste(nbrligne, "parties observés")  )


### 4.3 DATABASE RICHESSE Evolution dans le temps de la richesse ----
gc()

DF_richesse_pourcent



#on identifie la place de ":" et on la rajoute dans une colonne
z<- str_locate(DF_richesse_pourcent$article_body_text, ":")
DF_richesse_pourcent<-DF_richesse_pourcent%>% mutate(ledoublepoint = z[,1])

#on trouve le texte entre les deux paranthese et on le rajoute
DF_richesse_pourcent<-DF_richesse_pourcent%>%mutate(letexte = gsub('.*\\((.*)\\).*', '\\1', DF_richesse_pourcent$article_body_text))

#on trouve la 1ere et la deuxieme parantheses et on les rajoutes dans le dataframe 
paranthesestart <- str_locate(DF_richesse_pourcent$article_body_text, DF_richesse_pourcent$letexte)[,1]
parantheseend <- str_locate(DF_richesse_pourcent$article_body_text, DF_richesse_pourcent$letexte)[,2]
DF_richesse_pourcent<-DF_richesse_pourcent%>%mutate(paranthesestart = paranthesestart)%>%mutate(parantheseend = parantheseend)

#on rajoute le dataframe la phrase entre les : et la paranthese
DF_richesse_pourcent<- DF_richesse_pourcent%>%mutate(nom = str_sub(DF_richesse_pourcent$article_body_text,start = DF_richesse_pourcent$ledoublepoint+2, end = DF_richesse_pourcent$paranthesestart-3))

#On transforme le texte en valeur
DF_richesse_pourcent$letexte<- as.integer(str_sub(DF_richesse_pourcent$letexte,start = 1, end = -2))

#on va isoler le nom du joueur
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Empereur ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Gouverneur ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Gouverneur Général ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Grand Duc ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Hetman ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Imam ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Marzalek ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Pape ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Premier Ministre ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Président ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Roi ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Sultan ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Tsar ", "")
DF_richesse_pourcent$nom<- str_replace(DF_richesse_pourcent$nom, "Vasilias ", "")

#On rend tout les noms utilisateurs en minuscule
DF_richesse_pourcent$nom<-str_to_lower(DF_richesse_pourcent$nom)

#On va comparer la liste avec le dataframe nom des joueurs pour identifier le pays

DF_richesse_pourcent<-DF_richesse_pourcent%>%mutate(pays_joueur = DF_Liste_joueurs_pays$paysjoueur_title[match(DF_richesse_pourcent$nom,DF_Liste_joueurs_pays$Nomjoueeur_little)]) 
DF_richesse_pourcent%>%group_by(pays_joueur)%>%tally()


#ON change le nom de la variable texte en pourcentage militaire
DF_richesse_pourcent<- rename(DF_richesse_pourcent, "%_force economique"="letexte" )

DF_richesse_pourcent$jour<- as.integer(DF_richesse_pourcent$jour)

nbrligne <- count(DF_richesse_pourcent%>%group_by(numcarte)%>%tally())

#Production du graphique
DF_richesse_pourcent%>%
  ggplot(aes(x=jour, y = `%_force economique`,  color = numcarte, group=pays_joueur ))+
  geom_point()+
  #geom_line() +
  facet_wrap(~pays_joueur,ncol = 4)+
  theme(legend.position='none')+
  labs(subtitle ="Richesse par pays pour toute les cartes", 
       caption =paste(nbrligne, "parties observés")  )
DF_richesse_pourcent%>%glimpse()

#Production du graphique2
DF_richesse_pourcent%>%
  ggplot(aes(x=jour, y = `%_force economique`,  color = pays_joueur, group=numcarte ))+
  geom_point()+
  #geom_line() +
  facet_wrap(~numcarte)+
  theme(legend.position='none')+
  labs(subtitle ="Production Richesse par pays par carte", 
       caption =paste(nbrligne, "parties observés")  )





### 4.4 Analyses des grosses armes ----
gc()
x<- DATABASE_B%>%filter(numcarte == "5420045")%>%select(jour, article_body_text)

#### Nombre de canons créé par des joueurs ---- 

DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(CANONRAIL1= str_detect(article_body_text,"a construit le nouveau Canon"))%>%
  filter(CANONRAIL1 == TRUE)%>%
  select(numcarte,article_body_text, jour)%>%
  arrange(jour)

#### Nombre de canons créé par l'ordinateur

DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(CANONRAIL2= str_detect(article_body_text,"produit de nouveaux Canon"))%>%
  filter(CANONRAIL2 == TRUE)%>%
  select(numcarte,article_body_text, jour)%>%
  arrange(jour)

#### Nombre de canons créé par l'ordinateur ou l'humain
DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(CANONRAIL1= str_detect(article_body_text,"a construit le nouveau Canon"))%>%
  mutate(CANONRAIL2= str_detect(article_body_text,"produit de nouveaux Canon"))%>%
  filter(CANONRAIL1 == TRUE | CANONRAIL2 == TRUE)%>%
  select(numcarte,article_body_text, jour)%>%
  arrange(jour)


#### Nombre de cuirassée créé par des joueurs ---- 

DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(CANONRAIL1= str_detect(article_body_text,"a construit le nouveau Cuirassé"))%>%
  filter(CANONRAIL1 == TRUE)%>%
  select(numcarte,article_body_text, jour)%>%
  arrange(jour)

#### Nombre de cuirassée créé par l'ordniateur  ---- 

DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(CANONRAIL2= str_detect(article_body_text,"produit de nouveaux Cuirassé"))%>%
  filter(CANONRAIL2 == TRUE)%>%
  select(numcarte,article_body_text, jour)%>%
  arrange(jour)

#### Nombre de cuirassée créé par l'ordniateur ou l'humain  ---- 
DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(CANONRAIL1= str_detect(article_body_text,"a construit le nouveau Cuirassé"))%>%
  mutate(CANONRAIL2= str_detect(article_body_text,"produit de nouveaux Cuirassé"))%>%
  filter(CANONRAIL1 == TRUE | CANONRAIL2 == TRUE)%>%
  select(numcarte,article_body_text, jour, CANONRAIL1, CANONRAIL2)%>%
  arrange(jour)

#### Graphique des armes par carte ----

x<- DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(CUIRASSEEH= str_detect(article_body_text,"a construit le nouveau Cuirassé"))%>%
  mutate(CUIRASSEEIA= str_detect(article_body_text,"produit de nouveaux Cuirassé"))%>%
  mutate(CANONRAILH= str_detect(article_body_text,"a construit le nouveau Canon"))%>%
  mutate(CANONRAILIA= str_detect(article_body_text,"produit de nouveaux Canon"))%>%
  mutate(jour_10 = case_when(
    jour <=10 ~ 10,
    jour <=20 ~ 20,
    jour <=30 ~ 30,
    jour <=40 ~ 40,
    jour <=50 ~ 50,
    jour <=60 ~ 60,
    jour <=70 ~ 70,
    jour <=80 ~ 80,
    jour <=90 ~ 90,
    jour <=100 ~ 100
  ))%>%
  group_by(numcarte, CUIRASSEEH, CUIRASSEEIA,CANONRAILH,CANONRAILIA,jour_10)%>%
  tally()%>%
  mutate(typegrossearme = case_when(
    CUIRASSEEH == TRUE ~ "1_Cuirassée",
    CUIRASSEEIA == TRUE ~ "1_Cuirassée",
    CANONRAILH == TRUE ~ "2_Canon sur rail",
    CANONRAILIA == TRUE ~"2_Canon sur rail"
  ))%>%
  mutate(typejoueur = case_when(
    CUIRASSEEH == TRUE ~ "humain",
    CUIRASSEEIA == TRUE ~ "ordinateur",
    CANONRAILH == TRUE ~ "humain",
    CANONRAILIA == TRUE ~"ordinateur"
  ))%>%
  filter(!is.na(typegrossearme))%>%
  select(numcarte, jour_10, n, typegrossearme, typejoueur)

nbrligne<- count(x%>%group_by(numcarte)%>%tally())

x%>%
  ggplot(aes(x= jour_10, y = numcarte,  size= n, color = typegrossearme))+
  geom_point()+
  labs(subtitle ="Nombre de grosses armes par parties", 
       caption =paste(nbrligne, "parties observés"))+
  facet_grid((typejoueur~typegrossearme))

#### Graphique des armes par pays ----

x<- DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(CUIRASSEEH= str_detect(article_body_text,"a construit le nouveau Cuirassé"))%>%
  mutate(CUIRASSEEIA= str_detect(article_body_text,"produit de nouveaux Cuirassé"))%>%
  mutate(CANONRAILH= str_detect(article_body_text,"a construit le nouveau Canon"))%>%
  mutate(CANONRAILIA= str_detect(article_body_text,"produit de nouveaux Canon"))%>%
  mutate(jour_10 = case_when(
    jour <=10 ~ 10,
    jour <=20 ~ 20,
    jour <=30 ~ 30,
    jour <=40 ~ 40,
    jour <=50 ~ 50,
    jour <=60 ~ 60,
    jour <=70 ~ 70,
    jour <=80 ~ 80,
    jour <=90 ~ 90,
    jour <=100 ~ 100
  ))%>%
  group_by(func_country_link, CUIRASSEEH, CUIRASSEEIA,CANONRAILH,CANONRAILIA,jour_10)%>%
  tally()%>%
  mutate(typegrossearme = case_when(
    CUIRASSEEH == TRUE ~ "1_Cuirassée",
    CUIRASSEEIA == TRUE ~ "1_Cuirassée",
    CANONRAILH == TRUE ~ "2_Canon sur rail",
    CANONRAILIA == TRUE ~"2_Canon sur rail"
  ))%>%
  mutate(typejoueur = case_when(
    CUIRASSEEH == TRUE ~ "humain",
    CUIRASSEEIA == TRUE ~ "ordinateur",
    CANONRAILH == TRUE ~ "humain",
    CANONRAILIA == TRUE ~"ordinateur"
  ))%>%
  filter(!is.na(typegrossearme))%>%
  select(func_country_link, jour_10, n, typegrossearme, typejoueur)

nbrligne<- count(x%>%group_by(func_country_link)%>%tally())

x%>%
  ggplot(aes(x= jour_10, y = func_country_link,  size= n, color = typegrossearme))+
  geom_point()+
  labs(subtitle ="Nombre de grosses armes par pays", 
       caption =paste(nbrligne, "parties observés"))+
  facet_grid((typejoueur~typegrossearme))
####Les noms des grosses armes  ----


w<-DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(CUIRASSEEH= str_detect(article_body_text,"a construit le nouveau Cuirassé"))%>%
  filter(CUIRASSEEH == TRUE)%>%
  select(numcarte, jour, article_body_text)

ww<-DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(CANONRAILH= str_detect(article_body_text,"a construit le nouveau Canon"))%>%
  filter(CANONRAILH == TRUE)%>%
  select(numcarte, jour, article_body_text)

w<- rbind(w,ww)

w<- w%>%
  mutate (prembareverticale = str_locate(w$article_body_text,"\"" )[,1])

w<- w%>%
  mutate(premierepartiemot = str_sub(article_body_text, start = prembareverticale+1))

w<- w%>%
  mutate(deuxbareverticale = str_locate(w$premierepartiemot,"\"" )[,1])

w<- w%>%
  mutate(nomgrandarme = str_sub(premierepartiemot, end =deuxbareverticale-1 ))

w<- w%>%select(nomgrandarme)
w$nomgrandarme<-str_to_upper(w$nomgrandarme)

DF_Liste_joueurs_pays

w<-w%>%mutate(typedenom = case_when(
  nomgrandarme %in% DF_Liste_joueurs_pays$Nomjoueeur_upper~"Nom joueur",
  nomgrandarme %in% DF_liste_provinces$nom_province_majuscule ~"Nom province",
  nomgrandarme %in% DF_Liste_pays_carte31$pays_majuscule~"Nom pays",
  TRUE ~ "Autre"))
x<- w%>%filter(typedenom =="Autre")#Liste nom "autre"
x
x<-w%>%group_by(typedenom)%>%tally() #calcul type de nom
x






### 4.5 Analyse du sabotage ----
gc()
#Il faudrait rajouter à ce tableau le total dez chaque jour avec sumarize
y<-DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(espion_general= str_detect(article_body_text,"espion en mission de"))%>%
  filter(espion_general == TRUE)%>%
  mutate(espion_type_3 = case_when(
    str_detect(article_body_text,"en mission de sabotage militaire") ~ "sabotage militaire",
    str_detect(article_body_text,"en mission de sabotage économique") ~ "sabotage economique",
    str_detect(article_body_text,"en mission de renseignement") ~ "renseignement",
  ))%>%
  select(numcarte,article_body_text,espion_type_3, jour)%>%
  arrange(jour)%>%group_by(numcarte, espion_type_3,jour)%>%tally()

#Graphique 1
y%>%ggplot(aes(x= jour, y = numcarte, group = numcarte, size = n, color =espion_type_3 ))+
  geom_point()+
  ggtitle("Nombre d'espions capturés par partie")+
  facet_grid(~espion_type_3)+ylab("parties")+theme(legend.position="none")


#graphique 2
y%>%ggplot(aes(x= jour, y = numcarte, group = numcarte, size = n, color =espion_type_3 ))+
  geom_point()+
  ggtitle("Nombre d'espions capturés par partie")



z<-y%>%summarise(sum=sum(n), groups=numcarte)
z<-cbind(z, y)
z$numcarte...1<- str_replace(z$numcarte...1, ",","")
z$numcarte...1<- str_replace(z$numcarte...1, "0,","0")
z$numcarte...1<- str_replace(z$numcarte...1, "1,","1")
z$numcarte...1<- str_replace(z$numcarte...1, "2,","2")
z$numcarte...1<- str_replace(z$numcarte...1, "3,","3")
z$numcarte...1<- str_replace(z$numcarte...1, "4,","4")
z$numcarte...1<- str_replace(z$numcarte...1, "5,","5")
z$numcarte...1<- str_replace(z$numcarte...1, "6,","6")
z$numcarte...1<- str_replace(z$numcarte...1, "7,","7")
z$numcarte...1<- str_replace(z$numcarte...1, "8,","8")
z$numcarte...1<- str_replace(z$numcarte...1, "9,","9")

z%>%
  arrange(sum)%>%
  ggplot(aes(y=reorder(`numcarte...1`,-sum), x=n, fill = espion_type_3...2))+
  geom_col()+ggtitle("nombre espion par carte")+
  geom_point(aes(y=numcarte...1, y=max))



zz<-y%>%summarise(max=max(jour), groups=numcarte)
zz<- zz%>%
  rename(numcartezz = numcarte)%>%
  rename(espion_type_3zz=espion_type_3)%>%
  rename(groupszz = groups)
z<-cbind(z, zz)
z%>%
  ggplot(aes(y=reorder(`numcarte...1`,-sum), x=n, fill = espion_type_3...2))+
  geom_col()+ggtitle("nombre espion par carte auquel il faudrait rajouter le nombre de jour étudié")+
  geom_point(aes(sizer=max))



reorder(day, -perc)


z%>%mutate(n = y$n)
ggplot(y=numcarte, x=)

w<- y%>%summarise(max = max(jour), groups = numcarte)


###4.6 Analyse des coup d'état ----
gc()
x<- DATABASE_B%>%filter(numcarte == "5420045")%>%select(jour, article_body_text)

DBCOUPETAT<- DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(coupetat= str_detect(article_body_text,"Jusqu'à son retour, sa nation sera administrée par ses ministres."))%>%
  filter(coupetat == TRUE)%>%
  mutate(premvirgule = str_locate(article_body_text, ","))%>%
  mutate(nom_joueur = str_sub(article_body_text, start = 1L, end =premvirgule[,1]-1 ))%>%
  mutate(txtapresvirgul = str_sub(article_body_text, start = premvirgule[,2]+1))%>%
  mutate(deuxvirgule = str_locate(txtapresvirgul, ","))%>%
  mutate(prem_de = str_locate(txtapresvirgul, "de"))%>%
  mutate(nom_pays = str_sub(txtapresvirgul, start = prem_de[,2]+1, end = deuxvirgule[,1]-1))%>%
  select(numcarte, jour, nom_joueur, nom_pays, article_body_text)


#Nombre de coup d'état toute partie confonfue
DBCOUPETAT%>%
  group_by(nom_joueur)%>%tally()%>%arrange(desc(n))

#Nombre de coup d'état max dans une partie
x<- DBCOUPETAT%>%
  group_by(nom_joueur, numcarte)%>%tally()%>%arrange(desc(n))
x<-summarise(group_by(x,numcarte), Max = max(n))
x%>%arrange(desc(Max))

DBCOUPETAT$jour <- as.integer(DBCOUPETAT$jour)
DBCOUPETAT%>%
  filter(numcarte == "5823756")%>%
  ggplot(aes(y=nom_joueur, x = jour, color = nom_joueur))+
  geom_point(size = 3)+geom_line()+ theme(legend.position="none")+facet_wrap(~numcarte)+
  ggtitle("coup d'état par joueur en fonction de la partie et du jour")

#Focus une carte avec 10 coup d'état pour un joueur
DBCOUPETAT%>%
  filter(numcarte == "5823756")%>%
  ggplot(aes(y=nom_joueur, x = jour, color = nom_joueur))+
  geom_point(size = 3)+geom_line()+ theme(legend.position="none")+
  ggtitle("partie avec un joueur qui a connu 10 coups d'états")



y<- DF_Liste_joueurs_pays%>%mutate(nometcarte= paste0(numcarte, Nomjoueeur_upper))
z<- DBCOUPETAT%>%group_by(numcarte, nom_joueur)%>%tally()
z$nom_joueur<-str_to_upper(z$nom_joueur)
z$nom_joueur<-str_replace(z$nom_joueur,"                        ","")
z<-z%>%mutate(nometcarte =  paste0(numcarte, nom_joueur))
y<-y%>%mutate(coupdetatvraifaux = y$nometcarte%in%z$nometcarte)
y<-y%>%mutate(nombrecoupetat = z$n[match(y$nometcarte, z$nometcarte)])
y$nombrecoupetat[is.na(y$nombrecoupetat)]<-0

#y est donc la base de donnée avec le nombre de coup détat par joueur et par partie avec la totalité des joueurs

#Graphique nombre de coup d'état sur base du nombre total de joueurs

yy<- y%>%group_by(numcarte, nombrecoupetat)%>%tally()

yy%>%
  #filter(numcarte== "4678346")%>%
  ggplot(aes(y= n, x =  nombrecoupetat))+
  geom_bar(width = 1, stat = "identity")+
  #coord_polar("y")+
  facet_wrap(~numcarte)+ylab("nombre de joueurs")%>%
  ggtitle("Nombre de coup d'état par joueurs et par partie")

write.csv2(yy, paste0(path, "temp.csv"), fileEncoding = "UTF-8")

#Recherche sur les membres qui reveinnent après leur denier coup d'état

#Identifier le dernier coup d'état
listederniercoupetat<- DBCOUPETAT%>%group_by(nom_joueur, numcarte, jour)%>%tally()%>%summarise(max(jour))

recherchesurvivant<- function(nomjoueurx, numcartex, jourx){
  
  x<- DATABASE_B%>%
    filter(jour > jourx)%>%
    filter(numcarte ==  numcartex)
  recherchesurvivant2<- function(nomjoueurx){
    x<-x%>%mutate(vraifaux= str_detect(nomjoueurx, article_body_text))
    summarise(vraifaux)
  }}

recherchesurvivant()
  
    
}


for (numcartex in listederniercoupetat$numcarte){
  print(numcartex)
}

  
## Analyse des conquetes -----
gc()
DBCONQUETE<- DATABASE_B%>%
  #filter(numcarte == "5420045")%>%
  mutate(conquete= str_detect(article_body_text,"a conquis"))%>%
  filter(conquete == TRUE)%>%
  mutate(prem_aconquis = str_locate(article_body_text, "a conquis"))%>%
  mutate(txtapresconquis = str_sub(article_body_text, start = prem_aconquis[,2]+1))%>%
  mutate(nom_province = str_sub(txtapresconquis, start = 2, end = -2L))%>%
  select(numcarte, jour, nom_province, article_body_text)%>%
  mutate(NOMPROV_MAJ = str_to_upper(nom_province))%>%
  filter(NOMPROV_MAJ%in%DF_liste_provinces$nom_province_majuscule)


#Nombre de coup d'état toute partie confonfue
DBCONQUETE%>%
  group_by(nom_province)%>%tally()%>%arrange(desc(n))
DBCONQUETE%>%
  group_by(nom_province)%>%tally()%>%arrange(n)

#Nombre de conquete max d'une province dans une partie
x<- DBCONQUETE%>%
  group_by(nom_province, numcarte)%>%tally()%>%arrange(desc(n))
x
top1villeconquise<-x[1,]
top2villeconquise<- x[2,]
top3villeconquise<-x[3,]

x<-summarise(group_by(x,numcarte), Max = max(n))
x%>%arrange(desc(Max))
x
#Histoire de la ville la plus conquis top 1
DBCONQUETE%>%
  filter(nom_province== as.character(top1villeconquise[,1]))%>%
  filter(numcarte== as.character(top1villeconquise[,2]))%>%
  arrange(jour)

#Histoire de la ville la plus conquis top 2

DBCONQUETE%>%
  filter(nom_province== as.character(top2villeconquise[,1]))%>%
  filter(numcarte== as.character(top2villeconquise[,2]))%>%
  arrange(jour)

#Histoire de la ville la plus conquis top 3

DBCONQUETE%>%
  filter(nom_province== as.character(top3villeconquise[,1]))%>%
  filter(numcarte== as.character(top3villeconquise[,2]))%>%
  arrange(jour)


## Analyse des joueurs

#Nombre de joueur différent et nombre de carte où ils jouent
x<- DF_Liste_joueurs_pays%>%group_by(Nomjoueeur_little, numcarte)%>%tally()%>%group_by(Nomjoueeur_little)%>%tally()
x<- x%>%arrange(desc(n))%>%filter(!is.na(Nomjoueeur_little))
x%>%group_by(n)%>%tally()%>%rename(nombredecarte = n)%>%rename(nombredejoueur = nn)%>%
  ggplot(aes(x=nombredecarte, y = nombredejoueur))+geom_point()
x%>%group_by(n)%>%tally()%>%rename(nombredecarte = n)%>%rename(nombredejoueur = nn)












### 4.6 Analyse des pertes de guerres ----

#### 4.6.1 construire le programme ----


listecarte<- DATABASE_B%>%group_by(numcarte)%>%tally()%>%filter(numcarte !="")%>%pull(numcarte)

#### on fait tourner la formule une fois pour créer le cadre de sauvegarde ----
numcartexx<- listecarte[1]

x<- DATABASE_B%>%filter(numcarte == numcartexx )%>%select(jour, article_body_text, numcarte)
x$jour<-as.integer(x$jour)
f<- as.integer(count(x))
orderf<- 1:f
data.frame(orderf)
x<- cbind(x, orderf)


x<- x%>%
  mutate_at(.funs = list(prec = lag),
            .vars = vars(article_body_text, article_body_text))%>% #créé une colonne décalé de 1 ligne plus bas
  mutate_at(.funs = list(prec2 = lag),
            .vars = vars(prec, prec))

x<-x%>%filter(str_detect(prec2, "Pertes depuis le début de cette guerre :")|
                str_detect(prec, "Pertes depuis le début de cette guerre :")|
                str_detect(article_body_text, "Pertes depuis le début de cette guerre :"))

x<- x%>%
  mutate_at(.funs = list(prec3 = lag),
            .vars = vars(article_body_text, article_body_text))%>% #créé une colonne décalé de 1 ligne plus bas
  mutate_at(.funs = list(prec4 = lag),
            .vars = vars(prec3, prec3))

x<- x%>%select(numcarte, jour, article_body_text, prec3,prec4, orderf)


#attention il manque une ligne perte depuis le debut de la guerre, 
#on modifie la derniere ligne tout en bas du groupe constitué par la carte, 
#on ne peut pas appliquerà un data frame de plusieurs cartes, il faut faire rbind
#cette formule tel quel pour une DATAFRAME de plusieurs cartes

#on déplace les valeurs de la derniere ligne dans un nouvel ordre
y<-as.integer(unlist(count(x))) #nombre de ligne du dataframe

a<- x[y,1]
b<- x[y,2]
c<- x[y,3]
d<- x[y,4]
e<- x[y,5]

x[y,1]<- a
x[y,2]<- b
x[y,3]<- e
x[y,4]<- c
x[y,5]<- d


x<- x%>%filter(str_detect(article_body_text, "Pertes depuis le début de cette guerre :"))

x<-x%>%filter(!is.na(prec3))

x<- x%>%mutate(col1_placetirer_pays1 = str_locate(prec3, " - ") )%>%
  mutate(col1_placetirer_pays2 = str_locate(prec4, " - ") )%>%
  mutate(pays1_nom = str_sub(prec3, end = col1_placetirer_pays1[,1]-1))%>%
  mutate(pays2_nom = str_sub(prec4, end = col1_placetirer_pays2[,1]-1))%>%
  mutate(pays1_chiffre = str_sub(prec3, start = col1_placetirer_pays1[,2]+1))%>%
  mutate(pays2_chiffre = str_sub(prec4, start = col1_placetirer_pays2[,2]+1))%>%
  filter(!is.na(pays1_nom))%>%
  filter(!is.na(pays2_nom))%>%
  filter(!is.na(pays1_chiffre))%>%
  filter(!is.na(pays2_chiffre))

#On transforme les chiffres en chiffres
#entrainement
w<-c("UKRAINE - 1 Mio.", "UKRAINE - 1.03 Mio.","RUSSIE DU NORD - 1.5 Mio.")

str_detect(w, "- [:digit:](?=[:blank:]) Mio.") #trouveles 1 Mio.
str_detect(w, ".[:digit:]{2} Mio.") #trouveles 1.03 Mio.
str_detect(w, "[:digit:].[:digit:]{1} Mio.") #trouveles 1.5 Mio.

#Realisation
#Remplace le 1 Mio
x<-x%>%
  mutate(pays1_chiffre_COL1 =
           str_detect (prec3,"Mio.")&
           str_detect(prec3, "- [:digit:](?=[:blank:]) Mio."))%>%
  mutate(pays1_chiffre_COL2 = case_when(
    pays1_chiffre_COL1==TRUE~str_replace(pays1_chiffre,"Mio.", "000000")
  ))%>%
  mutate(pays2_chiffre_COL1 =
           str_detect (prec4,"Mio.")&
           str_detect(prec4, "- [:digit:](?=[:blank:]) Mio."))%>%
  mutate(pays2_chiffre_COL2 = case_when(
    pays2_chiffre_COL1==TRUE~str_replace(pays2_chiffre,"Mio.", "000000")
  ))
#remplace 1.03 Mio.
x<-x%>%
  mutate(pays1_chiffre_COL3 =
           str_detect (prec3,"Mio.")&
           is.na(pays1_chiffre_COL2)&
           str_detect(prec3, ".[:digit:]{2} Mio."))%>%
  mutate(pays1_chiffre_COL4 = case_when(
    pays1_chiffre_COL3==TRUE~str_replace(pays1_chiffre,"Mio.", "0000")
  ))%>%
  mutate(pays2_chiffre_COL3 =
           str_detect (prec4,"Mio.")&
           is.na(pays2_chiffre_COL2)&
           str_detect(prec4, ".[:digit:]{2} Mio."))%>%
  mutate(pays2_chiffre_COL4 = case_when(
    pays2_chiffre_COL3==TRUE~str_replace(pays2_chiffre,"Mio.", "0000")
  ))

#remplace 1.5 Mio.
x<-x%>%
  mutate(pays1_chiffre_COL5 =
           str_detect (prec3,"Mio.")&
           is.na(pays1_chiffre_COL2)&
           is.na(pays1_chiffre_COL4)&           
           str_detect(prec3, "[:digit:].[:digit:]{1} Mio."))%>%
  mutate(pays1_chiffre_COL6 = case_when(
    pays1_chiffre_COL5==TRUE~str_replace(pays1_chiffre,"Mio.", "00000")
  ))%>%
  mutate(pays2_chiffre_COL5 =
           str_detect (prec4,"Mio.")&
           is.na(pays2_chiffre_COL2)&
           is.na(pays2_chiffre_COL4)&
           str_detect(prec4, "[:digit:].[:digit:]{1} Mio."))%>%
  mutate(pays2_chiffre_COL6 = case_when(
    pays2_chiffre_COL5==TRUE~str_replace(pays2_chiffre,"Mio.", "00000")
  ))


#regroupement et rangement
x<-x%>%mutate(pays1_chiffre_MIO = paste0(pays1_chiffre_COL2,pays1_chiffre_COL4,pays1_chiffre_COL6))
x$pays1_chiffre_MIO<-str_replace(x$pays1_chiffre_MIO,"NA","")
x$pays1_chiffre_MIO<-str_replace(x$pays1_chiffre_MIO,"NA","")
x$pays1_chiffre_MIO<-str_replace(x$pays1_chiffre_MIO,"NA","")

x<-x%>%mutate(pays2_chiffre_MIO = paste0(pays2_chiffre_COL2,pays2_chiffre_COL4,pays2_chiffre_COL6))
x$pays2_chiffre_MIO<-str_replace(x$pays2_chiffre_MIO,"NA","")
x$pays2_chiffre_MIO<-str_replace(x$pays2_chiffre_MIO,"NA","")
x$pays2_chiffre_MIO<-str_replace(x$pays2_chiffre_MIO,"NA","")

x$pays1_chiffre<-case_when(
  x$pays1_chiffre_MIO !=""~x$pays1_chiffre_MIO,
  x$pays1_chiffre_MIO ==""~x$pays1_chiffre)

x$pays2_chiffre<-case_when(
  x$pays2_chiffre_MIO !=""~x$pays2_chiffre_MIO,
  x$pays2_chiffre_MIO ==""~x$pays2_chiffre)

x<-x%>%select(-pays1_chiffre_COL1, -pays1_chiffre_COL2, -pays1_chiffre_COL3, -pays1_chiffre_COL4, -pays1_chiffre_COL5, -pays1_chiffre_COL6, -pays1_chiffre_MIO)
x<-x%>%select(-pays2_chiffre_COL1, -pays2_chiffre_COL2, -pays2_chiffre_COL3, -pays2_chiffre_COL4, -pays2_chiffre_COL5, -pays2_chiffre_COL6, -pays2_chiffre_MIO)

x$pays1_chiffre<-str_replace_all(x$pays1_chiffre,",","")
x$pays1_chiffre<-str_replace_all(x$pays1_chiffre,",","")
x$pays1_chiffre<-str_replace_all(x$pays1_chiffre," ","")
x$pays1_chiffre<-str_replace_all(x$pays1_chiffre,"\\.","")
x$pays1_chiffre<-str_replace(x$pays1_chiffre,"\xa0","") #espace inséquable viré
x$pays1_chiffre<-str_replace(x$pays1_chiffre,"[^ -~]+","") #tout les caracteres non ansi viré
x$pays1_chiffre<-str_replace_all(x$pays1_chiffre,"aucun","0")
x$pays1_chiffre<-as.integer(x$pays1_chiffre)


x$pays2_chiffre<-str_replace_all(x$pays2_chiffre,",","")
x$pays2_chiffre<-str_replace_all(x$pays2_chiffre," ","")
x$pays2_chiffre<-str_replace_all(x$pays2_chiffre,"\\.","")
x$pay21_chiffre<-str_replace(x$pays2_chiffre,"\xa0","") #espace inséquable viré
x$pays2_chiffre<-str_replace(x$pays2_chiffre,"[^ -~]+","") #tout les caracteres non ansi viré
x$pays2_chiffre<-str_replace_all(x$pays2_chiffre,"aucun","0")
x$pays2_chiffre<-as.integer(x$pays2_chiffre)

gc()

#Identifie la guerre en classant les pays par ordre alphabétique

y<- count(x)
y<- as.integer(y)
j<- seq(1, y, by=1)


for (i in j){
  if(x[i,9] > x[i,10]){
    a<- x[i,9]
    b<- x[i,10]
    c<- x[i,11]
    d<- x[i,12]
    
    x[i,9]<-b
    x[i,10]<-a
    x[i,11]<-d
    x[i,11]<-c
  }
  
}

#Maintenant la base de données les pays sont classé par ordre alphabtique de gauche à droite

x<-x%>%mutate(nomguerre = paste0("guerre ", pays1_nom," - ", pays2_nom ))

#####Je dois encore classer les guerre par jour et si cela diminue, cela devient la guerre 2
liste_guerre<- x%>%group_by(nomguerre)%>%tally()%>%pull(nomguerre)

#nomguerrex <- "guerre SYRIE - UKRAINE"

xb<-x[1,]
xb[1,1]<-""
xb[1,2]<-""
xb[1,3]<-""
xb[1,4]<-""
xb[1,5]<-""
xb[1,6]<-0
xb[1,9]<-""
xb[1,10]<-""
xb[1,11]<-0
xb[1,12]<-0
xb[1,13]<-""
#bug quand on a une seule valeur
nbrguerrefun <- function (nomguerrex){
  #nomguerrex <- "guerre ALGÉRIE OCCIDENTALE - UKRAINE"
  xa<- x%>%filter(nomguerre == nomguerrex)%>%arrange(jour, pays1_chiffre, pays2_chiffre)
  sxa<- as.integer(count(xa))
  if(sxa==1){listesxa <- 1}else {listesxa <- 2:sxa}
  
  nbrguerre<-1
  xa$nomguerre[1]<-paste(xa$nomguerre[1],nbrguerre)
  #Probleme dans la formule, l'ordre ne se fait pas bien pour le nombre de guere, l'info doit sortir de la boucle
  for (u in listesxa){
    print(u)
    print(xa$nomguerre[u])
    #u<-1
    if(sxa!=1){
      if(xa$pays1_chiffre[u-1] > xa$pays1_chiffre[u] |xa$pays2_chiffre[u-1]>xa$pays2_chiffre[u])
      {nbrguerre<-nbrguerre+1
      xa$nomguerre[u]<-paste(xa$nomguerre[u],"#",nbrguerre)
      }
      else{xa$nomguerre[u]<-paste(xa$nomguerre[u],"#",nbrguerre)
      }
    }else{xa$nomguerre[1]<-paste(xa$nomguerre[1],"#",nbrguerre)}
    
  }
  #xb<-rbind(xa,xb )
  return(xa)
}

xc<-xc[1,]
xc[1,1]<-""
xc[1,2]<-""
xc[1,3]<-""
xc[1,4]<-""
xc[1,5]<-""
xc[1,6]<-0
xc[1,9]<-""
xc[1,10]<-""
xc[1,11]<-0
xc[1,12]<-0
xc[1,13]<-""

xd<-xc
for(z in liste_guerre){
  xc<-nbrguerrefun(z)
  xd<-rbind(xd,xc)
  xc<-xc[1,]
  xc[1,1]<-""
  xc[1,2]<-""
  xc[1,3]<-""
  xc[1,4]<-""
  xc[1,5]<-""
  xc[1,6]<-0
  xc[1,9]<-""
  xc[1,10]<-""
  xc[1,11]<-0
  xc[1,12]<-0
  xc[1,13]<-""
}
#### On fait tourner la formule pour toute les listes ----

#on crée une base de données vides

xe<-xd[1,]
xe[1,1]<-""
xe[1,2]<-""
xe[1,3]<-""
xe[1,4]<-""
xe[1,5]<-""
xe[1,6]<-0
xe[1,9]<-""
xe[1,10]<-""
xe[1,11]<-0
xe[1,12]<-0
xe[1,13]<-""

#on a la formule qui classe tout les guerres d'une carte
calculguerre1carte<- function(numcartexx){
  
  x<- DATABASE_B%>%filter(numcarte == numcartexx )%>%select(jour, article_body_text, numcarte)
  x$jour<-as.integer(x$jour)
  f<- as.integer(count(x))
  orderf<- 1:f
  data.frame(orderf)
  x<- cbind(x, orderf)
  
  
  x<- x%>%
    mutate_at(.funs = list(prec = lag),
              .vars = vars(article_body_text, article_body_text))%>% #créé une colonne décalé de 1 ligne plus bas
    mutate_at(.funs = list(prec2 = lag),
              .vars = vars(prec, prec))
  
  x<-x%>%filter(str_detect(prec2, "Pertes depuis le début de cette guerre :")|
                  str_detect(prec, "Pertes depuis le début de cette guerre :")|
                  str_detect(article_body_text, "Pertes depuis le début de cette guerre :"))
  
  x<- x%>%
    mutate_at(.funs = list(prec3 = lag),
              .vars = vars(article_body_text, article_body_text))%>% #créé une colonne décalé de 1 ligne plus bas
    mutate_at(.funs = list(prec4 = lag),
              .vars = vars(prec3, prec3))
  
  x<- x%>%select(numcarte, jour, article_body_text, prec3,prec4, orderf)
  
  
  #attention il manque une ligne perte depuis le debut de la guerre, 
  #on modifie la derniere ligne tout en bas du groupe constitué par la carte, 
  #on ne peut pas appliquerà un data frame de plusieurs cartes, il faut faire rbind
  #cette formule tel quel pour une DATAFRAME de plusieurs cartes
  
  #on déplace les valeurs de la derniere ligne dans un nouvel ordre
  y<-as.integer(unlist(count(x))) #nombre de ligne du dataframe
  
  a<- x[y,1]
  b<- x[y,2]
  c<- x[y,3]
  d<- x[y,4]
  e<- x[y,5]
  
  x[y,1]<- a
  x[y,2]<- b
  x[y,3]<- e
  x[y,4]<- c
  x[y,5]<- d
  
  
  x<- x%>%filter(str_detect(article_body_text, "Pertes depuis le début de cette guerre :"))
  
  x<-x%>%filter(!is.na(prec3))
  
  x<- x%>%mutate(col1_placetirer_pays1 = str_locate(prec3, " - ") )%>%
    mutate(col1_placetirer_pays2 = str_locate(prec4, " - ") )%>%
    mutate(pays1_nom = str_sub(prec3, end = col1_placetirer_pays1[,1]-1))%>%
    mutate(pays2_nom = str_sub(prec4, end = col1_placetirer_pays2[,1]-1))%>%
    mutate(pays1_chiffre = str_sub(prec3, start = col1_placetirer_pays1[,2]+1))%>%
    mutate(pays2_chiffre = str_sub(prec4, start = col1_placetirer_pays2[,2]+1))%>%
    filter(!is.na(pays1_nom))%>%
    filter(!is.na(pays2_nom))%>%
    filter(!is.na(pays1_chiffre))%>%
    filter(!is.na(pays2_chiffre))
  
  #On transforme les chiffres en chiffres
  #entrainement
  w<-c("UKRAINE - 1 Mio.", "UKRAINE - 1.03 Mio.","RUSSIE DU NORD - 1.5 Mio.")
  
  str_detect(w, "- [:digit:](?=[:blank:]) Mio.") #trouveles 1 Mio.
  str_detect(w, ".[:digit:]{2} Mio.") #trouveles 1.03 Mio.
  str_detect(w, "[:digit:].[:digit:]{1} Mio.") #trouveles 1.5 Mio.
  
  #Realisation
  #Remplace le 1 Mio
  x<-x%>%
    mutate(pays1_chiffre_COL1 =
             str_detect (prec3,"Mio.")&
             str_detect(prec3, "- [:digit:](?=[:blank:]) Mio."))%>%
    mutate(pays1_chiffre_COL2 = case_when(
      pays1_chiffre_COL1==TRUE~str_replace(pays1_chiffre,"Mio.", "000000")
    ))%>%
    mutate(pays2_chiffre_COL1 =
             str_detect (prec4,"Mio.")&
             str_detect(prec4, "- [:digit:](?=[:blank:]) Mio."))%>%
    mutate(pays2_chiffre_COL2 = case_when(
      pays2_chiffre_COL1==TRUE~str_replace(pays2_chiffre,"Mio.", "000000")
    ))
  #remplace 1.03 Mio.
  x<-x%>%
    mutate(pays1_chiffre_COL3 =
             str_detect (prec3,"Mio.")&
             is.na(pays1_chiffre_COL2)&
             str_detect(prec3, ".[:digit:]{2} Mio."))%>%
    mutate(pays1_chiffre_COL4 = case_when(
      pays1_chiffre_COL3==TRUE~str_replace(pays1_chiffre,"Mio.", "0000")
    ))%>%
    mutate(pays2_chiffre_COL3 =
             str_detect (prec4,"Mio.")&
             is.na(pays2_chiffre_COL2)&
             str_detect(prec4, ".[:digit:]{2} Mio."))%>%
    mutate(pays2_chiffre_COL4 = case_when(
      pays2_chiffre_COL3==TRUE~str_replace(pays2_chiffre,"Mio.", "0000")
    ))
  
  #remplace 1.5 Mio.
  x<-x%>%
    mutate(pays1_chiffre_COL5 =
             str_detect (prec3,"Mio.")&
             is.na(pays1_chiffre_COL2)&
             is.na(pays1_chiffre_COL4)&           
             str_detect(prec3, "[:digit:].[:digit:]{1} Mio."))%>%
    mutate(pays1_chiffre_COL6 = case_when(
      pays1_chiffre_COL5==TRUE~str_replace(pays1_chiffre,"Mio.", "00000")
    ))%>%
    mutate(pays2_chiffre_COL5 =
             str_detect (prec4,"Mio.")&
             is.na(pays2_chiffre_COL2)&
             is.na(pays2_chiffre_COL4)&
             str_detect(prec4, "[:digit:].[:digit:]{1} Mio."))%>%
    mutate(pays2_chiffre_COL6 = case_when(
      pays2_chiffre_COL5==TRUE~str_replace(pays2_chiffre,"Mio.", "00000")
    ))
  
  
  #regroupement et rangement
  x<-x%>%mutate(pays1_chiffre_MIO = paste0(pays1_chiffre_COL2,pays1_chiffre_COL4,pays1_chiffre_COL6))
  x$pays1_chiffre_MIO<-str_replace(x$pays1_chiffre_MIO,"NA","")
  x$pays1_chiffre_MIO<-str_replace(x$pays1_chiffre_MIO,"NA","")
  x$pays1_chiffre_MIO<-str_replace(x$pays1_chiffre_MIO,"NA","")
  
  x<-x%>%mutate(pays2_chiffre_MIO = paste0(pays2_chiffre_COL2,pays2_chiffre_COL4,pays2_chiffre_COL6))
  x$pays2_chiffre_MIO<-str_replace(x$pays2_chiffre_MIO,"NA","")
  x$pays2_chiffre_MIO<-str_replace(x$pays2_chiffre_MIO,"NA","")
  x$pays2_chiffre_MIO<-str_replace(x$pays2_chiffre_MIO,"NA","")
  
  x$pays1_chiffre<-case_when(
    x$pays1_chiffre_MIO !=""~x$pays1_chiffre_MIO,
    x$pays1_chiffre_MIO ==""~x$pays1_chiffre)
  
  x$pays2_chiffre<-case_when(
    x$pays2_chiffre_MIO !=""~x$pays2_chiffre_MIO,
    x$pays2_chiffre_MIO ==""~x$pays2_chiffre)
  
  x<-x%>%select(-pays1_chiffre_COL1, -pays1_chiffre_COL2, -pays1_chiffre_COL3, -pays1_chiffre_COL4, -pays1_chiffre_COL5, -pays1_chiffre_COL6, -pays1_chiffre_MIO)
  x<-x%>%select(-pays2_chiffre_COL1, -pays2_chiffre_COL2, -pays2_chiffre_COL3, -pays2_chiffre_COL4, -pays2_chiffre_COL5, -pays2_chiffre_COL6, -pays2_chiffre_MIO)
  
  x$pays1_chiffre<-str_replace_all(x$pays1_chiffre,",","")
  x$pays1_chiffre<-str_replace_all(x$pays1_chiffre," ","")
  x$pays1_chiffre<-str_replace_all(x$pays1_chiffre,"\\.","")
  x$pays1_chiffre<-str_replace(x$pays1_chiffre,"\xa0","") #espace inséquable viré
  x$pays1_chiffre<-str_replace(x$pays1_chiffre,"[^ -~]+","") #tout les caracteres non ansi viré
  x$pays1_chiffre<-str_replace_all(x$pays1_chiffre,"aucun","0")
  x$pays1_chiffre<-as.integer(x$pays1_chiffre)
  
  
  x$pays2_chiffre<-str_replace_all(x$pays2_chiffre,",","")
  x$pays2_chiffre<-str_replace_all(x$pays2_chiffre," ","")
  x$pays2_chiffre<-str_replace_all(x$pays2_chiffre,"\\.","")
  x$pay21_chiffre<-str_replace(x$pays2_chiffre,"\xa0","") #espace inséquable viré
  x$pays2_chiffre<-str_replace(x$pays2_chiffre,"[^ -~]+","") #tout les caracteres non ansi viré
  x$pays2_chiffre<-str_replace_all(x$pays2_chiffre,"aucun","0")
  x$pays2_chiffre<-as.integer(x$pays2_chiffre)
  
  gc()
  gc()
  
  
  #Identifie la guerre en classant les pays par ordre alphabétique
  
  y<- count(x)
  y<- as.integer(y)
  j<- seq(1, y, by=1)
  
  
  for (i in j){
    if(x[i,9] > x[i,10]){
      a<- x[i,9]
      b<- x[i,10]
      c<- x[i,11]
      d<- x[i,12]
      
      x[i,9]<-b
      x[i,10]<-a
      x[i,11]<-d
      x[i,11]<-c
    }
    
  }
  
  #Maintenant la base de données les pays sont classé par ordre alphabtique de gauche à droite
  
  x<-x%>%mutate(nomguerre = paste0("guerre ", pays1_nom," - ", pays2_nom ))
  
  #####Je dois encore classer les guerre par jour et si cela diminue, cela devient la guerre 2
  liste_guerre<- x%>%group_by(nomguerre)%>%tally()%>%pull(nomguerre)
  
  #nomguerrex <- "guerre SYRIE - UKRAINE"
  
  xb<-x[1,]
  xb[1,1]<-""
  xb[1,2]<-""
  xb[1,3]<-""
  xb[1,4]<-""
  xb[1,5]<-""
  xb[1,6]<-0
  xb[1,9]<-""
  xb[1,10]<-""
  xb[1,11]<-0
  xb[1,12]<-0
  xb[1,13]<-""
  #bug quand on a une seule valeur
  nbrguerrefun <- function (nomguerrex){
    #nomguerrex <- "guerre ALGÉRIE OCCIDENTALE - UKRAINE"
    xa<- x%>%filter(nomguerre == nomguerrex)%>%arrange(jour, pays1_chiffre, pays2_chiffre)
    sxa<- as.integer(count(xa))
    if(sxa==1){listesxa <- 1}else {listesxa <- 2:sxa}
    
    nbrguerre<-1
    xa$nomguerre[1]<-paste(xa$nomguerre[1],nbrguerre)
    #Probleme dans la formule, l'ordre ne se fait pas bien pour le nombre de guere, l'info doit sortir de la boucle
    for (u in listesxa){
      print(u)
      print(xa$nomguerre[u])
      #u<-1
      if(sxa!=1){
        if(xa$pays1_chiffre[u-1] > xa$pays1_chiffre[u] |xa$pays2_chiffre[u-1]>xa$pays2_chiffre[u])
        {nbrguerre<-nbrguerre+1
        xa$nomguerre[u]<-paste(xa$nomguerre[u],"#",nbrguerre)
        }
        else{xa$nomguerre[u]<-paste(xa$nomguerre[u],"#",nbrguerre)
        }
      }else{xa$nomguerre[1]<-paste(xa$nomguerre[1],"#",nbrguerre)}
      
    }
    #xb<-rbind(xa,xb )
    return(xa)
  }
  
  xc<-xc[1,]
  xc[1,1]<-""
  xc[1,2]<-""
  xc[1,3]<-""
  xc[1,4]<-""
  xc[1,5]<-""
  xc[1,6]<-0
  xc[1,9]<-""
  xc[1,10]<-""
  xc[1,11]<-0
  xc[1,12]<-0
  xc[1,13]<-""
  
  xd<-xc
  for(z in liste_guerre){
    xc<-nbrguerrefun(z)
    xd<-rbind(xd,xc)
    xc<-xc[1,]
    xc[1,1]<-""
    xc[1,2]<-""
    xc[1,3]<-""
    xc[1,4]<-""
    xc[1,5]<-""
    xc[1,6]<-0
    xc[1,9]<-""
    xc[1,10]<-""
    xc[1,11]<-0
    xc[1,12]<-0
    xc[1,13]<-""
  }
  return(xd)
}

#On créé une base de données vides et on fait tourner un for 
#PROBLEME certaines données font planter la formule 
xe<-xd[1,]
xe[1,1]<-""
xe[1,2]<-""
xe[1,3]<-""
xe[1,4]<-""
xe[1,5]<-""
xe[1,6]<-0
xe[1,9]<-""
xe[1,10]<-""
xe[1,11]<-0
xe[1,12]<-0
xe[1,13]<-""

xf<-xe
for(z in listecarte){
  xe<-calculguerre1carte(z)
  xf<-rbind(xf,xe)
  xe<-xe[1,]
  xe[1,1]<-""
  xe[1,2]<-""
  xe[1,3]<-""
  xe[1,4]<-""
  xe[1,5]<-""
  xe[1,6]<-0
  xe[1,9]<-""
  xe[1,10]<-""
  xe[1,11]<-0
  xe[1,12]<-0
  xe[1,13]<-""
}


DB_GUERRESETPERTES <-xf%>%select(-article_body_text,-orderf, -col1_placetirer_pays1, -col1_placetirer_pays2, -pay21_chiffre)
DB_GUERRESETPERTES
#### 4.6.2 DATA BASE PRETES ----

#les guerres avec le plus de morts guerre consecutives
DB_GUERRESETPERTES%>%
  mutate(total = pays1_chiffre+pays2_chiffre)%>%
  arrange (desc(total))
#les guerres avec le plus de morts sans guerre consecutives 
#pas OK car on ne calcul les conflit que d'une seule guerre

DB_GUERRESETPERTES%>%
  mutate(total = pays1_chiffre+pays2_chiffre)%>%
  arrange (desc(total))%>%
  mutate(guerreunique = paste0(numcarte, pays1_nom, pays2_nom))%>%
  mutate(doublon = duplicated(guerreunique))%>%
  filter(doublon== FALSE)%>%
  arrange (desc(total))

#les guerres avec le plus de conflit consecutifs
DB_GUERRESETPERTES%>%
  mutate(idetifielecarre = str_locate(nomguerre, "#"))%>%
  mutate(nombresousconflit = str_sub(nomguerre, start =idetifielecarre[,1]+1))%>%
  mutate(nombresousconflitchiffre = as.integer(nombresousconflit))%>%
  arrange (desc(nombresousconflitchiffre))

DB_GUERRESETPERTES%>%
  filter(numcarte == "5833027")%>%
  filter(pays1_nom == "L'Empire Allemand")%>%
  filter(pays2_nom== "Suède")%>%
  arrange(jour)%>%select(jour, pays1_chiffre, pays2_chiffre, nomguerre)

#Le ratio de perte le plus fort
DB_GUERRESETPERTES%>%
  mutate(pays1chiffreplus1 = pays1_chiffre+1)%>%
  mutate(pays2chiffreplus1 = pays2_chiffre+1)%>%
  mutate(taux = pays1chiffreplus1/pays2chiffreplus1)%>%arrange(desc(taux))

#Le ratio de perte le plus fort hors -10000
DB_GUERRESETPERTES%>%
  filter(pays1_chiffre>10000)%>%
  filter(pays2_chiffre>10000)%>%
  mutate(taux = pays1_chiffre/pays2_chiffre)%>%
  arrange(desc(taux))


#Faire une carte DB guerre mais ou l'on aditionne les guerres entre deux pays dans une meme partie et on aditionne les conflit



## 5. CODE POUR FAIRE UNE CARTE DYNAMIQUE-----
gc()
gc()
### 5.1 Importer la carte depuis GDRIVE ----

###MAP pour prendre la cartes de GOOGLE DRIVE 250*250 carte 31 + provinces +mer

## Importation des données téléchargé depuis drive 
if(config == "MAC_MAISON"){
  path<- "/Users/holly/Downloads/"
  file<- "CARTE_250_250_couleurs_NOK.xlsx"
  Carte_province<-read_excel(paste0(path,file ), sheet = "2_PROVINCE_NOM")
  
}else{
  path <- "C:/Users/u99amo/Downloads/"
  file<- "CARTE_250_250_couleurs_NOK.csv"
  Carte_province<- read.csv(paste0(path,file ),header = TRUE, sep=",",encoding = "UTF-8", colClasses=c( 'character'))
  
}



Carte_province<- data.frame(Carte_province)
nbrligne<- count(Carte_province)

Carte_province%>%glimpse()

ligne <- seq.int(nbrligne[1,1], 1)

dfligne<- data.frame(ligne)

## Mise en place de la carte en version 2 dimension 
if(config == "MAC_MAISON"){
  df1<-data.frame(Carte_province$COL1)
  df1<-df1%>%mutate(colonne = "1")
  df1<-df1%>%rename(data = Carte_province.COL1)%>%mutate(ligne = dfligne)
}else{
  
  df1<-data.frame(Carte_province$X.U.FEFF.COL1)
  df1<-df1%>%mutate(colonne = "1")
  df1<-df1%>%rename(data = Carte_province.X.U.FEFF.COL1)%>%mutate(ligne = dfligne)
}



df2<-data.frame(Carte_province$COL2)
df2<-df2%>%mutate(colonne = "2")
df2<-df2%>%rename(data = Carte_province.COL2)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(df1,df2)
rm(df1,df2)

df3<-data.frame(Carte_province$COL3)
df3<-df3%>%mutate(colonne = '3')
df3<-df3%>%rename(data = Carte_province.COL3)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df3)
rm(df3)
df4<-data.frame(Carte_province$COL4)
df4<-df4%>%mutate(colonne = '4')
df4<-df4%>%rename(data = Carte_province.COL4)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df4)
rm(df4)
df5<-data.frame(Carte_province$COL5)
df5<-df5%>%mutate(colonne = '5')
df5<-df5%>%rename(data = Carte_province.COL5)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df5)
rm(df5)
df6<-data.frame(Carte_province$COL6)
df6<-df6%>%mutate(colonne = '6')
df6<-df6%>%rename(data = Carte_province.COL6)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df6)
rm(df6)
df7<-data.frame(Carte_province$COL7)
df7<-df7%>%mutate(colonne = '7')
df7<-df7%>%rename(data = Carte_province.COL7)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df7)
rm(df7)
df8<-data.frame(Carte_province$COL8)
df8<-df8%>%mutate(colonne = '8')
df8<-df8%>%rename(data = Carte_province.COL8)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df8)
rm(df8)
df9<-data.frame(Carte_province$COL9)
df9<-df9%>%mutate(colonne = '9')
df9<-df9%>%rename(data = Carte_province.COL9)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df9)
rm(df9)
df10<-data.frame(Carte_province$COL10)
df10<-df10%>%mutate(colonne = '10')
df10<-df10%>%rename(data = Carte_province.COL10)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df10)
rm(df10)
df11<-data.frame(Carte_province$COL11)
df11<-df11%>%mutate(colonne = '11')
df11<-df11%>%rename(data = Carte_province.COL11)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df11)
rm(df11)
df12<-data.frame(Carte_province$COL12)
df12<-df12%>%mutate(colonne = '12')
df12<-df12%>%rename(data = Carte_province.COL12)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df12)
rm(df12)
df13<-data.frame(Carte_province$COL13)
df13<-df13%>%mutate(colonne = '13')
df13<-df13%>%rename(data = Carte_province.COL13)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df13)
rm(df13)
df14<-data.frame(Carte_province$COL14)
df14<-df14%>%mutate(colonne = '14')
df14<-df14%>%rename(data = Carte_province.COL14)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df14)
rm(df14)
df15<-data.frame(Carte_province$COL15)
df15<-df15%>%mutate(colonne = '15')
df15<-df15%>%rename(data = Carte_province.COL15)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df15)
rm(df15)
df16<-data.frame(Carte_province$COL16)
df16<-df16%>%mutate(colonne = '16')
df16<-df16%>%rename(data = Carte_province.COL16)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df16)
rm(df16)
df17<-data.frame(Carte_province$COL17)
df17<-df17%>%mutate(colonne = '17')
df17<-df17%>%rename(data = Carte_province.COL17)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df17)
rm(df17)
df18<-data.frame(Carte_province$COL18)
df18<-df18%>%mutate(colonne = '18')
df18<-df18%>%rename(data = Carte_province.COL18)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df18)
rm(df18)
df19<-data.frame(Carte_province$COL19)
df19<-df19%>%mutate(colonne = '19')
df19<-df19%>%rename(data = Carte_province.COL19)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df19)
rm(df19)
df20<-data.frame(Carte_province$COL20)
df20<-df20%>%mutate(colonne = '20')
df20<-df20%>%rename(data = Carte_province.COL20)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df20)
rm(df20)
df21<-data.frame(Carte_province$COL21)
df21<-df21%>%mutate(colonne = '21')
df21<-df21%>%rename(data = Carte_province.COL21)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df21)
rm(df21)
df22<-data.frame(Carte_province$COL22)
df22<-df22%>%mutate(colonne = '22')
df22<-df22%>%rename(data = Carte_province.COL22)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df22)
rm(df22)
df23<-data.frame(Carte_province$COL23)
df23<-df23%>%mutate(colonne = '23')
df23<-df23%>%rename(data = Carte_province.COL23)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df23)
rm(df23)
df24<-data.frame(Carte_province$COL24)
df24<-df24%>%mutate(colonne = '24')
df24<-df24%>%rename(data = Carte_province.COL24)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df24)
rm(df24)
df25<-data.frame(Carte_province$COL25)
df25<-df25%>%mutate(colonne = '25')
df25<-df25%>%rename(data = Carte_province.COL25)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df25)
rm(df25)
df26<-data.frame(Carte_province$COL26)
df26<-df26%>%mutate(colonne = '26')
df26<-df26%>%rename(data = Carte_province.COL26)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df26)
rm(df26)
df27<-data.frame(Carte_province$COL27)
df27<-df27%>%mutate(colonne = '27')
df27<-df27%>%rename(data = Carte_province.COL27)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df27)
rm(df27)
df28<-data.frame(Carte_province$COL28)
df28<-df28%>%mutate(colonne = '28')
df28<-df28%>%rename(data = Carte_province.COL28)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df28)
rm(df28)
df29<-data.frame(Carte_province$COL29)
df29<-df29%>%mutate(colonne = '29')
df29<-df29%>%rename(data = Carte_province.COL29)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df29)
rm(df29)
df30<-data.frame(Carte_province$COL30)
df30<-df30%>%mutate(colonne = '30')
df30<-df30%>%rename(data = Carte_province.COL30)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df30)
rm(df30)
df31<-data.frame(Carte_province$COL31)
df31<-df31%>%mutate(colonne = '31')
df31<-df31%>%rename(data = Carte_province.COL31)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df31)
rm(df31)
df32<-data.frame(Carte_province$COL32)
df32<-df32%>%mutate(colonne = '32')
df32<-df32%>%rename(data = Carte_province.COL32)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df32)
rm(df32)
df33<-data.frame(Carte_province$COL33)
df33<-df33%>%mutate(colonne = '33')
df33<-df33%>%rename(data = Carte_province.COL33)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df33)
rm(df33)
df34<-data.frame(Carte_province$COL34)
df34<-df34%>%mutate(colonne = '34')
df34<-df34%>%rename(data = Carte_province.COL34)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df34)
rm(df34)
df35<-data.frame(Carte_province$COL35)
df35<-df35%>%mutate(colonne = '35')
df35<-df35%>%rename(data = Carte_province.COL35)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df35)
rm(df35)
df36<-data.frame(Carte_province$COL36)
df36<-df36%>%mutate(colonne = '36')
df36<-df36%>%rename(data = Carte_province.COL36)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df36)
rm(df36)
df37<-data.frame(Carte_province$COL37)
df37<-df37%>%mutate(colonne = '37')
df37<-df37%>%rename(data = Carte_province.COL37)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df37)
rm(df37)
df38<-data.frame(Carte_province$COL38)
df38<-df38%>%mutate(colonne = '38')
df38<-df38%>%rename(data = Carte_province.COL38)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df38)
rm(df38)
df39<-data.frame(Carte_province$COL39)
df39<-df39%>%mutate(colonne = '39')
df39<-df39%>%rename(data = Carte_province.COL39)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df39)
rm(df39)
df40<-data.frame(Carte_province$COL40)
df40<-df40%>%mutate(colonne = '40')
df40<-df40%>%rename(data = Carte_province.COL40)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df40)
rm(df40)
df41<-data.frame(Carte_province$COL41)
df41<-df41%>%mutate(colonne = '41')
df41<-df41%>%rename(data = Carte_province.COL41)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df41)
rm(df41)
df42<-data.frame(Carte_province$COL42)
df42<-df42%>%mutate(colonne = '42')
df42<-df42%>%rename(data = Carte_province.COL42)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df42)
rm(df42)
df43<-data.frame(Carte_province$COL43)
df43<-df43%>%mutate(colonne = '43')
df43<-df43%>%rename(data = Carte_province.COL43)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df43)
rm(df43)
df44<-data.frame(Carte_province$COL44)
df44<-df44%>%mutate(colonne = '44')
df44<-df44%>%rename(data = Carte_province.COL44)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df44)
rm(df44)
df45<-data.frame(Carte_province$COL45)
df45<-df45%>%mutate(colonne = '45')
df45<-df45%>%rename(data = Carte_province.COL45)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df45)
rm(df45)
df46<-data.frame(Carte_province$COL46)
df46<-df46%>%mutate(colonne = '46')
df46<-df46%>%rename(data = Carte_province.COL46)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df46)
rm(df46)
df47<-data.frame(Carte_province$COL47)
df47<-df47%>%mutate(colonne = '47')
df47<-df47%>%rename(data = Carte_province.COL47)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df47)
rm(df47)
df48<-data.frame(Carte_province$COL48)
df48<-df48%>%mutate(colonne = '48')
df48<-df48%>%rename(data = Carte_province.COL48)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df48)
rm(df48)
df49<-data.frame(Carte_province$COL49)
df49<-df49%>%mutate(colonne = '49')
df49<-df49%>%rename(data = Carte_province.COL49)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df49)
rm(df49)
df50<-data.frame(Carte_province$COL50)
df50<-df50%>%mutate(colonne = '50')
df50<-df50%>%rename(data = Carte_province.COL50)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df50)
rm(df50)
df51<-data.frame(Carte_province$COL51)
df51<-df51%>%mutate(colonne = '51')
df51<-df51%>%rename(data = Carte_province.COL51)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df51)
rm(df51)
df52<-data.frame(Carte_province$COL52)
df52<-df52%>%mutate(colonne = '52')
df52<-df52%>%rename(data = Carte_province.COL52)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df52)
rm(df52)
df53<-data.frame(Carte_province$COL53)
df53<-df53%>%mutate(colonne = '53')
df53<-df53%>%rename(data = Carte_province.COL53)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df53)
rm(df53)
df54<-data.frame(Carte_province$COL54)
df54<-df54%>%mutate(colonne = '54')
df54<-df54%>%rename(data = Carte_province.COL54)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df54)
rm(df54)
df55<-data.frame(Carte_province$COL55)
df55<-df55%>%mutate(colonne = '55')
df55<-df55%>%rename(data = Carte_province.COL55)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df55)
rm(df55)
df56<-data.frame(Carte_province$COL56)
df56<-df56%>%mutate(colonne = '56')
df56<-df56%>%rename(data = Carte_province.COL56)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df56)
rm(df56)
df57<-data.frame(Carte_province$COL57)
df57<-df57%>%mutate(colonne = '57')
df57<-df57%>%rename(data = Carte_province.COL57)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df57)
rm(df57)
df58<-data.frame(Carte_province$COL58)
df58<-df58%>%mutate(colonne = '58')
df58<-df58%>%rename(data = Carte_province.COL58)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df58)
rm(df58)
df59<-data.frame(Carte_province$COL59)
df59<-df59%>%mutate(colonne = '59')
df59<-df59%>%rename(data = Carte_province.COL59)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df59)
rm(df59)
df60<-data.frame(Carte_province$COL60)
df60<-df60%>%mutate(colonne = '60')
df60<-df60%>%rename(data = Carte_province.COL60)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df60)
rm(df60)
df61<-data.frame(Carte_province$COL61)
df61<-df61%>%mutate(colonne = '61')
df61<-df61%>%rename(data = Carte_province.COL61)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df61)
rm(df61)
df62<-data.frame(Carte_province$COL62)
df62<-df62%>%mutate(colonne = '62')
df62<-df62%>%rename(data = Carte_province.COL62)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df62)
rm(df62)
df63<-data.frame(Carte_province$COL63)
df63<-df63%>%mutate(colonne = '63')
df63<-df63%>%rename(data = Carte_province.COL63)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df63)
rm(df63)
df64<-data.frame(Carte_province$COL64)
df64<-df64%>%mutate(colonne = '64')
df64<-df64%>%rename(data = Carte_province.COL64)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df64)
rm(df64)
df65<-data.frame(Carte_province$COL65)
df65<-df65%>%mutate(colonne = '65')
df65<-df65%>%rename(data = Carte_province.COL65)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df65)
rm(df65)
df66<-data.frame(Carte_province$COL66)
df66<-df66%>%mutate(colonne = '66')
df66<-df66%>%rename(data = Carte_province.COL66)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df66)
rm(df66)
df67<-data.frame(Carte_province$COL67)
df67<-df67%>%mutate(colonne = '67')
df67<-df67%>%rename(data = Carte_province.COL67)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df67)
rm(df67)
df68<-data.frame(Carte_province$COL68)
df68<-df68%>%mutate(colonne = '68')
df68<-df68%>%rename(data = Carte_province.COL68)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df68)
rm(df68)
df69<-data.frame(Carte_province$COL69)
df69<-df69%>%mutate(colonne = '69')
df69<-df69%>%rename(data = Carte_province.COL69)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df69)
rm(df69)
df70<-data.frame(Carte_province$COL70)
df70<-df70%>%mutate(colonne = '70')
df70<-df70%>%rename(data = Carte_province.COL70)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df70)
rm(df70)
df71<-data.frame(Carte_province$COL71)
df71<-df71%>%mutate(colonne = '71')
df71<-df71%>%rename(data = Carte_province.COL71)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df71)
rm(df71)
df72<-data.frame(Carte_province$COL72)
df72<-df72%>%mutate(colonne = '72')
df72<-df72%>%rename(data = Carte_province.COL72)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df72)
rm(df72)
df73<-data.frame(Carte_province$COL73)
df73<-df73%>%mutate(colonne = '73')
df73<-df73%>%rename(data = Carte_province.COL73)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df73)
rm(df73)
df74<-data.frame(Carte_province$COL74)
df74<-df74%>%mutate(colonne = '74')
df74<-df74%>%rename(data = Carte_province.COL74)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df74)
rm(df74)
df75<-data.frame(Carte_province$COL75)
df75<-df75%>%mutate(colonne = '75')
df75<-df75%>%rename(data = Carte_province.COL75)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df75)
rm(df75)
df76<-data.frame(Carte_province$COL76)
df76<-df76%>%mutate(colonne = '76')
df76<-df76%>%rename(data = Carte_province.COL76)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df76)
rm(df76)
df77<-data.frame(Carte_province$COL77)
df77<-df77%>%mutate(colonne = '77')
df77<-df77%>%rename(data = Carte_province.COL77)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df77)
rm(df77)
df78<-data.frame(Carte_province$COL78)
df78<-df78%>%mutate(colonne = '78')
df78<-df78%>%rename(data = Carte_province.COL78)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df78)
rm(df78)
df79<-data.frame(Carte_province$COL79)
df79<-df79%>%mutate(colonne = '79')
df79<-df79%>%rename(data = Carte_province.COL79)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df79)
rm(df79)
df80<-data.frame(Carte_province$COL80)
df80<-df80%>%mutate(colonne = '80')
df80<-df80%>%rename(data = Carte_province.COL80)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df80)
rm(df80)
df81<-data.frame(Carte_province$COL81)
df81<-df81%>%mutate(colonne = '81')
df81<-df81%>%rename(data = Carte_province.COL81)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df81)
rm(df81)
df82<-data.frame(Carte_province$COL82)
df82<-df82%>%mutate(colonne = '82')
df82<-df82%>%rename(data = Carte_province.COL82)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df82)
rm(df82)
df83<-data.frame(Carte_province$COL83)
df83<-df83%>%mutate(colonne = '83')
df83<-df83%>%rename(data = Carte_province.COL83)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df83)
rm(df83)
df84<-data.frame(Carte_province$COL84)
df84<-df84%>%mutate(colonne = '84')
df84<-df84%>%rename(data = Carte_province.COL84)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df84)
rm(df84)
df85<-data.frame(Carte_province$COL85)
df85<-df85%>%mutate(colonne = '85')
df85<-df85%>%rename(data = Carte_province.COL85)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df85)
rm(df85)
df86<-data.frame(Carte_province$COL86)
df86<-df86%>%mutate(colonne = '86')
df86<-df86%>%rename(data = Carte_province.COL86)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df86)
rm(df86)
df87<-data.frame(Carte_province$COL87)
df87<-df87%>%mutate(colonne = '87')
df87<-df87%>%rename(data = Carte_province.COL87)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df87)
rm(df87)
df88<-data.frame(Carte_province$COL88)
df88<-df88%>%mutate(colonne = '88')
df88<-df88%>%rename(data = Carte_province.COL88)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df88)
rm(df88)
df89<-data.frame(Carte_province$COL89)
df89<-df89%>%mutate(colonne = '89')
df89<-df89%>%rename(data = Carte_province.COL89)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df89)
rm(df89)
df90<-data.frame(Carte_province$COL90)
df90<-df90%>%mutate(colonne = '90')
df90<-df90%>%rename(data = Carte_province.COL90)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df90)
rm(df90)
df91<-data.frame(Carte_province$COL91)
df91<-df91%>%mutate(colonne = '91')
df91<-df91%>%rename(data = Carte_province.COL91)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df91)
rm(df91)
df92<-data.frame(Carte_province$COL92)
df92<-df92%>%mutate(colonne = '92')
df92<-df92%>%rename(data = Carte_province.COL92)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df92)
rm(df92)
df93<-data.frame(Carte_province$COL93)
df93<-df93%>%mutate(colonne = '93')
df93<-df93%>%rename(data = Carte_province.COL93)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df93)
rm(df93)
df94<-data.frame(Carte_province$COL94)
df94<-df94%>%mutate(colonne = '94')
df94<-df94%>%rename(data = Carte_province.COL94)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df94)
rm(df94)
df95<-data.frame(Carte_province$COL95)
df95<-df95%>%mutate(colonne = '95')
df95<-df95%>%rename(data = Carte_province.COL95)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df95)
rm(df95)
df96<-data.frame(Carte_province$COL96)
df96<-df96%>%mutate(colonne = '96')
df96<-df96%>%rename(data = Carte_province.COL96)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df96)
rm(df96)
df97<-data.frame(Carte_province$COL97)
df97<-df97%>%mutate(colonne = '97')
df97<-df97%>%rename(data = Carte_province.COL97)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df97)
rm(df97)
df98<-data.frame(Carte_province$COL98)
df98<-df98%>%mutate(colonne = '98')
df98<-df98%>%rename(data = Carte_province.COL98)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df98)
rm(df98)
df99<-data.frame(Carte_province$COL99)
df99<-df99%>%mutate(colonne = '99')
df99<-df99%>%rename(data = Carte_province.COL99)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df99)
rm(df99)
df100<-data.frame(Carte_province$COL100)
df100<-df100%>%mutate(colonne = '100')
df100<-df100%>%rename(data = Carte_province.COL100)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df100)
rm(df100)
df101<-data.frame(Carte_province$COL101)
df101<-df101%>%mutate(colonne = '101')
df101<-df101%>%rename(data = Carte_province.COL101)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df101)
rm(df101)
df102<-data.frame(Carte_province$COL102)
df102<-df102%>%mutate(colonne = '102')
df102<-df102%>%rename(data = Carte_province.COL102)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df102)
rm(df102)
df103<-data.frame(Carte_province$COL103)
df103<-df103%>%mutate(colonne = '103')
df103<-df103%>%rename(data = Carte_province.COL103)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df103)
rm(df103)
df104<-data.frame(Carte_province$COL104)
df104<-df104%>%mutate(colonne = '104')
df104<-df104%>%rename(data = Carte_province.COL104)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df104)
rm(df104)
df105<-data.frame(Carte_province$COL105)
df105<-df105%>%mutate(colonne = '105')
df105<-df105%>%rename(data = Carte_province.COL105)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df105)
rm(df105)
df106<-data.frame(Carte_province$COL106)
df106<-df106%>%mutate(colonne = '106')
df106<-df106%>%rename(data = Carte_province.COL106)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df106)
rm(df106)
df107<-data.frame(Carte_province$COL107)
df107<-df107%>%mutate(colonne = '107')
df107<-df107%>%rename(data = Carte_province.COL107)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df107)
rm(df107)
df108<-data.frame(Carte_province$COL108)
df108<-df108%>%mutate(colonne = '108')
df108<-df108%>%rename(data = Carte_province.COL108)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df108)
rm(df108)
df109<-data.frame(Carte_province$COL109)
df109<-df109%>%mutate(colonne = '109')
df109<-df109%>%rename(data = Carte_province.COL109)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df109)
rm(df109)
df110<-data.frame(Carte_province$COL110)
df110<-df110%>%mutate(colonne = '110')
df110<-df110%>%rename(data = Carte_province.COL110)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df110)
rm(df110)
df111<-data.frame(Carte_province$COL111)
df111<-df111%>%mutate(colonne = '111')
df111<-df111%>%rename(data = Carte_province.COL111)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df111)
rm(df111)
df112<-data.frame(Carte_province$COL112)
df112<-df112%>%mutate(colonne = '112')
df112<-df112%>%rename(data = Carte_province.COL112)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df112)
rm(df112)
df113<-data.frame(Carte_province$COL113)
df113<-df113%>%mutate(colonne = '113')
df113<-df113%>%rename(data = Carte_province.COL113)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df113)
rm(df113)
df114<-data.frame(Carte_province$COL114)
df114<-df114%>%mutate(colonne = '114')
df114<-df114%>%rename(data = Carte_province.COL114)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df114)
rm(df114)
df115<-data.frame(Carte_province$COL115)
df115<-df115%>%mutate(colonne = '115')
df115<-df115%>%rename(data = Carte_province.COL115)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df115)
rm(df115)
df116<-data.frame(Carte_province$COL116)
df116<-df116%>%mutate(colonne = '116')
df116<-df116%>%rename(data = Carte_province.COL116)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df116)
rm(df116)
df117<-data.frame(Carte_province$COL117)
df117<-df117%>%mutate(colonne = '117')
df117<-df117%>%rename(data = Carte_province.COL117)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df117)
rm(df117)
df118<-data.frame(Carte_province$COL118)
df118<-df118%>%mutate(colonne = '118')
df118<-df118%>%rename(data = Carte_province.COL118)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df118)
rm(df118)
df119<-data.frame(Carte_province$COL119)
df119<-df119%>%mutate(colonne = '119')
df119<-df119%>%rename(data = Carte_province.COL119)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df119)
rm(df119)
df120<-data.frame(Carte_province$COL120)
df120<-df120%>%mutate(colonne = '120')
df120<-df120%>%rename(data = Carte_province.COL120)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df120)
rm(df120)
df121<-data.frame(Carte_province$COL121)
df121<-df121%>%mutate(colonne = '121')
df121<-df121%>%rename(data = Carte_province.COL121)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df121)
rm(df121)
df122<-data.frame(Carte_province$COL122)
df122<-df122%>%mutate(colonne = '122')
df122<-df122%>%rename(data = Carte_province.COL122)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df122)
rm(df122)
df123<-data.frame(Carte_province$COL123)
df123<-df123%>%mutate(colonne = '123')
df123<-df123%>%rename(data = Carte_province.COL123)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df123)
rm(df123)
df124<-data.frame(Carte_province$COL124)
df124<-df124%>%mutate(colonne = '124')
df124<-df124%>%rename(data = Carte_province.COL124)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df124)
rm(df124)
df125<-data.frame(Carte_province$COL125)
df125<-df125%>%mutate(colonne = '125')
df125<-df125%>%rename(data = Carte_province.COL125)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df125)
rm(df125)
df126<-data.frame(Carte_province$COL126)
df126<-df126%>%mutate(colonne = '126')
df126<-df126%>%rename(data = Carte_province.COL126)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df126)
rm(df126)
df127<-data.frame(Carte_province$COL127)
df127<-df127%>%mutate(colonne = '127')
df127<-df127%>%rename(data = Carte_province.COL127)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df127)
rm(df127)
df128<-data.frame(Carte_province$COL128)
df128<-df128%>%mutate(colonne = '128')
df128<-df128%>%rename(data = Carte_province.COL128)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df128)
rm(df128)
df129<-data.frame(Carte_province$COL129)
df129<-df129%>%mutate(colonne = '129')
df129<-df129%>%rename(data = Carte_province.COL129)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df129)
rm(df129)
df130<-data.frame(Carte_province$COL130)
df130<-df130%>%mutate(colonne = '130')
df130<-df130%>%rename(data = Carte_province.COL130)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df130)
rm(df130)
df131<-data.frame(Carte_province$COL131)
df131<-df131%>%mutate(colonne = '131')
df131<-df131%>%rename(data = Carte_province.COL131)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df131)
rm(df131)
df132<-data.frame(Carte_province$COL132)
df132<-df132%>%mutate(colonne = '132')
df132<-df132%>%rename(data = Carte_province.COL132)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df132)
rm(df132)
df133<-data.frame(Carte_province$COL133)
df133<-df133%>%mutate(colonne = '133')
df133<-df133%>%rename(data = Carte_province.COL133)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df133)
rm(df133)
df134<-data.frame(Carte_province$COL134)
df134<-df134%>%mutate(colonne = '134')
df134<-df134%>%rename(data = Carte_province.COL134)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df134)
rm(df134)
df135<-data.frame(Carte_province$COL135)
df135<-df135%>%mutate(colonne = '135')
df135<-df135%>%rename(data = Carte_province.COL135)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df135)
rm(df135)
df136<-data.frame(Carte_province$COL136)
df136<-df136%>%mutate(colonne = '136')
df136<-df136%>%rename(data = Carte_province.COL136)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df136)
rm(df136)
df137<-data.frame(Carte_province$COL137)
df137<-df137%>%mutate(colonne = '137')
df137<-df137%>%rename(data = Carte_province.COL137)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df137)
rm(df137)
df138<-data.frame(Carte_province$COL138)
df138<-df138%>%mutate(colonne = '138')
df138<-df138%>%rename(data = Carte_province.COL138)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df138)
rm(df138)
df139<-data.frame(Carte_province$COL139)
df139<-df139%>%mutate(colonne = '139')
df139<-df139%>%rename(data = Carte_province.COL139)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df139)
rm(df139)
df140<-data.frame(Carte_province$COL140)
df140<-df140%>%mutate(colonne = '140')
df140<-df140%>%rename(data = Carte_province.COL140)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df140)
rm(df140)
df141<-data.frame(Carte_province$COL141)
df141<-df141%>%mutate(colonne = '141')
df141<-df141%>%rename(data = Carte_province.COL141)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df141)
rm(df141)
df142<-data.frame(Carte_province$COL142)
df142<-df142%>%mutate(colonne = '142')
df142<-df142%>%rename(data = Carte_province.COL142)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df142)
rm(df142)
df143<-data.frame(Carte_province$COL143)
df143<-df143%>%mutate(colonne = '143')
df143<-df143%>%rename(data = Carte_province.COL143)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df143)
rm(df143)
df144<-data.frame(Carte_province$COL144)
df144<-df144%>%mutate(colonne = '144')
df144<-df144%>%rename(data = Carte_province.COL144)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df144)
rm(df144)
df145<-data.frame(Carte_province$COL145)
df145<-df145%>%mutate(colonne = '145')
df145<-df145%>%rename(data = Carte_province.COL145)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df145)
rm(df145)
df146<-data.frame(Carte_province$COL146)
df146<-df146%>%mutate(colonne = '146')
df146<-df146%>%rename(data = Carte_province.COL146)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df146)
rm(df146)
df147<-data.frame(Carte_province$COL147)
df147<-df147%>%mutate(colonne = '147')
df147<-df147%>%rename(data = Carte_province.COL147)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df147)
rm(df147)
df148<-data.frame(Carte_province$COL148)
df148<-df148%>%mutate(colonne = '148')
df148<-df148%>%rename(data = Carte_province.COL148)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df148)
rm(df148)
df149<-data.frame(Carte_province$COL149)
df149<-df149%>%mutate(colonne = '149')
df149<-df149%>%rename(data = Carte_province.COL149)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df149)
rm(df149)
df150<-data.frame(Carte_province$COL150)
df150<-df150%>%mutate(colonne = '150')
df150<-df150%>%rename(data = Carte_province.COL150)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df150)
rm(df150)
df151<-data.frame(Carte_province$COL151)
df151<-df151%>%mutate(colonne = '151')
df151<-df151%>%rename(data = Carte_province.COL151)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df151)
rm(df151)
df152<-data.frame(Carte_province$COL152)
df152<-df152%>%mutate(colonne = '152')
df152<-df152%>%rename(data = Carte_province.COL152)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df152)
rm(df152)
df153<-data.frame(Carte_province$COL153)
df153<-df153%>%mutate(colonne = '153')
df153<-df153%>%rename(data = Carte_province.COL153)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df153)
rm(df153)
df154<-data.frame(Carte_province$COL154)
df154<-df154%>%mutate(colonne = '154')
df154<-df154%>%rename(data = Carte_province.COL154)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df154)
rm(df154)
df155<-data.frame(Carte_province$COL155)
df155<-df155%>%mutate(colonne = '155')
df155<-df155%>%rename(data = Carte_province.COL155)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df155)
rm(df155)
df156<-data.frame(Carte_province$COL156)
df156<-df156%>%mutate(colonne = '156')
df156<-df156%>%rename(data = Carte_province.COL156)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df156)
rm(df156)
df157<-data.frame(Carte_province$COL157)
df157<-df157%>%mutate(colonne = '157')
df157<-df157%>%rename(data = Carte_province.COL157)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df157)
rm(df157)
df158<-data.frame(Carte_province$COL158)
df158<-df158%>%mutate(colonne = '158')
df158<-df158%>%rename(data = Carte_province.COL158)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df158)
rm(df158)
df159<-data.frame(Carte_province$COL159)
df159<-df159%>%mutate(colonne = '159')
df159<-df159%>%rename(data = Carte_province.COL159)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df159)
rm(df159)
df160<-data.frame(Carte_province$COL160)
df160<-df160%>%mutate(colonne = '160')
df160<-df160%>%rename(data = Carte_province.COL160)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df160)
rm(df160)
df161<-data.frame(Carte_province$COL161)
df161<-df161%>%mutate(colonne = '161')
df161<-df161%>%rename(data = Carte_province.COL161)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df161)
rm(df161)
df162<-data.frame(Carte_province$COL162)
df162<-df162%>%mutate(colonne = '162')
df162<-df162%>%rename(data = Carte_province.COL162)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df162)
rm(df162)
df163<-data.frame(Carte_province$COL163)
df163<-df163%>%mutate(colonne = '163')
df163<-df163%>%rename(data = Carte_province.COL163)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df163)
rm(df163)
df164<-data.frame(Carte_province$COL164)
df164<-df164%>%mutate(colonne = '164')
df164<-df164%>%rename(data = Carte_province.COL164)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df164)
rm(df164)
df165<-data.frame(Carte_province$COL165)
df165<-df165%>%mutate(colonne = '165')
df165<-df165%>%rename(data = Carte_province.COL165)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df165)
rm(df165)
df166<-data.frame(Carte_province$COL166)
df166<-df166%>%mutate(colonne = '166')
df166<-df166%>%rename(data = Carte_province.COL166)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df166)
rm(df166)
df167<-data.frame(Carte_province$COL167)
df167<-df167%>%mutate(colonne = '167')
df167<-df167%>%rename(data = Carte_province.COL167)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df167)
rm(df167)
df168<-data.frame(Carte_province$COL168)
df168<-df168%>%mutate(colonne = '168')
df168<-df168%>%rename(data = Carte_province.COL168)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df168)
rm(df168)
df169<-data.frame(Carte_province$COL169)
df169<-df169%>%mutate(colonne = '169')
df169<-df169%>%rename(data = Carte_province.COL169)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df169)
rm(df169)
df170<-data.frame(Carte_province$COL170)
df170<-df170%>%mutate(colonne = '170')
df170<-df170%>%rename(data = Carte_province.COL170)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df170)
rm(df170)
df171<-data.frame(Carte_province$COL171)
df171<-df171%>%mutate(colonne = '171')
df171<-df171%>%rename(data = Carte_province.COL171)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df171)
rm(df171)
df172<-data.frame(Carte_province$COL172)
df172<-df172%>%mutate(colonne = '172')
df172<-df172%>%rename(data = Carte_province.COL172)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df172)
rm(df172)
df173<-data.frame(Carte_province$COL173)
df173<-df173%>%mutate(colonne = '173')
df173<-df173%>%rename(data = Carte_province.COL173)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df173)
rm(df173)
df174<-data.frame(Carte_province$COL174)
df174<-df174%>%mutate(colonne = '174')
df174<-df174%>%rename(data = Carte_province.COL174)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df174)
rm(df174)
df175<-data.frame(Carte_province$COL175)
df175<-df175%>%mutate(colonne = '175')
df175<-df175%>%rename(data = Carte_province.COL175)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df175)
rm(df175)
df176<-data.frame(Carte_province$COL176)
df176<-df176%>%mutate(colonne = '176')
df176<-df176%>%rename(data = Carte_province.COL176)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df176)
rm(df176)
df177<-data.frame(Carte_province$COL177)
df177<-df177%>%mutate(colonne = '177')
df177<-df177%>%rename(data = Carte_province.COL177)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df177)
rm(df177)
df178<-data.frame(Carte_province$COL178)
df178<-df178%>%mutate(colonne = '178')
df178<-df178%>%rename(data = Carte_province.COL178)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df178)
rm(df178)
df179<-data.frame(Carte_province$COL179)
df179<-df179%>%mutate(colonne = '179')
df179<-df179%>%rename(data = Carte_province.COL179)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df179)
rm(df179)
df180<-data.frame(Carte_province$COL180)
df180<-df180%>%mutate(colonne = '180')
df180<-df180%>%rename(data = Carte_province.COL180)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df180)
rm(df180)
df181<-data.frame(Carte_province$COL181)
df181<-df181%>%mutate(colonne = '181')
df181<-df181%>%rename(data = Carte_province.COL181)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df181)
rm(df181)
df182<-data.frame(Carte_province$COL182)
df182<-df182%>%mutate(colonne = '182')
df182<-df182%>%rename(data = Carte_province.COL182)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df182)
rm(df182)
df183<-data.frame(Carte_province$COL183)
df183<-df183%>%mutate(colonne = '183')
df183<-df183%>%rename(data = Carte_province.COL183)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df183)
rm(df183)
df184<-data.frame(Carte_province$COL184)
df184<-df184%>%mutate(colonne = '184')
df184<-df184%>%rename(data = Carte_province.COL184)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df184)
rm(df184)
df185<-data.frame(Carte_province$COL185)
df185<-df185%>%mutate(colonne = '185')
df185<-df185%>%rename(data = Carte_province.COL185)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df185)
rm(df185)
df186<-data.frame(Carte_province$COL186)
df186<-df186%>%mutate(colonne = '186')
df186<-df186%>%rename(data = Carte_province.COL186)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df186)
rm(df186)
df187<-data.frame(Carte_province$COL187)
df187<-df187%>%mutate(colonne = '187')
df187<-df187%>%rename(data = Carte_province.COL187)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df187)
rm(df187)
df188<-data.frame(Carte_province$COL188)
df188<-df188%>%mutate(colonne = '188')
df188<-df188%>%rename(data = Carte_province.COL188)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df188)
rm(df188)
df189<-data.frame(Carte_province$COL189)
df189<-df189%>%mutate(colonne = '189')
df189<-df189%>%rename(data = Carte_province.COL189)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df189)
rm(df189)
df190<-data.frame(Carte_province$COL190)
df190<-df190%>%mutate(colonne = '190')
df190<-df190%>%rename(data = Carte_province.COL190)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df190)
rm(df190)
df191<-data.frame(Carte_province$COL191)
df191<-df191%>%mutate(colonne = '191')
df191<-df191%>%rename(data = Carte_province.COL191)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df191)
rm(df191)
df192<-data.frame(Carte_province$COL192)
df192<-df192%>%mutate(colonne = '192')
df192<-df192%>%rename(data = Carte_province.COL192)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df192)
rm(df192)
df193<-data.frame(Carte_province$COL193)
df193<-df193%>%mutate(colonne = '193')
df193<-df193%>%rename(data = Carte_province.COL193)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df193)
rm(df193)
df194<-data.frame(Carte_province$COL194)
df194<-df194%>%mutate(colonne = '194')
df194<-df194%>%rename(data = Carte_province.COL194)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df194)
rm(df194)
df195<-data.frame(Carte_province$COL195)
df195<-df195%>%mutate(colonne = '195')
df195<-df195%>%rename(data = Carte_province.COL195)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df195)
rm(df195)
df196<-data.frame(Carte_province$COL196)
df196<-df196%>%mutate(colonne = '196')
df196<-df196%>%rename(data = Carte_province.COL196)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df196)
rm(df196)
df197<-data.frame(Carte_province$COL197)
df197<-df197%>%mutate(colonne = '197')
df197<-df197%>%rename(data = Carte_province.COL197)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df197)
rm(df197)
df198<-data.frame(Carte_province$COL198)
df198<-df198%>%mutate(colonne = '198')
df198<-df198%>%rename(data = Carte_province.COL198)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df198)
rm(df198)
df199<-data.frame(Carte_province$COL199)
df199<-df199%>%mutate(colonne = '199')
df199<-df199%>%rename(data = Carte_province.COL199)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df199)
rm(df199)
df200<-data.frame(Carte_province$COL200)
df200<-df200%>%mutate(colonne = '200')
df200<-df200%>%rename(data = Carte_province.COL200)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df200)
rm(df200)
df201<-data.frame(Carte_province$COL201)
df201<-df201%>%mutate(colonne = '201')
df201<-df201%>%rename(data = Carte_province.COL201)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df201)
rm(df201)
df202<-data.frame(Carte_province$COL202)
df202<-df202%>%mutate(colonne = '202')
df202<-df202%>%rename(data = Carte_province.COL202)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df202)
rm(df202)
df203<-data.frame(Carte_province$COL203)
df203<-df203%>%mutate(colonne = '203')
df203<-df203%>%rename(data = Carte_province.COL203)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df203)
rm(df203)
df204<-data.frame(Carte_province$COL204)
df204<-df204%>%mutate(colonne = '204')
df204<-df204%>%rename(data = Carte_province.COL204)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df204)
rm(df204)
df205<-data.frame(Carte_province$COL205)
df205<-df205%>%mutate(colonne = '205')
df205<-df205%>%rename(data = Carte_province.COL205)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df205)
rm(df205)
df206<-data.frame(Carte_province$COL206)
df206<-df206%>%mutate(colonne = '206')
df206<-df206%>%rename(data = Carte_province.COL206)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df206)
rm(df206)
df207<-data.frame(Carte_province$COL207)
df207<-df207%>%mutate(colonne = '207')
df207<-df207%>%rename(data = Carte_province.COL207)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df207)
rm(df207)
df208<-data.frame(Carte_province$COL208)
df208<-df208%>%mutate(colonne = '208')
df208<-df208%>%rename(data = Carte_province.COL208)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df208)
rm(df208)
df209<-data.frame(Carte_province$COL209)
df209<-df209%>%mutate(colonne = '209')
df209<-df209%>%rename(data = Carte_province.COL209)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df209)
rm(df209)
df210<-data.frame(Carte_province$COL210)
df210<-df210%>%mutate(colonne = '210')
df210<-df210%>%rename(data = Carte_province.COL210)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df210)
rm(df210)
df211<-data.frame(Carte_province$COL211)
df211<-df211%>%mutate(colonne = '211')
df211<-df211%>%rename(data = Carte_province.COL211)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df211)
rm(df211)
df212<-data.frame(Carte_province$COL212)
df212<-df212%>%mutate(colonne = '212')
df212<-df212%>%rename(data = Carte_province.COL212)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df212)
rm(df212)
df213<-data.frame(Carte_province$COL213)
df213<-df213%>%mutate(colonne = '213')
df213<-df213%>%rename(data = Carte_province.COL213)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df213)
rm(df213)
df214<-data.frame(Carte_province$COL214)
df214<-df214%>%mutate(colonne = '214')
df214<-df214%>%rename(data = Carte_province.COL214)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df214)
rm(df214)
df215<-data.frame(Carte_province$COL215)
df215<-df215%>%mutate(colonne = '215')
df215<-df215%>%rename(data = Carte_province.COL215)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df215)
rm(df215)
df216<-data.frame(Carte_province$COL216)
df216<-df216%>%mutate(colonne = '216')
df216<-df216%>%rename(data = Carte_province.COL216)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df216)
rm(df216)
df217<-data.frame(Carte_province$COL217)
df217<-df217%>%mutate(colonne = '217')
df217<-df217%>%rename(data = Carte_province.COL217)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df217)
rm(df217)
df218<-data.frame(Carte_province$COL218)
df218<-df218%>%mutate(colonne = '218')
df218<-df218%>%rename(data = Carte_province.COL218)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df218)
rm(df218)
df219<-data.frame(Carte_province$COL219)
df219<-df219%>%mutate(colonne = '219')
df219<-df219%>%rename(data = Carte_province.COL219)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df219)
rm(df219)
df220<-data.frame(Carte_province$COL220)
df220<-df220%>%mutate(colonne = '220')
df220<-df220%>%rename(data = Carte_province.COL220)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df220)
rm(df220)
df221<-data.frame(Carte_province$COL221)
df221<-df221%>%mutate(colonne = '221')
df221<-df221%>%rename(data = Carte_province.COL221)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df221)
rm(df221)
df222<-data.frame(Carte_province$COL222)
df222<-df222%>%mutate(colonne = '222')
df222<-df222%>%rename(data = Carte_province.COL222)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df222)
rm(df222)
df223<-data.frame(Carte_province$COL223)
df223<-df223%>%mutate(colonne = '223')
df223<-df223%>%rename(data = Carte_province.COL223)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df223)
rm(df223)
df224<-data.frame(Carte_province$COL224)
df224<-df224%>%mutate(colonne = '224')
df224<-df224%>%rename(data = Carte_province.COL224)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df224)
rm(df224)
df225<-data.frame(Carte_province$COL225)
df225<-df225%>%mutate(colonne = '225')
df225<-df225%>%rename(data = Carte_province.COL225)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df225)
rm(df225)
df226<-data.frame(Carte_province$COL226)
df226<-df226%>%mutate(colonne = '226')
df226<-df226%>%rename(data = Carte_province.COL226)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df226)
rm(df226)
df227<-data.frame(Carte_province$COL227)
df227<-df227%>%mutate(colonne = '227')
df227<-df227%>%rename(data = Carte_province.COL227)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df227)
rm(df227)
df228<-data.frame(Carte_province$COL228)
df228<-df228%>%mutate(colonne = '228')
df228<-df228%>%rename(data = Carte_province.COL228)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df228)
rm(df228)
df229<-data.frame(Carte_province$COL229)
df229<-df229%>%mutate(colonne = '229')
df229<-df229%>%rename(data = Carte_province.COL229)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df229)
rm(df229)
df230<-data.frame(Carte_province$COL230)
df230<-df230%>%mutate(colonne = '230')
df230<-df230%>%rename(data = Carte_province.COL230)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df230)
rm(df230)
df231<-data.frame(Carte_province$COL231)
df231<-df231%>%mutate(colonne = '231')
df231<-df231%>%rename(data = Carte_province.COL231)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df231)
rm(df231)
df232<-data.frame(Carte_province$COL232)
df232<-df232%>%mutate(colonne = '232')
df232<-df232%>%rename(data = Carte_province.COL232)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df232)
rm(df232)
df233<-data.frame(Carte_province$COL233)
df233<-df233%>%mutate(colonne = '233')
df233<-df233%>%rename(data = Carte_province.COL233)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df233)
rm(df233)
df234<-data.frame(Carte_province$COL234)
df234<-df234%>%mutate(colonne = '234')
df234<-df234%>%rename(data = Carte_province.COL234)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df234)
rm(df234)
df235<-data.frame(Carte_province$COL235)
df235<-df235%>%mutate(colonne = '235')
df235<-df235%>%rename(data = Carte_province.COL235)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df235)
rm(df235)
df236<-data.frame(Carte_province$COL236)
df236<-df236%>%mutate(colonne = '236')
df236<-df236%>%rename(data = Carte_province.COL236)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df236)
rm(df236)
df237<-data.frame(Carte_province$COL237)
df237<-df237%>%mutate(colonne = '237')
df237<-df237%>%rename(data = Carte_province.COL237)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df237)
rm(df237)
df238<-data.frame(Carte_province$COL238)
df238<-df238%>%mutate(colonne = '238')
df238<-df238%>%rename(data = Carte_province.COL238)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df238)
rm(df238)
df239<-data.frame(Carte_province$COL239)
df239<-df239%>%mutate(colonne = '239')
df239<-df239%>%rename(data = Carte_province.COL239)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df239)
rm(df239)
df240<-data.frame(Carte_province$COL240)
df240<-df240%>%mutate(colonne = '240')
df240<-df240%>%rename(data = Carte_province.COL240)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df240)
rm(df240)
df241<-data.frame(Carte_province$COL241)
df241<-df241%>%mutate(colonne = '241')
df241<-df241%>%rename(data = Carte_province.COL241)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df241)
rm(df241)
df242<-data.frame(Carte_province$COL242)
df242<-df242%>%mutate(colonne = '242')
df242<-df242%>%rename(data = Carte_province.COL242)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df242)
rm(df242)
df243<-data.frame(Carte_province$COL243)
df243<-df243%>%mutate(colonne = '243')
df243<-df243%>%rename(data = Carte_province.COL243)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df243)
rm(df243)
df244<-data.frame(Carte_province$COL244)
df244<-df244%>%mutate(colonne = '244')
df244<-df244%>%rename(data = Carte_province.COL244)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df244)
rm(df244)
df245<-data.frame(Carte_province$COL245)
df245<-df245%>%mutate(colonne = '245')
df245<-df245%>%rename(data = Carte_province.COL245)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df245)
rm(df245)
df246<-data.frame(Carte_province$COL246)
df246<-df246%>%mutate(colonne = '246')
df246<-df246%>%rename(data = Carte_province.COL246)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df246)
rm(df246)
df247<-data.frame(Carte_province$COL247)
df247<-df247%>%mutate(colonne = '247')
df247<-df247%>%rename(data = Carte_province.COL247)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df247)
rm(df247)
df248<-data.frame(Carte_province$COL248)
df248<-df248%>%mutate(colonne = '248')
df248<-df248%>%rename(data = Carte_province.COL248)%>%mutate(ligne = dfligne)
Cartedeuxdim<- rbind(Cartedeuxdim,df248)
rm(df248)



### 5.2 Importer la carte depuis GDRIVE Construction du graphique ----

Cartedeuxdim$colonne<-as.integer(Cartedeuxdim$colonne)
Cartedeuxdim$ligne<-unlist(Cartedeuxdim$ligne)

Cartedeuxdim%>%group_by(colonne)%>%tally()%>%ggplot(aes(x=colonne, y = n))+geom_point()
Cartedeuxdim%>%group_by(ligne)%>%tally()%>%ggplot(aes(x=ligne, y = n))+geom_point()



Cartedeuxdim<- Cartedeuxdim%>%mutate(provexiste = case_when(
  #  data =="" ~ "mer",
  data !="" ~"1"
))

#Carte avec 2 couleurs
Cartedeuxdim%>%
  filter(ligne>150)%>%
  ggplot(aes(x= colonne, y = ligne, color = provexiste))+geom_point()+ theme(legend.position="none")

#Carte avec les provinces en couleurs 
Cartedeuxdim%>%
  filter(ligne>150)%>%
  filter(provexiste !="mer")%>%
  ggplot(aes(x= colonne, y = ligne, color = data))+geom_point()+ theme(legend.position="none")



### 5.3 IDENTIFIER LES CONQUETES-----
##### CODE pour faier une carte dynamique
#DBCONQUETE_EVENT reprend toute les changements de proprités de provinces. apres les jour 0

####1 identifier provinces conquises  ----

#On trouve la province 
DBCONQUETE_EVENT<- DATABASE_B

DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "  "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "   "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "     "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "       "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "         "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "           "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "             "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "               "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "                 "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "                   "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "                     "," ")
DBCONQUETE_EVENT$article_body_text<-str_replace(DATABASE_B$article_body_text, "                       "," ")
DBCONQUETE_EVENT<- DBCONQUETE_EVENT%>%
  #filter(numcarte == "5420045")%>%
  mutate(conquete= str_detect(article_body_text,"a conquis"))%>%
  filter(conquete == TRUE)%>%
  mutate(prem_aconquis = str_locate(article_body_text, "a conquis"))%>%
  mutate(txtapresconquis = str_sub(article_body_text, start = prem_aconquis[,2]+1))%>%
  mutate(nom_province = str_sub(txtapresconquis, start = 2, end = -2L))%>%
  select(numcarte, jour, nom_province, article_body_text)%>%
  mutate(NOMPROV_MAJ = str_to_upper(nom_province))%>%
  filter(NOMPROV_MAJ%in%DF_liste_provinces$nom_province_majuscule)%>%#### ensuite on cherche le pays conquerant
  mutate(col1_trouve_le = str_locate(article_body_text, " Le "))%>%
  mutate(col2_texteapresle = str_sub(article_body_text, start = col1_trouve_le[,2]+1))%>%
  mutate(col3_trouvele_e = str_locate(col2_texteapresle,"e"))

#on remplace le nom des armées par YYYY pour pouvoir les uniformiser
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Division","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Infanterie Corps","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Brigade Infanterie","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Groupe","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Armée","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Brigade Véhicule blindé","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Brigade Cavalerie","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Véhicule blindé Corps","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Brigade Cavalerie","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Char Corps","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Brigade Char Lourd ","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Char Lourd Corps","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Artillerie Corps","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Cavalerie Corps","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Brigade Char","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Brigade Ballon d'observation","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Brigade Artillerie","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"Ballon d'observation Corps","YYYYYY")
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"  "," ")

#verificaation qu'on a oublié aucune armée
DBCONQUETE_EVENT%>%select(col2_texteapresle)%>%mutate(motatrouver= str_detect(col2_texteapresle,"YYYYYY"))%>%
  filter(motatrouver == FALSE)

#on remplace 1er en "1e" pour éviter que ca fasse planter la formule
DBCONQUETE_EVENT$col2_texteapresle<-str_replace(DBCONQUETE_EVENT$col2_texteapresle,"1er","1e")

#sort la liste des nationalités
DBCONQUETE_EVENT<- DBCONQUETE_EVENT%>%
  mutate(col4_trouveleyyyy = str_locate(col2_texteapresle,"YYYYYY" ))%>%
  mutate(col5_nationalitearmee = str_sub(col2_texteapresle,start = col3_trouvele_e[,2]+2, end= col4_trouveleyyyy[,1]-2))

DBCONQUETE_EVENT$col5_nationalitearmee[DBCONQUETE_EVENT$col5_nationalitearmee =="états-unien du Nord "]<-"états-unien du Nord"
DBCONQUETE_EVENT<- DBCONQUETE_EVENT%>%
  mutate(col6_nationalite_MAJUSCULE= str_to_upper(col5_nationalitearmee))


DBCONQUETE_EVENT<- DBCONQUETE_EVENT%>%
  mutate(pays_conquerant = DF_Liste_pays_carte31$pays_majuscule[match(DBCONQUETE_EVENT$col6_nationalite_MAJUSCULE,DF_Liste_pays_carte31$nationalite_armee_MAJUSCULE )])

# On vire les provinces conquise le meme jour et on ne garde que la conquete la plus tardive
DBCONQUETE_EVENT<- DBCONQUETE_EVENT%>%
  mutate(col7_le = str_locate(article_body_text, " Le "))%>%
  mutate(col8_heure = str_sub(article_body_text, end= col7_le[,1]-1))

DBCONQUETE_EVENT$col8_heure<-str_replace(DBCONQUETE_EVENT$col8_heure," ","")
DBCONQUETE_EVENT$col8_heure<-str_replace(DBCONQUETE_EVENT$col8_heure," ","")
DBCONQUETE_EVENT$col8_heure<-str_replace(DBCONQUETE_EVENT$col8_heure," ","")
DBCONQUETE_EVENT$col8_heure<-str_replace(DBCONQUETE_EVENT$col8_heure," ","")
DBCONQUETE_EVENT$col8_heure<-str_replace(DBCONQUETE_EVENT$col8_heure," ","")
DBCONQUETE_EVENT$col8_heure<-str_replace(DBCONQUETE_EVENT$col8_heure," ","")
DBCONQUETE_EVENT$col8_heure<-str_replace(DBCONQUETE_EVENT$col8_heure," ","")
DBCONQUETE_EVENT$col8_heure<-str_replace(DBCONQUETE_EVENT$col8_heure," ","")
DBCONQUETE_EVENT$col8_heure<-str_replace(DBCONQUETE_EVENT$col8_heure," ","")
DBCONQUETE_EVENT<-DBCONQUETE_EVENT%>%
  mutate(col9_trouve_deuxpoints = str_locate(col8_heure,":"))%>%
  mutate(col10_trouveheure = str_sub(col8_heure, end=col9_trouve_deuxpoints[,1]-1))
DBCONQUETE_EVENT$col10_trouveheure<- as.integer(DBCONQUETE_EVENT$col10_trouveheure)
DBCONQUETE_EVENT<-DBCONQUETE_EVENT%>%
  mutate(col11_trouveminute = str_sub(col8_heure, start=col9_trouve_deuxpoints[,1]+1, end =col9_trouve_deuxpoints[,1]+2 ))
DBCONQUETE_EVENT$col11_trouveminute<- as.integer(DBCONQUETE_EVENT$col11_trouveminute)

DBCONQUETE_EVENT<-DBCONQUETE_EVENT%>%
  mutate(col12_minuteapresmidi = case_when(
    str_detect(col8_heure,"pm")~ 12*60,
    TRUE ~ 0)
  )


DBCONQUETE_EVENT<-DBCONQUETE_EVENT%>%
  mutate(col13_minutes_total_journee = col10_trouveheure*60+col11_trouveminute+col12_minuteapresmidi)

ungroup(DBCONQUETE_EVENT)

DBCONQUETE_EVENT<-DBCONQUETE_EVENT%>%select(numcarte, jour,nom_province, article_body_text, col13_minutes_total_journee,pays_conquerant  )

#on retire les doublons

#je fais une liste avec toute les cartes doublons

DBCONQUETE_EVENT<-DBCONQUETE_EVENT%>%
  mutate(toutletexte = paste0(numcarte,jour, nom_province))%>%
  mutate(doublon = duplicated(toutletexte))

listedoublon<- DBCONQUETE_EVENT%>%
  filter(doublon == TRUE)%>%pull(toutletexte)

#Je fais une formule pour identifier le premeir de chaque doublon

doublonnettoye <-DBCONQUETE_EVENT[1,]
doublonnettoye$numcarte[1]<-""
doublonnettoye$jour[1]<-"0"
doublonnettoye$article_body_text[1]<-""
doublonnettoye$col13_minutes_total_journee[1]<-0
doublonnettoye$toutletexte[1]<-""
doublonnettoye$pays_conquerant[1]<-""

prendleplusvieux <- function(toutletexteX){
  #toutletexteX <-"467834633Kishinev"
  x<- DBCONQUETE_EVENT%>%filter(toutletexte == toutletexteX)%>%
    arrange(desc(col13_minutes_total_journee))
  x<-x[1,]
  doublonnettoye<-rbind(doublonnettoye,x )  
}

doublonnettoye2<-lapply(listedoublon, prendleplusvieux)
doublonnettoye2<-rbindlist(doublonnettoye2)
doublonnettoye2<-data.frame(doublonnettoye2)
doublonnettoye2<-doublonnettoye2%>%mutate(doublon=duplicated(toutletexte))%>%filter(doublon == FALSE)

#Je faire une formule qui retire chaque potentiel doublon de la database

DBCONQUETE_EVENT<- DBCONQUETE_EVENT%>%
  mutate(potentieldoublon = toutletexte %in% listedoublon)%>%
  filter(potentieldoublon == FALSE)%>%select(-potentieldoublon)

#Je rajoute les database sans les doublons avec le plus ancien des doublons
DBCONQUETE_EVENT<-rbind(DBCONQUETE_EVENT,doublonnettoye2)

DBCONQUETE_EVENT<-DBCONQUETE_EVENT%>%
  select(numcarte, jour, nom_province, pays_conquerant)%>%mutate(type = "conquete")



#Passage en nombre de minutes






####2 identifierprovinces revolution  ----
#Identifier les phrases des révoltes
revolution<- DATABASE_B%>%
  select(numcarte, jour, article_body_text)%>%
  #filter(numcarte == "5420045")%>%
  #select(article_body_text)%>%
  mutate(col1_recherche_revolte= case_when(
    str_detect(article_body_text,"ont été renversées dans une violente révolte. Les foules déclarent vouloir retourner") ~ "Cas1",
    str_detect(article_body_text,"ont été renversées dans une violente révolte. Le peuple s'est proclamé du côté de") ~ "Cas2",
    str_detect(article_body_text,"ont été renversées dans une violente révolte. Les citoyens écrasent ")&
      str_detect(article_body_text,"et joignent")~ "Cas3",
    str_detect(article_body_text,"ont été renversées dans une violente révolte. Les citoyens écrasent ")&
      str_detect(article_body_text," et retournent à la ")~ "Cas4",
    str_detect(article_body_text,"ont été renversées dans une violente révolte.")
    & str_detect(article_body_text,"Le peuple s'est proclamé du côté de") ~ "Cas5",
    str_detect(article_body_text,"ont été renversées dans une violente révolte.")
    & str_detect(article_body_text,"Les foules déclarent vouloir retourner en ") ~ "Cas6"
  ))

#controle qu'on oublie pas de phrase
revolution%>%filter(is.na(col1_recherche_revolte))%>%
  filter(str_detect(article_body_text,"révolte"))%>%
  filter(!str_detect(article_body_text, "a été tué pendant la révolte."))%>%
  filter(!str_detect(article_body_text, "ont été tués pendant la révolte."))


revolution_cas1<- revolution%>%
  filter(col1_recherche_revolte == "Cas1")%>%
  mutate(col2_cas1_debutprov = str_locate(article_body_text,"Les troupes de la garnison postées à "))%>%
  mutate(col3_cas1_finprov = str_locate(article_body_text, " ont été renversées dans une violente révolte."))%>%
  mutate(nom_province = str_sub(article_body_text, start = col2_cas1_debutprov[,2]+1, end= col3_cas1_finprov[,1]-1))%>%
  mutate(col4_debut_pays = str_locate(article_body_text,"Les foules déclarent vouloir retourner en "))%>%
  mutate(pays_conquerant = str_sub(article_body_text, start = col4_debut_pays[,2]+1, end= -2L))%>%
  select(numcarte, jour, nom_province, pays_conquerant)%>%mutate(type = "revolution")

revolution_cas1

revolution_cas2<- revolution%>%
  filter(col1_recherche_revolte == "Cas2")%>%
  mutate(col2_cas1_debutprov = str_locate(article_body_text,"Les troupes de la garnison postées à "))%>%
  mutate(col3_cas1_finprov = str_locate(article_body_text, " ont été renversées dans une violente révolte."))%>%
  mutate(nom_province = str_sub(article_body_text, start = col2_cas1_debutprov[,2]+1, end= col3_cas1_finprov[,1]-1))%>%
  mutate(col4_debut_pays = str_locate(article_body_text,"Le peuple s'est proclamé du côté de : "))%>%
  mutate(pays_conquerant = str_sub(article_body_text, start = col4_debut_pays[,2]+1, end= -2L))%>%
  select(numcarte, jour, nom_province, pays_conquerant)%>%mutate(type = "revolution")
revolution_cas2

revolution_cas3<- revolution%>%
  select(numcarte, jour, article_body_text,col1_recherche_revolte)%>%
  filter(col1_recherche_revolte == "Cas3")%>%
  mutate(col2_cas1_debutprov = str_locate(article_body_text,"Les troupes de la garnison postées à "))%>%
  mutate(col3_cas1_finprov = str_locate(article_body_text, " ont été renversées dans une violente révolte."))%>%
  mutate(nom_province = str_sub(article_body_text, start = col2_cas1_debutprov[,2]+1, end= col3_cas1_finprov[,1]-1))%>%
  mutate(col4_debut_pays = str_locate(article_body_text,"et joignent la "))%>%
  mutate(col5_textaprescol4 = str_sub(article_body_text, start = col4_debut_pays[,2]))%>%
  mutate(col6_trouvepointdanstxtcol5 = str_locate(col5_textaprescol4,". "))%>%
  mutate(pays_conquerant = str_sub(col5_textaprescol4, start= 2, end = col6_trouvepointdanstxtcol5[,1]-1))%>%
  select(numcarte, jour, nom_province, pays_conquerant)%>%mutate(type = "revolution")
revolution_cas3

revolution_cas4<- revolution%>%
  select(numcarte, jour, article_body_text,col1_recherche_revolte)%>%
  filter(col1_recherche_revolte == "Cas4")%>%
  mutate(col2_cas1_debutprov = str_locate(article_body_text,"Les troupes de la garnison postées à "))%>%
  mutate(col3_cas1_finprov = str_locate(article_body_text, " ont été renversées dans une violente révolte."))%>%
  mutate(nom_province = str_sub(article_body_text, start = col2_cas1_debutprov[,2]+1, end= col3_cas1_finprov[,1]-1))%>%
  mutate(col4_debut_pays = str_locate(article_body_text," et retournent à la "))%>%
  mutate(col5_textaprescol4 = str_sub(article_body_text, start = col4_debut_pays[,2]))%>%
  mutate(col6_trouvepointdanstxtcol5 = str_locate(col5_textaprescol4,". "))%>%
  mutate(pays_conquerant = str_sub(col5_textaprescol4, start= 2, end = col6_trouvepointdanstxtcol5[,1]-1))%>%
  select(numcarte, jour, nom_province, pays_conquerant)%>%mutate(type = "revolution")
revolution_cas4


revolution_cas5<- revolution%>%
  select(numcarte, jour, article_body_text,col1_recherche_revolte)%>%
  filter(col1_recherche_revolte == "Cas5")%>%
  mutate(col2_cas1_debutprov = str_locate(article_body_text,"Les troupes de la garnison postées à "))%>%
  mutate(col3_cas1_finprov = str_locate(article_body_text, " ont été renversées dans une violente révolte."))%>%
  mutate(nom_province = str_sub(article_body_text, start = col2_cas1_debutprov[,2]+1, end= col3_cas1_finprov[,1]-1))%>%
  mutate(col4_debut_pays = str_locate(article_body_text,"Le peuple s'est proclamé du côté de : "))%>%
  mutate(col5_textaprescol4 = str_sub(article_body_text, start = col4_debut_pays[,2]))%>%
  mutate(pays_conquerant = str_sub(col5_textaprescol4, start= 2, end = -2L))%>%
  select(numcarte, jour, nom_province, pays_conquerant)%>%mutate(type = "revolution")
revolution_cas5


revolution_cas6<- revolution%>%
  select(numcarte, jour, article_body_text,col1_recherche_revolte)%>%
  filter(col1_recherche_revolte == "Cas6")%>%
  mutate(col2_cas1_debutprov = str_locate(article_body_text,"Les troupes de la garnison postées à "))%>%
  mutate(col3_cas1_finprov = str_locate(article_body_text, " ont été renversées dans une violente révolte."))%>%
  mutate(nom_province = str_sub(article_body_text, start = col2_cas1_debutprov[,2]+1, end= col3_cas1_finprov[,1]-1))%>%
  mutate(col4_debut_pays = str_locate(article_body_text,"Les foules déclarent vouloir retourner en "))%>%
  mutate(col5_textaprescol4 = str_sub(article_body_text, start = col4_debut_pays[,2]))%>%
  mutate(pays_conquerant = str_sub(col5_textaprescol4, start= 2, end = -2L))%>%
  select(numcarte, jour, nom_province, pays_conquerant)%>%mutate(type = "revolution")
revolution_cas6


DBCONQUETE_EVENT<- rbind(DBCONQUETE_EVENT, revolution_cas1, revolution_cas2, revolution_cas3, revolution_cas4, revolution_cas5, revolution_cas6)

rm(revolution_cas1,
   revolution_cas2,
   revolution_cas3,
   revolution_cas4,
   revolution_cas5,
   revolution_cas6,
   revolution)

####3 identifierprovinces controle  ----



controle<- DATABASE_B%>%
  select(numcarte, jour, article_body_text)%>%
  filter(str_detect(article_body_text,"contrôle"))%>%
  mutate(col1_debutprov = str_locate(article_body_text," a conclu un traité qui met "))%>%
  filter(!is.na(col1_debutprov[,1]))%>%
  mutate(col2_finprov = str_locate(article_body_text, " sous le contrôle de "))%>%
  mutate(nom_province = str_sub(article_body_text, start = col1_debutprov[,2]+1, end= col2_finprov[,1]-1))%>%
  mutate(col3_textaprescol2 = str_sub(article_body_text, start = col2_finprov[,2]))%>%
  mutate(col4_trouvevirguldanstxtcol3 = str_locate(col3_textaprescol2,", "))%>%
  mutate(col5_nationalite_armee= str_sub(col3_textaprescol2, start= 2, end = col4_trouvevirguldanstxtcol3[,1]-1))%>%
  mutate(col6_nationalite_armee_upper = str_to_upper(col5_nationalite_armee))%>%
  mutate(pays_conquerant = DF_Liste_pays_carte31$pays_majuscule[match( col6_nationalite_armee_upper,DF_Liste_pays_carte31$nationalite_armee_MAJUSCULE )])%>%
  select(numcarte, jour, nom_province, pays_conquerant)%>%mutate(type = "controle")
controle


DBCONQUETE_EVENT<- rbind(DBCONQUETE_EVENT,controle)
rm(controle)


####4 identifiercapitale controle  ----

#pAS OK il faut travailler le probleme de 1er et 2e


capitale<-DATABASE_B%>%
  select(numcarte, jour, article_body_text)%>%
  filter(str_detect(article_body_text, "capture la capitale de "))%>%
  mutate(col1_capturecapitale = str_locate(article_body_text,"capture la capitale de "))%>%
  mutate(text_quatorzepreimert= str_sub(article_body_text, end = 14))

capitale1er<-capitale%>%filter(str_detect(text_quatorzepreimert, "1er "))%>%
  mutate(col2_trouveleeouer = str_locate(text_quatorzepreimert,"er "))

capitale_e<-capitale%>%filter(str_detect(text_quatorzepreimert, "e "))%>%
  mutate(col2_trouveleeouer = str_locate(text_quatorzepreimert,"e "))

capitale<-rbind(capitale1er, capitale_e)

capitale<- capitale%>%
  mutate(col3_armee = str_sub(article_body_text, start = col2_trouveleeouer[,2]+2, end= col1_capturecapitale[,1]-1))

#on remplace le nom des armées par YYYY pour pouvoir les uniformiser
capitale$col3_armee<-str_replace(capitale$col3_armee,"Division","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Infanterie Corps","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Brigade Infanterie","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Groupe","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Armée","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Brigade Véhicule blindé","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Brigade Cavalerie","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Véhicule blindé Corps","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Brigade Cavalerie","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Char Corps","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Brigade Char Lourd ","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Char Lourd Corps","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Artillerie Corps","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Cavalerie Corps","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Brigade Char","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Brigade Ballon d'observation","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Brigade Artillerie","YYYYYY")
capitale$col3_armee<-str_replace(capitale$col3_armee,"Ballon d'observation Corps","YYYYYY")

capitale<- capitale%>%mutate(col4_finarmee = str_locate(col3_armee,"YYYYYY"))%>%
  mutate(col5_nationalite_titre = str_sub(col3_armee, end = col4_finarmee[,1]-2))%>%
  mutate(col6_natinalite_MAJUSUCLE = str_to_upper(col5_nationalite_titre))%>%
  mutate(pays_conquerant = DF_Liste_pays_carte31$pays_majuscule[match( col6_natinalite_MAJUSUCLE,DF_Liste_pays_carte31$nationalite_armee_MAJUSCULE )])%>%
  mutate(col7_trouvevirgule = str_locate(article_body_text,", "))%>%
  mutate(col8_texteapresvirgule =str_sub(article_body_text, start = col7_trouvevirgule[,2]+1))

capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Le Caire. ","LeCaire. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"New York. ","NewYork. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"St. Petersbourg. ","StPetersbourg. ")

capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Abou Simbel. ","AbouSimbel. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Al Iskandariyah. ","AlIskandariyah. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Al Ula. ","AlUla. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Alba Iulia. ","AlbaIulia. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"An Nabk. ","AnNabk. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"At Tanfo. ","AtTanfo. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Baia Mare. ","BaiaMare. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Bir Mogrein. ","BirMogrein. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Bur Said. ","BurSaid. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Corner Brook. ","CornerBrook. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Ezbet Tileitla. ","EzbetTileitla. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Groenland Danois. ","GroenlandDanois. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"In Salah. ","InSalah. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"La Canée. ","LaCanée. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"La Haye. ","LaHaye. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Labrador City. ","LabradorCity. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Ma'tan as Sarah. ","MatanasSarah. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Marble Arch. ","MarbleArch. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Massif des Eglab. ","MassifdesEglab. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Moose Factory. ","MooseFactory. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"North Bay. ","NorthBay. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Palma de Majorque. ","PalmadeMajorque. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Port Hope Simpson. ","PortHopeSimpson. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Sarir Tibisti. ","SarirTibisti. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Sidi Barrani. ","SidiBarrani. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Tall 'Afar. ","TallAfar. ")
capitale$col8_texteapresvirgule<- str_replace(capitale$col8_texteapresvirgule,"Turnu Severin. ","TurnuSeverin. ")



capitale<- capitale%>%
  mutate(col9_trouvepoint = str_locate(col8_texteapresvirgule, ". "))%>%
  mutate(nom_province= str_sub(col8_texteapresvirgule, end=col9_trouvepoint[,1]-1))%>%mutate(type = "capitale")

capitale$nom_province<- str_replace(capitale$nom_province,"LeCaire","Le Caire" )
capitale$nom_province<- str_replace(capitale$nom_province,"NewYork","New York" )
capitale$nom_province<- str_replace(capitale$nom_province,"StPetersbourg","St. Petersbourg" )

capitale$nom_province<- str_replace(capitale$nom_province,"AbouSimbel","Abou Simbel" )
capitale$nom_province<- str_replace(capitale$nom_province,"AlIskandariyah","Al Iskandariyah" )
capitale$nom_province<- str_replace(capitale$nom_province,"AlUla","Al Ula" )
capitale$nom_province<- str_replace(capitale$nom_province,"AlbaIulia","Alba Iulia" )
capitale$nom_province<- str_replace(capitale$nom_province,"AnNabk","An Nabk" )
capitale$nom_province<- str_replace(capitale$nom_province,"AtTanfo","At Tanfo" )
capitale$nom_province<- str_replace(capitale$nom_province,"BaiaMare","Baia Mare" )
capitale$nom_province<- str_replace(capitale$nom_province,"BirMogrein","Bir Mogrein" )
capitale$nom_province<- str_replace(capitale$nom_province,"BurSaid","Bur Said" )
capitale$nom_province<- str_replace(capitale$nom_province,"CornerBrook","Corner Brook" )
capitale$nom_province<- str_replace(capitale$nom_province,"EzbetTileitla","Ezbet Tileitla" )
capitale$nom_province<- str_replace(capitale$nom_province,"GroenlandDanois","Groenland Danois" )
capitale$nom_province<- str_replace(capitale$nom_province,"InSalah","In Salah" )
capitale$nom_province<- str_replace(capitale$nom_province,"LaCanée","La Canée" )
capitale$nom_province<- str_replace(capitale$nom_province,"LaHaye","La Haye" )
capitale$nom_province<- str_replace(capitale$nom_province,"LabradorCity","Labrador City" )
capitale$nom_province<- str_replace(capitale$nom_province,"MatanasSarah","Ma'tan as Sarah" )
capitale$nom_province<- str_replace(capitale$nom_province,"MarbleArch","Marble Arch" )
capitale$nom_province<- str_replace(capitale$nom_province,"MassifdesEglab","Massif des Eglab" )
capitale$nom_province<- str_replace(capitale$nom_province,"MooseFactory","Moose Factory" )
capitale$nom_province<- str_replace(capitale$nom_province,"NorthBay","North Bay" )
capitale$nom_province<- str_replace(capitale$nom_province,"PalmadeMajorque","Palma de Majorque" )
capitale$nom_province<- str_replace(capitale$nom_province,"PortHopeSimpson","Port Hope Simpson" )
capitale$nom_province<- str_replace(capitale$nom_province,"SarirTibisti","Sarir Tibisti" )
capitale$nom_province<- str_replace(capitale$nom_province,"SidiBarrani","Sidi Barrani" )
capitale$nom_province<- str_replace(capitale$nom_province,"TallAfar","Tall 'Afar" )
capitale$nom_province<- str_replace(capitale$nom_province,"TurnuSeverin","Turnu Severin" )

capitale<- capitale%>%
  select(numcarte, jour, nom_province, pays_conquerant, type)

DBCONQUETE_EVENT<- rbind(DBCONQUETE_EVENT,capitale)
rm(capitale, capitale_e, capitale1er)

#nettoyage database
DBCONQUETE_EVENT$numcarte<-str_replace(DBCONQUETE_EVENT$numcarte, " ","")
DBCONQUETE_EVENT$numcarte<-str_replace(DBCONQUETE_EVENT$numcarte, "﻿","")

###5.4 On crée une DB qui reprend les données jour par jour pour chaque province----

#A. on met zero conquis pour chaque carte
DBCONQUETE_EVENT%>%group_by(numcarte)%>%tally()


zeroconquis<-DF_liste_provinces%>%
  select(nom_province, province_zeroconquis)%>%
  mutate(numcarte = "?")

rajoutcarte<-function(numcartex){
  #  numcartex<-"5822991"
  
  zeroconquis2<- zeroconquis%>%
    select(nom_province, province_zeroconquis)%>%
    mutate(numcarte = numcartex)
  
  zeroconquis<-rbind(zeroconquis2,zeroconquis)
}

listenumcarte<- DBCONQUETE_EVENT%>%group_by(numcarte)%>%tally()%>%pull(numcarte)

zeroconquis3<- lapply(listenumcarte, rajoutcarte)
zeroconquis3<- rbindlist(zeroconquis3)

zeroconquis3<- zeroconquis3%>%
  filter(numcarte !="?")%>%
  mutate(jour = "0")%>%
  rename(pays_conquerant = province_zeroconquis)%>%
  mutate(type = "zeroconquis")%>%
  select(numcarte, jour, nom_province, pays_conquerant, type)

zeroconquis3<- data.frame(zeroconquis3)

DB_CONQUETE_MAP <- zeroconquis3


# ON rajoute 90 jour avec juste le nom de la province et la carte mais pas de pays

#A. on met zero conquis pour chaque carte
DB_CONQUETE_MAP%>%group_by(numcarte)%>%tally()


noprovince<-DF_liste_provinces%>%
  select(nom_province)%>%
  mutate(provinceinconnu = "?")%>%
  mutate(numcarte = "?")%>%
  mutate(jour = "?")


rajoutcarte2<-function(numcartex){
  #  numcartex<-"5822991"
  
  noprovince2<- noprovince%>%
    select(nom_province, provinceinconnu, jour)%>%
    mutate(numcarte = numcartex)%>%
    select(nom_province, provinceinconnu, numcarte, jour)
  
  list<- 1:90
  
  for (i in list){
    noprovince3<-noprovince2%>%mutate(jour = i)
    noprovince<-rbind(noprovince3,noprovince)
  }
  
  
  noprovince<-rbind(noprovince2,noprovince)
}

listenumcarte<- DBCONQUETE_EVENT%>%group_by(numcarte)%>%tally()%>%pull(numcarte)

noprovince4<- lapply(listenumcarte, rajoutcarte2)
noprovince4<- rbindlist(noprovince4)

noprovince4<- noprovince4%>%
  filter(numcarte !="?")%>%
  filter(jour != "?")%>%
  rename(pays_conquerant = provinceinconnu)%>%
  mutate(type = "?")%>%
  select(numcarte, jour, nom_province, pays_conquerant, type)

noprovince4<- data.frame(noprovince4)







#B. On fusionne zero conquis et on va compléter les trous par l'ancienne valeur

#On créee une base de données avec les zero conquis en 0, 
#des cellules vides pour chaque carte et chaque province de 1 à 90
# L'ensemble des événements

DB_CONQUETE_MAP <- rbind(DB_CONQUETE_MAP, DBCONQUETE_EVENT, noprovince4)
DB_CONQUETE_MAP%>%glimpse()

DB_CONQUETE_MAP$jour<-as.integer(DB_CONQUETE_MAP$jour)
#nettoyage
rm(noprovince, noprovince2, noprovince3, noprovince4, zeroconquis,zeroconquis3)
gc()
#Je vire les ? pour les remplacer par les données connues
DB_CONQUETE_MAP$pays_conquerant[DB_CONQUETE_MAP$pays_conquerant=="?"]<-NA


#formule pour trouver les blancs, 
#La formule fonctionne pour créer une nouvelle colonne avec qui rajoute le suivant
#Mais on doit la mutiplier pour remplir chaque données
#La formule ne fonctionne pas bien car les données ne sont pas sauvés
#Le for fnction bien , la fonction fait bien tourner le for deux fois
# (à la place de 100 cartes pour les test)
#Mais je n'arrive pas à sauver les données
#update 17:59 devrait fonctionner mais i faut le laisser travailler

x<-DB_CONQUETE_MAP
liste_90<- 1:90
x2<-DB_CONQUETE_MAP[1,]
x2[1,1]<-""
x2[1,2]<-0
x2[1,3]<-""
x2[1,4]<-""
x2[1,5]<-""

#listecarte <-c("5420045","5824044")
listecarte <-DB_CONQUETE_MAP%>%group_by(numcarte)%>%tally()%>%pull(numcarte)
toutelescartes<-function(numcartex) {
  print(numcartex)
  for (i in liste_90){
    x<- x%>%
      filter(numcarte == numcartex)%>%
      arrange(numcarte, nom_province, jour)%>%
      mutate_at(.funs = list(prec = lag),
                .vars = vars(nom_province, pays_conquerant))%>%
      rename(pays_conquerant_old = pays_conquerant)%>%
      mutate(pays_conquerant = case_when(
        !is.na(pays_conquerant_old)~pays_conquerant_old,
        !is.na(pays_conquerant_prec)~pays_conquerant_prec
      ))%>%select(numcarte, jour, nom_province, pays_conquerant, type)
    x2<-rbind(x,x2)
    print(paste0(i,numcartex))
  }
  x2<-x2%>%mutate(toutletexte = paste0(numcarte, jour, nom_province, pays_conquerant, type))%>%
    mutate(doublon = duplicated (toutletexte))%>%
    filter(doublon == FALSE)%>%
    select(-toutletexte, -doublon)%>% #je vire tout les doublons
    filter(!is.na(pays_conquerant)) #je vire tout ceux pour lesquels cela n'a pas marché, je ne sais pas pourqoui
}

x3<-lapply(listecarte, toutelescartes)
x3<- rbindlist(x3)
x3<- data_frame(x3)

# #Methode 1  
# remplissagetoutecarte <- function(numcartex){
# 
# for (i in liste_90){
#   x<- x%>%
#     filter(numcarte == numcartex)%>%
#     arrange(numcarte, nom_province, jour)%>%
#     mutate_at(.funs = list(prec = lag),
#               .vars = vars(nom_province, pays_conquerant))%>%
#     rename(pays_conquerant_old = pays_conquerant)%>%
#     mutate(pays_conquerant = case_when(
#       !is.na(pays_conquerant_old)~pays_conquerant_old,
#       !is.na(pays_conquerant_prec)~pays_conquerant_prec
#     ))%>%select(numcarte, jour, nom_province, pays_conquerant, type)
#   
# 
# 
# 
#   
# }
# x2<-rbind(x,x2)
# print(numcartex)
#  
# }
# 
# x2<-lapply(listecarte, remplissagetoutecarte)

#controle


x3%>%filter(is.na(pays_conquerant))
x3%>%
  filter(numcarte == "5420045")%>%
  ggplot(aes(x = jour, y= nom_province))+
  geom_point()+ 
  theme(legend.position = "none") #pas de legende 


DB_CONQUETE_MAP<-x3
rm(x,x2,x3,y,nbrligne,jourmax,doublonnettoye,doublonnettoye2,dfligne, ctrljour)

###5.5 Production_de_la_minimap----


##test carte jour 0 conquis-----

Cartedeuxdim%>%
  mutate(pays_jourX_carte_Y = DF_liste_provinces$province_zeroconquis[match(Cartedeuxdim$data,DF_liste_provinces$nom_province )])%>%
  filter(ligne>150)%>%
  filter(provexiste !="mer")%>%
  ggplot(aes(x= colonne, y = ligne, color = pays_jourX_carte_Y))+
  geom_point(shape=15)+ 
  theme(legend.position="none")


##formule_1 carte----
#important dans cette formule, il faut creer la map avant
funminimap<- function(jourx, numcartex){
  #jourx<-80
  #numcartex<-"5832799"
  onemap<-DB_CONQUETE_MAP%>%filter(jour == jourx)%>%filter(numcarte == numcartex)
  
  Cartedeuxdim%>%
    mutate(pays_jourX_carte_Y = onemap$pays_conquerant [match(Cartedeuxdim$data,onemap$nom_province )])%>%
    filter(ligne>150)%>%
    filter(provexiste !="mer")%>%
    ggplot(aes(x= colonne, y = ligne, color = pays_jourX_carte_Y))+
    geom_point(shape=15)+ 
    theme(legend.position="none")
  
  ggsave(filename = paste0(path,"minimap",numcartex,"/",numcartex,"_",jourx,"minimap.png"))
}


for(i in liste_90)
{
  funminimap(i,"5832799")
  
}


##formule 100 carte 1 jour----
x2<-Cartedeuxdim[1,]%>%mutate(pays_jourX_carte_Y ="")%>%mutate(numcarte ="")

liste_carte<- DB_CONQUETE_MAP%>%group_by(numcarte)%>%tally()%>%pull(numcarte)
jourx<-90

for (i in listecarte){
  numcartex<-i
  onemap<-DB_CONQUETE_MAP%>%filter(jour == jourx)%>%filter(numcarte == numcartex)
  
  x<- Cartedeuxdim%>%
    mutate(pays_jourX_carte_Y = onemap$pays_conquerant [match(Cartedeuxdim$data,onemap$nom_province )])%>%
    mutate(numcarte = numcartex)%>%
    filter(ligne>150)%>%
    filter(provexiste !="mer")
  
  x2<-rbind(x,x2)
}

x2%>%
  filter(numcarte!="")%>%
  ggplot(aes(x= colonne, y = ligne, color = pays_jourX_carte_Y))+
  geom_point(shape=15)+ 
  theme(legend.position="none")+
  facet_wrap(~numcarte)

##formule 100 carte 90 jour -----
#pas encore tourner et il faut créer le dossier mais en principe ok


for (j in liste_90){
  
  x2<-Cartedeuxdim[1,]%>%mutate(pays_jourX_carte_Y ="")%>%mutate(numcarte ="")
  liste_carte<- DB_CONQUETE_MAP%>%group_by(numcarte)%>%tally()%>%pull(numcarte)
  jourx<-j
  
  
  for (i in listecarte){
    numcartex<-i
    onemap<-DB_CONQUETE_MAP%>%filter(jour == jourx)%>%filter(numcarte == numcartex)
    
    x<- Cartedeuxdim%>%
      mutate(pays_jourX_carte_Y = onemap$pays_conquerant [match(Cartedeuxdim$data,onemap$nom_province )])%>%
      mutate(numcarte = numcartex)%>%
      filter(ligne>150)%>%
      filter(provexiste !="mer")
    x2<-rbind(x,x2)
  }
  plot<- x2%>%
    filter(numcarte!="")%>%
    ggplot(aes(x= colonne, y = ligne, color = pays_jourX_carte_Y))+
    geom_point(shape=15)+ 
    theme(legend.position="none")+
    facet_wrap(~numcarte)
  
  ggsave(filename = paste0(path,"minimap_dynamique_100cartes/",jourx,"minimap.png"), 
         width = 6826, height = 3840, units = "px", plot = plot)
  
  
}

##test carte jour 0 conquis new color et heatmap -----

x<- Cartedeuxdim%>%
  mutate(pays_jourX_carte_Y = DF_liste_provinces$province_zeroconquis[match(Cartedeuxdim$data,DF_liste_provinces$nom_province )])
x%>%mutate(pays_jourX_carte_Y_chiffre = DF_Liste_pays_carte31$liste_43_alea [match(x$pays_jourX_carte_Y,DF_Liste_pays_carte31$pays_majuscule )])%>%
  filter(ligne>150)%>%
  filter(provexiste !="mer")%>%
  ggplot(aes(x= colonne, y = ligne, fill = pays_jourX_carte_Y_chiffre))+
  geom_tile()+ 
  theme(legend.position="none")+
  scale_fill_gradientn(colours = rainbow(100))
#scale_fill_gradient(low= "yellow",  high ="blue")# 1er essais couleur
scale_fill_gradient2(low = "red",mid = "yellow",high = "blue") #2e essais couleurs


##formule 100 carte 90 jour new heatmap-----



for (j in liste_90){
  
  x2<-Cartedeuxdim[1,]%>%mutate(pays_jourX_carte_Y ="")%>%mutate(numcarte ="")%>%mutate(pays_jourX_carte_Y_chiffre =0)
  liste_carte<- DB_CONQUETE_MAP%>%group_by(numcarte)%>%tally()%>%pull(numcarte)
  jourx<-j
  
  for (i in listecarte){
    numcartex<-i
    onemap<-DB_CONQUETE_MAP%>%filter(jour == jourx)%>%filter(numcarte == numcartex)
    
    x<- Cartedeuxdim%>%
      mutate(pays_jourX_carte_Y = onemap$pays_conquerant [match(Cartedeuxdim$data,onemap$nom_province )])
    x<-x%>%
      mutate(pays_jourX_carte_Y_chiffre = DF_Liste_pays_carte31$liste_43_alea [match(x$pays_jourX_carte_Y,DF_Liste_pays_carte31$pays_majuscule )])%>%
      mutate(numcarte = numcartex)%>%
      filter(ligne>150)%>%
      filter(provexiste !="mer")
    print(paste0(i,jourx))
    x2<-rbind(x,x2)
  }
  plot<- x2%>%
    filter(numcarte!="")%>%
    ggplot(aes(x= colonne, y = ligne, fill = pays_jourX_carte_Y_chiffre))+
    geom_tile()+ 
    theme(legend.position="none")+
    facet_wrap(~numcarte)+scale_fill_gradient(low= "white", high ="blue")
  
  
  ggsave(filename = paste0(path,"minimap_dynamique_100cartes/",jourx,"minimap.png"), 
         width = 6826, height = 3840, units = "px", plot = plot)
  
  
}


## list file names and read in
imgs <- list.files(paste0(path,"minimap_dynamique_100cartes"), full.names = TRUE) #on trouve la liste des fichiers du dossier
img_list <- lapply(imgs, image_read)

## join the images together
img_joined <- image_join(img_list) #on fait un gif

## animate at 0.5 frames per second
img_animated <- image_animate(img_joined, fps = 0.5)

## view animated image
img_animated

## save to disk
image_write(image = img_animated,
            path = paste0(dir_out, "/image.gif"))

gc()














## Outils ----
x<- DATABASE_B%>%filter(numcarte == "5831550")%>%select(jour, article_body_text)
DATABASE_B%>%glimpse()
x<- DATABASE_B%>%
  filter(str_detect(article_body_text,"espion"))%>%select(article_body_text)

x<-DATABASE_B%>%group_by(numcarte)%>%tally()

x<-4
(x==2 | x==2)
t[,1]
~