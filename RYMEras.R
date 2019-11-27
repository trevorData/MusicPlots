setwd('~/Projects/RYMEras')

library(dplyr)
library(tm)
library(ggplot2)
library(ggrepel)

# Load and format raw data
raw.data <- read.csv("fulldata.csv", encoding = 'UTF-8')
names(raw.data)[1] <- "folder"

data <- 
  raw.data %>% 
  select(-c(artist, release_date, score, num_ratings, genre1, genre2, genre3, sec_genre1,sec_genre2, sec_genre3, sec_genre4))

# Replace spaces with underscores in descriptor names
desc.formatted <- 
  data %>% 
  select(-c('folder', 'album')) %>% 
  lapply(function(x) {gsub(' ', '_', x)}) %>%
  data.frame

# Binary Encode descriptors
full.desc <- desc.formatted %>% apply(1, paste, collapse=" ")
corpus <- full.desc %>% VectorSource %>% VCorpus
dtm <- corpus %>% DocumentTermMatrix

# Merge to album names
desc.encoded <- dtm %>% as.matrix %>% as.data.frame
data <- data %>% select('folder', 'album') %>% cbind(desc.encoded)

#############
# Plot data #
#############

artists <- c('Ambient', 'Animal Collective', 'Beatles', 'Bjork', 'Bob Dylan', 'David Bowie', 'Death Grips', 'Death Metal', 'Emo',
             'Kanye', 'Leonard Cohen','Pink Floyd', 'Post Hardcore', 'Post Rock', 'Radiohead', 'Shoegaze', 'Swans', 'Weezer')

colors <- c('tan1', 'springgreen4', 'violetred', 'dodgerblue', 'seagreen3', 'seagreen', 'slateblue', 'red4', 'dodgerblue',
            'goldenrod2', 'tomato', 'orangered', 'orange', 'darkgreen', 'aquamarine4', 'coral1', 'goldenrod4', 'royalblue1')

names(colors) <- artists

for (artist in artists) {
  # Subset for given artist/genre
  df <- data[data$folder == artist,] %>% select(-c('folder'))
  rownames(df) <- df$album
  df <- df %>% select(-c('album'))
  
  # PCA - all features are already on same scale so no need to normalize
  pr.out <- df %>% prcomp(scale=F, rank = 2)
  
  # New coordinates for each album
  pca.coord <- pr.out$x %>% data.frame
  
  # The linear combinations of the original descriptors used to make the principal components
  desc <- pr.out$rotation %>% data.frame
  
  # Names of descriptors that have the highest constants in each component
  pc1.pos1 <- desc[(desc$PC1 %>% order(decreasing = T))[1],] %>% row.names
  pc1.pos2 <- desc[(desc$PC1 %>% order(decreasing = T))[2],] %>% row.names
  pc1.pos3 <- desc[(desc$PC1 %>% order(decreasing = T))[3],] %>% row.names
  
  pc1.neg1 <- desc[(desc$PC1 %>% order(decreasing = F))[1],] %>% row.names
  pc1.neg2 <- desc[(desc$PC1 %>% order(decreasing = F))[2],] %>% row.names
  pc1.neg3 <- desc[(desc$PC1 %>% order(decreasing = F))[3],] %>% row.names
  
  pc2.pos1 <- desc[(desc$PC2 %>% order(decreasing = T))[1],] %>% row.names
  pc2.pos2 <- desc[(desc$PC2 %>% order(decreasing = T))[2],] %>% row.names
  pc2.pos3 <- desc[(desc$PC2 %>% order(decreasing = T))[3],] %>% row.names
  
  pc2.neg1 <- desc[(desc$PC2 %>% order(decreasing = F))[1],] %>% row.names
  pc2.neg2 <- desc[(desc$PC2 %>% order(decreasing = F))[2],] %>% row.names
  pc2.neg3 <- desc[(desc$PC2 %>% order(decreasing = F))[3],] %>% row.names
  
  # very big space
  x.space <- '                                                                                               '
  y.space <- '                                                '
  
  # use the descriptor names in the axis labels
  y.lab <- paste(pc2.neg1, ', ', pc2.neg2, ', ', pc2.neg3,' ←', y.space, 
                 '→ ', pc2.pos1, ', ', pc2.pos2, ', ', pc2.pos3, sep = '')
  
  x.lab <- paste(pc1.neg1, ', ', pc1.neg2, ', ', pc1.neg3,' ←', x.space, 
                 '→ ', pc1.pos1, ', ', pc1.pos2, ', ', pc1.pos3, sep = '')
  
  # Plot
  ggplot(pca.coord, aes(x = PC1, y = PC2)) +
    geom_text_repel(aes(label = rownames(pca.coord)), 
                    size=4,
                    point.padding = .25, 
                    min.segment.length = 1) +
    geom_point(color = colors[[artist]], 
               size = 3) + 
    ylab(y.lab) +
    xlab(x.lab) +
    ggtitle(artist) +
    theme(axis.title = element_text(size = 9.5),
          title = element_text(size = 20),
          axis.text = element_blank(),
          axis.ticks = element_blank(), 
          axis.line = element_line(), panel.background = element_blank())
  
  # Save
  paste(artist, '.png', sep = '') %>% 
    ggsave(device = 'png', height = 7, width = 11)
}
