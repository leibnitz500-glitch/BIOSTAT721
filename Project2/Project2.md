---
title: "Air Pollution Patterns at RDU Airport"
author: "Yan Yan"
date: "November 22, 2026"
output:
  word_document:
    reference_docx: reference.docx
    keep_md: true
---



GitHub repository: [BIOSTAT721](https://github.com/leibnitz500-glitch/BIOSTAT721)

# Purpose and data preparation

This project describes daily CO, PM2.5, and O3 measurements from the EPA monitor at RDU airport during 2018, 2019, and January-April 2020. These patterns provide an exposure summary for the proposed study of air pollution and sickle cell disease in Durham County.

I removed identical rows, converted negative measurements to zero, and then averaged the remaining measurements within each day. Removing duplicates first prevents repeated records from receiving extra weight; correcting negatives before averaging prevents a measurement error from lowering the daily mean. Missing measurements remain missing, including four dates absent from the 2018 file, and O3 is reported in ppm unless the function's user requests ppb.

# Daily concentration ranges

Table: Table 1. Daily concentration ranges in 2018.

|Pollutant        | Minimum| Maximum|
|:----------------|-------:|-------:|
|CO (ppm)         |   0.100|   1.000|
|PM2.5 (ug/m3 LC) |   0.000|  20.400|
|O3 (ppm)         |   0.012|   0.067|


Table: Table 2. Daily concentration ranges in 2019.

|Pollutant        | Minimum| Maximum|
|:----------------|-------:|-------:|
|CO (ppm)         |   0.100|   1.300|
|PM2.5 (ug/m3 LC) |   1.400|  21.300|
|O3 (ppm)         |   0.015|   0.068|


Table: Table 3. Daily concentration ranges in January-April 2020.

|Pollutant        | Minimum| Maximum|
|:----------------|-------:|-------:|
|CO (ppm)         |   0.100|   1.000|
|PM2.5 (ug/m3 LC) |   0.300|  31.200|
|O3 (ppm)         |   0.010|   0.052|

```{=openxml}
<w:p><w:r><w:br w:type="page"/></w:r></w:p>
```

# Monthly CO and ozone patterns

![](figures/co-ozone-1.png)<!-- -->

I used separate panels with different y-axis scales because CO concentrations are much larger than O3 concentrations. This makes both seasonal patterns readable while retaining ppm for both pollutants.

For each month, I pooled all available daily values across years and calculated the mean and 95% confidence interval as mean +/- 1.96 x SD / sqrt(n), where n counts non-missing daily values. January-April include three years, while May-December include two.

```{=openxml}
<w:p><w:r><w:br w:type="page"/></w:r></w:p>
```

# PM2.5 by month and year

![](figures/pm25-1.png)<!-- -->

I connected the monthly averages so I could see how PM2.5 changed from one month to the next within each year.

# Interpretation

CO was highest in late fall and winter, while O3 was highest in spring and summer, with the pooled O3 mean peaking in June. In January and February, average PM2.5 was lower in 2020 than in the same months of 2018 and 2019, even though the highest daily PM2.5 value occurred in 2020. The 2020 data end in April, so only 2018 and 2019 contribute to the May–December averages.

# AI use statement

I used ChatGPT to discuss the project questions and analysis plan, then generate initial R code and draft explanations based on that discussion. I reviewed the code and results, asked for revisions, and made changes to better match the project requirements and my understanding. The final report reflects these rounds of review and revision.
