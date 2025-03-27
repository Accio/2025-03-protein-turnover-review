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
