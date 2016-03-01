#CHRISTOPHER M. CHURCH
#UNIVERSITY OF NEVADA, RENO

require(ggplot2)
sugar <- read.csv("I:/Dropbox/UNR Sync/Book Proposal/1st round peer review/graph/sugar.csv")
attach(sugar)

g <- ggplot(sugar, aes(YEAR,M,G))

#Lines
g <- g + geom_line(aes(y=M, colour="Martinique"))
g <- g + geom_line(aes(y=G, colour="Guadeloupe"))

#Points
g <- g + geom_point(aes(y=M, colour="Martinique", shape="Martinique",size="Martinique"))
g <- g + geom_point(aes(y=G, colour="Guadeloupe",shape="Guadeloupe",size="Guadeloupe"))

#Smooth Line (Trend)
g <- g + geom_smooth(method="loess",size=1, color="black",alpha=0.1,linetype="dashed")

#Legend
g <- g + scale_colour_manual("Legend",breaks = c("Martinique","Guadeloupe"), values = c("black", "darkgray"))
#g <- g + scale_linetype_manual("Legend",breaks = c("Martinique","Guadeloupe"),values=c(1,2))
g <- g + scale_shape_manual("Legend",breaks = c("Martinique","Guadeloupe"),values=c(16,2))
g <- g + scale_size_manual("Legend",breaks = c("Martinique","Guadeloupe"),values=c(1,2))

#Scale
g <- g + scale_x_continuous("",breaks = round(seq(min(YEAR), max(YEAR), by = 5)))

#Options
g <- g + ggtitle("Sugar Production in the French Antilles (1835-1916)")
g <- g + ylab("Tons of Sugar")

g <- g + theme_bw()
g

