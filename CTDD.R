#' CTD Descriptors - Distribution
#'
#' This function calculates the Distribution descriptor of the
#' CTD descriptors (dim: 120).
#'
#' @param x A character vector, as the input protein sequence.
#'
#' @return A length 120 named vector
#'



extractCTDD_BAC <- function(x) {
  
  AADict <- c(
    "A", "C", "D", "E", "F", "G", "H", "I",
    "L", "K", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "Y" 
  )
  
  if (all(strsplit(x, split = "")[[1]] %in% AADict) == FALSE) {
    stop("x has unrecognized amino acid type")
  }
  
  group1 <- list(
    "hydrophobicity" = c("R", "K", "E", "D", "Q", "N"),
    "normwaalsvolume" = c("G", "A", "S", "T", "P", "D", "C"),
    "polarity" = c("L", "I", "F", "W", "C", "M", "V", "Y"),
    "polarizability" = c("G", "A", "S", "D", "T"),
    "charge" = c("K", "R"),
    "secondarystruct" = c("E", "A", "L", "M", "Q", "K", "R", "H"),
    "solventaccess" = c("A", "L", "F", "C", "G", "I", "V", "W"),
    "surfacetension" = c("G", "Q", "D", "N", "A", "H", "R")
  )
  
  group2 <- list(
    "hydrophobicity" = c("G", "A", "S", "T", "P", "H", "Y"),
    "normwaalsvolume" = c("N", "V", "E", "Q", "I", "L"),
    "polarity" = c("P", "A", "T", "G", "S"),
    "polarizability" = c("C", "P", "N", "V", "E", "Q", "I", "L"),
    "charge" = c(
      "A", "N", "C", "Q", "G", "H", "I", "L",
      "M", "F", "P", "S", "T", "W", "Y", "V"
    ),
    "secondarystruct" = c("V", "I", "Y", "C", "W", "F", "T"),
    "solventaccess" = c("R", "K", "Q", "E", "N", "D"),
    "surfacetension" = c("K", "T", "S", "E", "C")
  )
  
  group3 <- list(
    "hydrophobicity" = c("C", "L", "V", "I", "M", "F", "W"),
    "normwaalsvolume" = c("M", "H", "K", "F", "R", "Y", "W"),
    "polarity" = c("H", "Q", "R", "K", "N", "E", "D"),
    "polarizability" = c("K", "M", "H", "F", "R", "Y", "W"),
    "charge" = c("D", "E"),
    "secondarystruct" = c("G", "N", "P", "S", "D"),
    "solventaccess" = c("M", "S", "P", "T", "H", "Y"),
    "surfacetension" = c("I", "L", "M", "F", "P", "W", "Y", "V")
  )
  
  
  xSplitted <- strsplit(x, split = "")[[1]]
  n <- nchar(x)
  
  G <- vector("list", 8)
  for (i in 1:8) G[[i]] <- rep(NA, n)
  
  # Get groups for each property & each amino acid
  
  for (i in 1:8) {
    try(G[[i]][which(xSplitted %in% group1[[i]])] <- "G1")
    try(G[[i]][which(xSplitted %in% group2[[i]])] <- "G2")
    try(G[[i]][which(xSplitted %in% group3[[i]])] <- "G3")
  }
  
  # Compute Distribution
  
  D <- vector("list", 8)
  for (i in 1:8) D[[i]] <- matrix(ncol = 5, nrow = 3)
  
  for (i in 1:8) {
    for (j in 1:3) {
      inds <- which(G[[i]] == paste0("G", j))
      quartiles <- floor(length(inds) * c(0.25, 0.5, 0.75))
      
      quartiles[which(quartiles <= 0)] <- 1
      
      D[[i]][j, ] <- if (length(inds) > 0) {
        (inds[c(1, quartiles, length(inds))]) * 100 / n
      } else {
        0
      }
    }
  }
  
  D <- do.call(rbind, D)
  D <- as.vector(t(D))
  
  names(D) <- paste(
    rep(paste("prop", 1:8, sep = ""), each = 15),
    rep(rep(c(".G1", ".G2", ".G3"), each = 5), times = 8),
    rep(paste(".residue", c("0", "25", "50", "75", "100"), sep = ""), times = 24),
    sep = ""
  )
  
  flag<-matrix(0,120,1)
  lc<-c()
  
  i<-1
  while(i<=15){
    #print(i)
    
    if(flag[i,1]==0){
      z<-i
      count<-1
      while(count<=3){
        # print(z)
        lc<-c(lc,D[[z]])
        flag[z,1]<-1
        z<-z+5
        count<-count+1
      }
    }
    i<-i+1
    #print(i)
  }
  
 # lc 
  
  i<-16
  while(i<=30){
    #print(i)
    
    if(flag[i,1]==0){
      z<-i
      count<-1
      while(count<=3){
        # print(z)
        lc<-c(lc,D[[z]])
        flag[z,1]<-1
        z<-z+5
        count<-count+1
      }
    }
    i<-i+1
    #print(i)
  }
  
 # lc
  
  i<-31
  while(i<=45){
    #print(i)
    
    if(flag[i,1]==0){
      z<-i
      count<-1
      while(count<=3){
        # print(z)
        lc<-c(lc,D[[z]])
        flag[z,1]<-1
        z<-z+5
        count<-count+1
      }
    }
    i<-i+1
    #print(i)
  }
  
 # lc
  
  i<-46
  while(i<=60){
    #print(i)
    
    if(flag[i,1]==0){
      z<-i
      count<-1
      while(count<=3){
        # print(z)
        lc<-c(lc,D[[z]])
        flag[z,1]<-1
        z<-z+5
        count<-count+1
      }
    }
    i<-i+1
    #print(i)
  }
  
  #lc
  
  
  i<-61
  while(i<=75){
    #print(i)
    
    if(flag[i,1]==0){
      z<-i
      count<-1
      while(count<=3){
        # print(z)
        lc<-c(lc,D[[z]])
        flag[z,1]<-1
        z<-z+5
        count<-count+1
      }
    }
    i<-i+1
    #print(i)
  }
  
  #lc
  
  
  i<-76
  while(i<=90){
    #print(i)
    
    if(flag[i,1]==0){
      z<-i
      count<-1
      while(count<=3){
        # print(z)
        lc<-c(lc,D[[z]])
        flag[z,1]<-1
        z<-z+5
        count<-count+1
      }
    }
    i<-i+1
    #print(i)
  }
  
  #lc
  
  
  
  i<-91
  while(i<=105){
    #print(i)
    
    if(flag[i,1]==0){
      z<-i
      count<-1
      while(count<=3){
        # print(z)
        lc<-c(lc,D[[z]])
        flag[z,1]<-1
        z<-z+5
        count<-count+1
      }
    }
    i<-i+1
    #print(i)
  }
  
  #lc
  
  
  
  
  i<-106
  while(i<=120){
    #print(i)
    
    if(flag[i,1]==0){
      z<-i
      count<-1
      while(count<=3){
        # print(z)
        lc<-c(lc,D[[z]])
        flag[z,1]<-1
        z<-z+5
        count<-count+1
      }
    }
    i<-i+1
    #print(i)
  }
  
  #lc
  
  return (lc)
}


