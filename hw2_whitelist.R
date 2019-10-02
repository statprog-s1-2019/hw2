allowed_files = c("hw2.md",
                  "hw2.Rmd",
                  "hw2.Rproj",
                  "hw2_whitelist.R",
                  "README.md",
                  "data",
                  "hw2_files",
                  ".gitignore")

files = dir()
disallowed_files = files[!(files %in% allowed_files)]

if (any(disallowed_files)){
  cat("Disallowed files found:\n")
  cat("  (remove the following files from your repo)\n\n")

  for(file in files[disallowed_files])
    cat("*",file,"\n")

  quit("no",1,FALSE)
}
