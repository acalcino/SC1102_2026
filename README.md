# Tutorial materials for SC1102 / SC1109 — R Bootcamp

Developed by Andrew Calcino, James Cook University.

Live site: **<https://acalcino.github.io/SC1102_2026/>**

A three-week R bootcamp for first-year students with no programming background. It sits between an
Excel-based population growth/fisheries modelling section and a final section in which students use R to
model El Niño events from public datasets. The aim is that the final section can focus on the science
rather than on teaching R from scratch.

Each week runs as a one hour lecture, a two hour practical (the tutorials in this repository), and a
one hour synthesis session.

The same three tutorials are published for two subject codes, **SC1102** and **SC1109**.

| Week | Topic | Tutorial | Status |
|---|---|---|---|
| 1 | Meet R — your first commands | [`SC1102_Tutorial_1/week_1.Rmd`](SC1102_Tutorial_1/week_1.Rmd) · [`SC1109_Tutorial_1/week_1.Rmd`](SC1109_Tutorial_1/week_1.Rmd) | written |
| 2 | Writing scripts and reproducibility | [`SC1102_Tutorial_2/week_2.Rmd`](SC1102_Tutorial_2/week_2.Rmd) · [`SC1109_Tutorial_2/week_2.Rmd`](SC1109_Tutorial_2/week_2.Rmd) | outline |
| 3 | Building your own RMarkdown document | [`SC1102_Tutorial_3/week_3.Rmd`](SC1102_Tutorial_3/week_3.Rmd) · [`SC1109_Tutorial_3/week_3.Rmd`](SC1109_Tutorial_3/week_3.Rmd) | outline |

## Repository layout

```
SC1102_2026/
├── _config.yml            Jekyll config (slate remote theme)
├── index.md               the landing page
├── README.md              this file
├── SC1102_2026.Rproj      open this in RStudio
├── SC1102_Tutorial_1/
│   ├── week_1.Rmd         source — edit this
│   ├── week_1.html        knitted output — served by the site
│   ├── fisheries.csv      2000 catch records
│   ├── fisheries.xlsx     the same data as a workbook
│   └── images/
├── SC1102_Tutorial_2/
├── SC1102_Tutorial_3/
├── SC1109_Tutorial_1/     SC1109 mirror of the above
├── SC1109_Tutorial_2/
└── SC1109_Tutorial_3/
```

## Working on this

Open `SC1102_2026.Rproj` in RStudio, edit the `.Rmd` file for the week you are working on, and press
**Knit**. Commit both the `.Rmd` and the regenerated `.html` — the site serves the HTML, so a change
that isn't knitted won't appear.

To rebuild everything from the command line:

```r
for (code in c("SC1102", "SC1109")) {
  rmarkdown::render(sprintf("%s_Tutorial_1/week_1.Rmd", code))
  rmarkdown::render(sprintf("%s_Tutorial_2/week_2.Rmd", code))
  rmarkdown::render(sprintf("%s_Tutorial_3/week_3.Rmd", code))
}
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
Eight vessels across several reef sites.

Note that `legal_size` arrives as the strings `"True"`/`"False"` and `date` as text — both are
deliberate, and fixing them is part of the Week 1 tutorial.
