# Required-topic coverage map

Tracking where each required syllabus topic lands now that the bootcamp is **three weeks**
(intro → scripts/reproducibility → RMarkdown) rather than the earlier
intro → wrangling → functions/plots plan. Written 2026-08-18.

Legend: **done** = written and knitting · **outlined** = in the Week 2/3 skeleton, prose not written ·
**gap** = not covered anywhere yet.

| # | Required topic | Week | Status | Where |
|---|---|---|---|---|
| 1 | Reading in data from a CSV file | 1 | done | `read.csv("fisheries.csv")` |
| 2 | Reading in data from Excel | 2 | outlined | Step 7, `readxl::read_excel()` on `fisheries.xlsx` |
| 3 | Using comments | 1 | done | taught at first use, `#` explained explicitly |
| 4 | Defining variable names | 1 | **partial** | good names are *used* (`kpl`, `mean_bmi`) but naming is never *taught*. `x`/`y`/`z` appear as throwaways in the calculator section — worth one paragraph. |
| 5 | Indicating units in comments | 1 | **partial** | unit comments now added (`# mass in kg`, `# BMI in kg/m^2`) but the habit is never named. One sentence would fix it. |
| 6 | Writing output to screen (print, cat) | 1 | done | `print()` throughout; `cat()` via the `readLines()` raw-file peek |
| 7 | Data types — integer, character, date, float | 1 | done | `L` suffix, quoted strings, `as.Date`, numeric, plus factor and logical |
| 8 | Converting types — `as.Date` | 1 | done | on `$date` |
| 8b | Converting types — `as.numeric` | 1 | done | on `pop_stats$weight` |
| 8c | Converting types — `as.logical` | 1 | done | on `$legal_size` |
| 8d | Converting types — `as.character` | 2 | outlined | Step 4 type round-trip |
| 9 | What is a dataframe? | 1 | done | via `mtcars`, `class()`, `str()`, "equal length vectors" |
| 10 | Using `str()` with a dataframe | 1 | done | used four separate times |
| 11 | Manipulating characters — `paste()` | 2 | outlined | Step 8, site labels and dated output filenames |
| 12 | Extracting from a dataframe with `$` | 1 | done | throughout |
| 13 | Replacing/adding with `$` | 1 | done | `mtcars$kpl <-`, `$mpg = NULL`, `pop_stats$BMI <-` |
| 14 | Merging dataframes | 1 | done | `merge(..., by = "catch_id")` |
| 15 | What are functions | 2 | outlined | Step 10 — **see open decision below** |
| 16 | Defining functions | 2 | outlined | Step 10 |
| 17 | Executing functions | 1 & 2 | done / outlined | students *use* functions constantly from W1; defining them is W2 |
| 18 | Line plots | 3 | outlined | `plot(..., type = "l")` on daily mean catch weight |
| 19 | Adding x and y axis labels | 1 & 3 | done / outlined | `xlab`/`ylab` on the W1 barplot; taught properly in W3 |
| 20 | Adding titles | 3 | outlined | `main =` |
| 21 | Adding horizontal lines | 3 | outlined | `abline(h = ...)` at the season mean |
| 22 | Changing colours, line types, line widths | 3 | outlined | `col`, `lty`, `lwd` + `legend()` |

## Open decisions

**1. Where do functions live?**
Currently outlined in **Week 2, Step 10**, on the argument that "you have written the same three lines
three times — wrap them up" is a scripting-hygiene idea and belongs with scripts. But Week 2 is already
carrying projects, working directories, relative paths, script structure, restart-and-source,
break-and-fix, `readxl`, `paste()`, writing outputs, *and* `sessionInfo()`. That is a lot for two hours.
The alternative is to move functions to Week 3 as part of building the report. **Andrew's call.**

**2. Where does plotting live?**
Assumed **Week 3**, framed as "making the figures your report needs" rather than a standalone plotting
lesson. This keeps Week 3 coherent and gives the capstone report something to contain. The risk is
that plotting arrives late; the mitigation is that Week 1 already ends on a barplot, so students have
made a picture from data in their first hour.

**3. Two topics that are only half-covered (rows 4 and 5).**
Variable naming and units-in-comments are currently demonstrated but never taught. Both are cheap to
close — a short paragraph each in the Week 1 practical, or a slide in the Week 1 lecture. Left alone
rather than added unilaterally, since Week 1 is Andrew's own material.

**4. Topics the new structure adds that were not on the original list.**
Worth knowing these are now in scope: working directory and relative paths, RStudio Projects, project
folder structure, restart-and-source as a test, `write.csv()`/`png()` for programmatic outputs,
`sessionInfo()`, and the whole of RMarkdown (YAML, chunks, chunk options, inline code, knitting,
`knitr::kable`). These are the substance of Weeks 2 and 3 under the revised plan.

## Changes made to `week_1.Rmd` when porting it

The content, structure and voice are Andrew's. What changed:

1. **Hardcoded paths removed.** `/home/andrew/Documents/teaching/2026/TR3/SC1102/fisheries.csv` →
   `fisheries.csv`; same for the image. The tutorial now knits anywhere.
2. **The `{bash}` chunk now shows both operating systems, and R does the actual work.** The original
   `head fisheries.csv` would have failed for every Windows student. The section now gives three
   things: `head -n 5` for macOS/Linux and `Get-Content ... -Head 5` for Windows PowerShell (both
   `eval=FALSE`, shown but not run), followed by
   `cat(readLines("fisheries.csv", n = 5), sep = "\n")` as the portable version that actually
   executes and produces the output in the document. A short boxed note explains why Windows has no
   `head`. Note that knitr has **no PowerShell engine** (`knitr::knit_engines$get()` lists `bash`,
   `sh`, `zsh`, `awk`, `sed`… but nothing for PowerShell), so the Windows command is a plain
   ```` ```powershell ```` fenced block rather than a chunk — it is highlighted but never run.
3. **`excel_csv.png` regenerated.** The original screenshot was not in the folder. Replaced with a
   drawn diagram (spreadsheet → arrow → raw CSV text) which shows what a CSV *is*, not just which menu
   item to click. Each record sits on one line, and the CSV line numbers are aligned with the
   spreadsheet row numbers so "row 3 = line 3" reads off the picture. Source SVG is in
   `Tutorial_1/images/` if you want to edit it. Swap in a real screenshot instead if you prefer.
4. **The trailing to-do list was removed** from the bottom of the tutorial and turned into this file,
   so nothing is lost but students do not see a list of headings with no content under them.
5. **Unit comments added** to four variables (`kpl`, `weight`, `height`, `BMI`) — see row 5 above.
6. **Typos fixed:** "start of" → "start off", "without and extra libraries" → "without any extra",
   "arithemtic" → "arithmetic", "fotunately" → "fortunately", "forumla" → "formula", "modeled" →
   "modelled", "Rstudio" → "RStudio", `prop.tab()` → `prop.table()` in a comment, and a mismatched
   quote around "vectorised arithmetic".
7. **Navigation added:** a back-link to the course page at the top and a footer at the bottom.
8. **A short "Before you go" paragraph** at the end, pointing at Week 2.

Nothing else was touched. The YAML header, all chunk options (including the `results='hide'` on most
chunks, which is clearly deliberate — students should run it and see for themselves), the `mtcars` and
BMI sections and all of the prose are exactly as written.

## Verified against the real data

`fisheries.csv` — 2000 rows, 13 columns, 8 vessels. All Week 1 code paths were executed against it:
`as.Date()` on `$date` yields `Date`; `as.logical()` on the `"True"`/`"False"` strings in
`$legal_size` yields proper `TRUE`/`FALSE`; `merge()`, `table()`, `prop.table()` and both `barplot()`
calls all work. The manual mean and SD come out exactly equal to `mean()` and `sd()` on this data, so
the `==` comparison prints `TRUE` as intended and there is no floating-point surprise to explain away.
