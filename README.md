# Tutorial materials for SC1102 — R Bootcamp

Developed by Andrew Calcino, James Cook University.

Live site: **<https://acalcino.github.io/SC1102_2026/>**

A three-week R bootcamp for first-year students with no programming background. It sits between an
Excel-based environmental/fisheries modelling module and a final module in which students use R to
model El Niño events from public datasets. The aim is that the final module can focus on the science
rather than on teaching R from scratch.

Each week runs as a one hour lecture, a two hour practical (the tutorials in this repository), and a
one hour synthesis session.

| Week | Topic | Tutorial | Status |
|---|---|---|---|
| 1 | Meet R — your first commands | [`Tutorial_1/week_1.Rmd`](Tutorial_1/week_1.Rmd) | written |
| 2 | Writing scripts and reproducibility | [`Tutorial_2/week_2.Rmd`](Tutorial_2/week_2.Rmd) | outline |
| 3 | Building your own RMarkdown document | [`Tutorial_3/week_3.Rmd`](Tutorial_3/week_3.Rmd) | outline |

See [COVERAGE.md](COVERAGE.md) for the required-topic map, the open decisions, and a record of what
changed when Week 1 was ported into this repository.

## Repository layout

```
SC1102_2026/
├── _config.yml            Jekyll config (slate remote theme)
├── index.md               the landing page
├── README.md              this file
├── COVERAGE.md            topic coverage map and open decisions
├── SC1102_2026.Rproj      open this in RStudio
├── Tutorial_1/
│   ├── week_1.Rmd         source — edit this
│   ├── week_1.html        knitted output — served by the site
│   ├── fisheries.csv      2000 catch records
│   ├── fisheries.xlsx     the same data as a workbook
│   └── images/
├── Tutorial_2/
└── Tutorial_3/
```

## Working on this

Open `SC1102_2026.Rproj` in RStudio, edit the `.Rmd` file for the week you are working on, and press
**Knit**. Commit both the `.Rmd` and the regenerated `.html` — the site serves the HTML, so a change
that isn't knitted won't appear.

To rebuild everything from the command line:

```r
rmarkdown::render("Tutorial_1/week_1.Rmd")
rmarkdown::render("Tutorial_2/week_2.Rmd")
rmarkdown::render("Tutorial_3/week_3.Rmd")
```

Requires `rmarkdown`, `knitr` and (for Week 2 onwards) `readxl`.

## How the site is built

GitHub Pages with Jekyll, using the [slate](https://github.com/pages-themes/slate) remote theme — the
same setup as [BM2331_2025](https://github.com/acalcino/BM2331_2025). `index.md` is themed by Jekyll;
the knitted tutorial pages are self-contained HTML and are served as-is, so they carry RMarkdown's own
styling rather than the slate theme.

## Data

`fisheries.csv` — 2000 catch records with columns `catch_id`, `date`, `site`, `species`, `sex`,
`length_cm`, `weight_kg`, `gear`, `vessel`, `depth_m`, `water_temp_c`, `legal_size`, `value_aud`.
Eight vessels across several reef sites. The same data students worked with in the Excel module, so
they arrive already knowing what the columns mean.

Note that `legal_size` arrives as the strings `"True"`/`"False"` and `date` as text — both are
deliberate, and fixing them is part of the Week 1 tutorial.
