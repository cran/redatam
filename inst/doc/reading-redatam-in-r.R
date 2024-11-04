## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----download, eval = FALSE---------------------------------------------------
#  library(redatam)
#  
#  download_microdata()

## ----eval = FALSE-------------------------------------------------------------
#  library(dplyr)
#  
#  chile2017 <- readRDS("/tmp/RtmpLdDUa5/CHILE2017.rds")
#  
#  overcrowding <- chile2017$comuna %>%
#    select(ncomuna, comuna_ref_id) %>%
#    inner_join(
#      chile2017$distrito %>%
#      select(distrito_ref_id, comuna_ref_id)
#    ) %>%
#    inner_join(
#      chile2017$area %>%
#        select(area_ref_id, distrito_ref_id)
#    ) %>%
#    inner_join(
#      chile2017$zonaloc %>%
#        select(zonaloc_ref_id, area_ref_id)
#    ) %>%
#    inner_join(
#      chile2017$vivienda %>%
#        select(zonaloc_ref_id, vivienda_ref_id, cant_per, p04) %>%
#        mutate(
#          p04 = case_when(
#            p04 == 98 ~ NA_integer_,
#            p04 == 99 ~ NA_integer_,
#            TRUE ~ p04
#          )
#        ) %>%
#        filter(!is.na(p04))
#    ) %>%
#    mutate(
#      overcrowding = case_when(
#        p04 >=1 ~ cant_per / p04,
#        p04 ==0 ~ cant_per / (p04 + 1)
#      )
#    ) %>%
#    mutate(
#      overcrowding_discrete = case_when(
#        overcrowding  < 2.5                      ~ "No Overcrowding",
#        overcrowding >= 2.5 & overcrowding < 3.5 ~ "Mean",
#        overcrowding >= 3.5 & overcrowding < 5   ~ "High",
#        overcrowding >= 5                        ~ "Critical"
#      )
#    ) %>%
#    group_by(comuna = ncomuna, overcrowding_discrete) %>%
#    count()

## ----metropolitana, eval = FALSE----------------------------------------------
#  overcrowding %>%
#    filter(comuna == "VITACURA")
#  
#  overcrowding %>%
#    filter(comuna == "LA PINTANA")

