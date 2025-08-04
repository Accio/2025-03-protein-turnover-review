receptor_0 <- function(k_syn, k_deg) {
  return(k_syn/k_deg)
}

r_0 <- homeostasis_abundance <- receptor_0


receptor_star <- function(k_syn, k_deg, k_eRL) {
  r_0 <- receptor_0(k_syn, k_deg)
  r_star <- k_deg / k_eRL * r_0
  return(r_star)
}

r_star <- receptor_star

michaelis_menton_constant <- function(k_on, k_off, k_eRL) {
  k_m <- (k_off + k_eRL)/k_on
  return(k_m)
}

ec_50 <- function(k_on, k_off, k_eRL,
                  k_deg) {
  k_m <- michaelis_menton_constant(k_on=k_on, k_off=k_off, k_eRL=k_eRL)
  L50 <- k_deg / k_eRL * k_m
  return(L50)
}

l_50 <- ec_50

rl_ss <- function(l_ss,
                  k_on, k_off,
                  k_syn, k_deg, k_eRL) {
  r_star <- r_star(k_syn=k_syn, k_deg=k_deg, k_eRL)
  l_50 <- ec_50(k_on=k_on, k_off=k_off,
                k_eRL=k_eRL, k_deg=k_deg)
  res <- r_star * l_ss/(l_ss + l_50)
  return(res)
}

r_ss <- function(l_ss,
                 k_on, k_off,
                 k_syn, k_deg, k_eRL) {
  r_0 <- r_0(k_syn=k_syn, k_deg=k_deg)
  L_50 <- ec_50(k_on=k_on, k_off=k_off, k_eRL=k_eRL,
                k_deg=k_deg)
  res <- r_0 * L_50/(l_ss + L_50)
  return(res)
}

response_func <- function(k_syn=10, k_deg=1E-6, k_eRL=1E-6,
                          k_on=7.6E5, k_off=2.8, rho=0.8,
                          E0_r0_ratio=0.1,
                          L_start=1E-12, L_end=1, length.out=100) {
  r_0 <- homeostasis_abundance(k_syn, k_deg)
  E_0 <- r_0 * E0_r0_ratio
  E_max <- rho * k_syn/k_eRL
  EC_50 <- k_deg/k_eRL * (k_off + k_eRL)/k_on
  ligand_pConc <- seq(-log10(L_start), -log10(L_end), 
                      length.out=length.out)
  ligand_conc <- 10^-ligand_pConc
  response <- E_0 + E_max * ligand_conc/(EC_50 + ligand_conc)
  norm_response <- (response-E_0)/E_max
  res <- data.frame(k_syn=k_syn,
                    k_deg=k_deg,
                    k_eRL=k_eRL,
                    k_on=k_on,
                    k_off=k_off,
                    rho=rho,
                    E_max=E_max,
                    E_0 = E_0,
                    EC_50=EC_50,
                    ligand_conc=ligand_conc,
                    ligand_pConc=ligand_pConc,
                    response=response,
                    norm_response=norm_response)
  return(res)
}

empty_theme <-  theme(panel.grid = element_blank(),
        panel.border = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank(),
        legend.position = "none",
        axis.title = element_text(size=18),
        axis.line.x = element_line(arrow = grid::arrow(length = unit(0.3, "cm"))),
        axis.line.y = element_line(arrow = grid::arrow(length = unit(0.3, "cm"))))

empty_theme_withXaxis <-  theme(panel.grid = element_blank(),
                                panel.border = element_blank(),
                                axis.ticks.y = element_blank(),
                                axis.text.y = element_blank(),
                                axis.text.x = element_text(size=13),
                                legend.position = "none",
                                axis.title = element_text(size=15),
                                axis.line.x = element_line(arrow = grid::arrow(length = unit(0.3, "cm"))),
                                axis.line.y = element_line(arrow = grid::arrow(length = unit(0.3, "cm"))))
