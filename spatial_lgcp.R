load("/Users/felipedzul/Library/CloudStorage/OneDrive-Personal/proyects/geocoding_mex/2024/8.RData/denmex_2024.RData")

# Step 2. set the onset variable
z_acum <- z |>
    dplyr::mutate(onset = lubridate::ymd(FEC_INI_SIGNOS_SINT)) |>
    dplyr::filter(ESTATUS_CASO %in% c(1, 2))  |>
    dplyr::mutate(x = long, y = lat)

# 2. Aplicar the lgcp ####
111.132 * 0.1     # 11.132 km
111.132 * 0.025   # 2.7 km
111.132 * 0.009   # 1.00 km
111.132 * 0.005   # 500 metros
111.132 * 0.001   # 100 metros
lgcp_acum <- denhotspots::spatial_lgcp(dataset = z_acum,
                                     locality = "León de Aldama",
                                     cve_edo = "11",
                                     longitude = "long",
                                     latitude = "lat",
                                     k = 40,
                                     plot = FALSE,
                                     aproximation = "gaussian",
                                     integration = "eb",
                                     resolution = 0.025,  # 2.7km
                                     approach = "lattice",
                                     cell_size = 1000,
                                     name = "YlGnBu")

#lattice$gg_mesh
lgcp_acum$map

#######
z_month <- z |>
    dplyr::mutate(onset = lubridate::ymd(FEC_INI_SIGNOS_SINT)) |>
    dplyr::filter(ESTATUS_CASO %in% c(1, 2))  |>
    dplyr::mutate(x = long, y = lat) |>
    dplyr::filter(SEM %in% c(seq(from = lubridate::epiweek(Sys.Date())-5, 
                                 to = lubridate::epiweek(Sys.Date()),
                                 by = 1)))

lgcp_month <- denhotspots::spatial_lgcp(dataset = z_month,
                                     locality = "León de Aldama",
                                     cve_edo = "11",
                                     longitude = "long",
                                     latitude = "lat",
                                     k = 40,
                                     plot = FALSE,
                                     aproximation = "gaussian",
                                     integration = "eb",
                                     resolution = 0.025,  # 2.7km
                                     approach = "lattice",
                                     cell_size = 1000,
                                     name = "YlGnBu")
lgcp_month$map


#######
z_3week <- z |>
    dplyr::mutate(onset = lubridate::ymd(FEC_INI_SIGNOS_SINT)) |>
    dplyr::filter(ESTATUS_CASO %in% c(1, 2))  |>
    dplyr::mutate(x = long, y = lat) |>
    dplyr::filter(SEM %in% c(seq(from = lubridate::epiweek(Sys.Date())-3, 
                                 to = lubridate::epiweek(Sys.Date()),
                                 by = 1)))


lgcp_3week <- denhotspots::spatial_lgcp(dataset = z_3week,
                                        locality = "León de Aldama",
                                        cve_edo = "11",
                                        longitude = "long",
                                        latitude = "lat",
                                        k = 40,
                                        plot = FALSE,
                                        aproximation = "gaussian",
                                        integration = "eb",
                                        resolution = 0.025,  # 2.7km
                                        approach = "lattice",
                                        cell_size = 1000,
                                        name = "YlGnBu")
lgcp_3week$map





