## .png
png(file="file.png", width=640, height=640, res=300)
dev.off()

## .eps (for latex)
postscript(
  file="file.eps", width = 5, height = 5,
  horizontal = FALSE, onefile = FALSE, paper = "special",
  family = "Courier"  ## see - names(postscriptFonts())
)
dev.off()

## .pdf
pdf(
  file="file.pdf", width = 5, height = 5,
  pointsize = 10, family = "Courier"
)
dev.off()

