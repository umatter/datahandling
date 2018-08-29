source("common.R")

# Vectors

pdf("numvec.pdf",
    width=cell + 2*margin,
    height=3*cell + 2*margin)
pushViewport(viewport(layout=grid.layout(3, 1,
                        widths=cellSize,
                        heights=cellSize),
                      gp=gpar(fill="grey90")))
for (i in 1:3) {
    pushViewport(viewport(layout.pos.row=i))
    grid.rect()
    grid.text(i)
    popViewport()
}
popViewport()
dev.off()

pdf("charvec.pdf",
    width=cell + 2*margin,
    height=3*cell + 2*margin)
pushViewport(viewport(layout=grid.layout(3, 1,
                        widths=cellSize,
                        heights=cellSize),
                      gp=gpar(fill="grey90")))
for (i in 1:3) {
    pushViewport(viewport(layout.pos.row=i))
    grid.rect()
    grid.text(letters[i])
    popViewport()
}
popViewport()
dev.off()

pdf("logvec.pdf",
    width=cell + 2*margin,
    height=3*cell + 2*margin)
pushViewport(viewport(layout=grid.layout(3, 1,
                        widths=cellSize,
                        heights=cellSize),
                      gp=gpar(fill="grey90")))
for (i in 1:3) {
    pushViewport(viewport(layout.pos.row=i))
    grid.rect()
    grid.text(c("T", "F")[i %% 2 + 1])
    popViewport()
}
popViewport()
dev.off()

# Factor

pdf("factor.pdf",
    width=cell + 2*margin,
    height=3*cell + 2*margin)
pushViewport(viewport(layout=grid.layout(3, 1,
                        widths=cellSize,
                        heights=cellSize),
                      gp=gpar(fill="grey90")))
for (i in 1:3) {
    pushViewport(viewport(layout.pos.row=i))
    grid.rect(gp=gpar(fill=c("grey90", "grey60")[i %% 2 + 1]))
    grid.text(c("M", "F")[i %% 2 + 1],
              gp=gpar(col=c("black", "black")[i %% 2 + 1],
                fontface=c("plain", "bold")[i %% 2 + 1]))
    popViewport()
}
popViewport()
dev.off()


# Matrix

pdf("matrix.pdf",
    width=3*cell + 2*margin,
    height=3*cell + 2*margin)
pushViewport(viewport(layout=grid.layout(3, 3,
                        widths=cellSize,
                        heights=cellSize),
                      gp=gpar(fill="grey90")))
for (i in 1:3) {
    for (j in 1:3) {
        pushViewport(viewport(layout.pos.row=i,
                              layout.pos.col=j))
        grid.rect()
        grid.text((j - 1)*3 + i)
        popViewport()
    }
}
popViewport()
dev.off()

# Array

pdf("array.pdf",
    width=3*cell + 4*margin,
    height=3*cell + 4*margin)
for (k in 3:1) {
    pushViewport(viewport(x=k*marginSize,
                          y=unit(1, "npc") - k*marginSize,
                          just=c("left", "top")))
    pushViewport(viewport(layout=grid.layout(3, 3,
                            widths=cellSize,
                            heights=cellSize,
                            just=c("left", "top")),
                          gp=gpar(fill="grey90")))
    for (i in 1:3) {
        for (j in 1:3) {
            pushViewport(viewport(layout.pos.row=i,
                                  layout.pos.col=j))
            grid.rect()
            if (k == 1)
                grid.text((j - 1)*3 + i)
            popViewport()
        }
    }
    popViewport(2)
}
dev.off()

# Data frame

pdf("df.pdf",
    width=3*cell + 4*margin,
    height=3.5*cell + 2*margin)
pushViewport(viewport(layout=grid.layout(4, 5,
                        widths=unit.c(cellSize, marginSize),
                        heights=unit.c(0.5*cellSize,
                          rep(cellSize, 3))),
                      gp=gpar(fill="grey90")))
grid.move.to(.5, 1,
            vp=viewport(layout.pos.row=1,
              layout.pos.col=1))
grid.line.to(.5, 1,
            vp=viewport(layout.pos.row=1,
              layout.pos.col=5))
for (j in c(1, 3, 5)) {
    pushViewport(viewport(layout.pos.row=1,
                          layout.pos.col=j))
    grid.segments(.5, 1, .5, -.5)
    grid.circle(.5, 1, r=unit(.5, "mm"), gp=gpar(fill="black"))
    popViewport()
    for (i in 1:3) {
        pushViewport(viewport(layout.pos.row=i + 1,
                              layout.pos.col=j))
        grid.rect()
        if (j == 1) {
            grid.text(i)
        } else if (j == 3) {
            grid.rect(gp=gpar(fill=c("grey90", "grey60")[i %% 2 + 1]))
            grid.text(c("M", "F")[i %% 2 + 1],
                      gp=gpar(col=c("black", "black")[i %% 2 + 1],
                        fontface=c("plain", "bold")[i %% 2 + 1]))
        } else {
            grid.text(letters[i])
        }
        popViewport()
    }
}
popViewport()
dev.off()

# List

pdf("list.pdf",
    width=3*cell + 4*margin,
    height=3.5*cell + 2*margin)
pushViewport(viewport(layout=grid.layout(4, 5,
                        widths=unit.c(cellSize, marginSize),
                        heights=unit.c(0.5*cellSize,
                          rep(cellSize, 3))),
                      gp=gpar(fill="grey90")))
grid.move.to(.5, 1,
            vp=viewport(layout.pos.row=1,
              layout.pos.col=1))
grid.line.to(.5, 1,
            vp=viewport(layout.pos.row=1,
              layout.pos.col=5))
for (j in c(1, 3, 5)) {
    pushViewport(viewport(layout.pos.row=1,
                          layout.pos.col=j))
    grid.segments(.5, 1, .5, -.5)
    grid.circle(.5, 1, r=unit(.5, "mm"), gp=gpar(fill="black"))
    popViewport()
    for (i in 1:3) {
        pushViewport(viewport(layout.pos.row=i + 1,
                              layout.pos.col=j))
        if (j == 5 && i < 3) {
            grid.rect()
            grid.text(i)
        } else if (j == 3 && i < 2) {
            grid.rect()
            grid.text(letters[i])
        } else if (j == 1) {
            grid.rect(gp=gpar(fill=c("grey90", "grey60")[i %% 2 + 1]))
            grid.text(c("M", "F")[i %% 2 + 1],
                      gp=gpar(col=c("black", "black")[i %% 2 + 1],
                        fontface=c("plain", "bold")[i %% 2 + 1]))
        }
        popViewport()
    }
}
popViewport()
dev.off()

# General "class"

pdf("class.pdf",
    width=3*cell + 2*margin,
    height=2*cell + 2*margin)
grid.rect(width=4*cellSize, height=3*cellSize,
          gp=gpar(fill="black"))
grid.text("class", gp=gpar(col="white", fontface="bold", cex=1.5))
dev.off()

# Empty

pdf("empty.pdf",
    width=2*cell + 2*margin,
    height=2*cell + 2*margin)
grid.rect(gp=gpar(col=NA))
dev.off()


# Postscript versions
for (i in list.files(pattern="[.]pdf$")) {
    embedFonts(i,
               fontpaths=file.path("..",
                 "cm-lgc", "fonts", "type1", "public", "cm-lgc"))
    system(paste("pdf2ps", i))
}
