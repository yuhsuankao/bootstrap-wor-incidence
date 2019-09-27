build_bootstrap_population = function(y, T_star){
  
  nT = y[1]; y=y[-1]; y=y[y>0]
  Q1 = sum(y == 1)
  Q2 = sum(y == 2)
  
  rho = nT/T_star
  Q0_hat = if(Q1==0&Q2==0 | rho==1 | nT==1) { 0 } else { Q1^2 / ( nT/(nT-1)*2*Q2 + rho/(1-rho)*Q1 ) }
  
  C_hat = ifelse(Q1==0&Q2==0, 1, 1-Q1/nT*(1-rho)*(nT-1)*Q1/((nT-1)*Q1+2*Q2))
  lamdba_hat = ifelse(rho==1, 0, (1-C_hat) / sum(y/nT*(1-rho)^(y/rho)))
  
  M_obs_hat = if(rho==0) { 0 } else { y/rho*(1-lamdba_hat*(1-rho)^(y/rho)) } %>% ceiling
  M_obs_hat[M_obs_hat>T_star]=T_star
  M_unobs_hat = if(Q0_hat==0) { 0 } else { rep(T_star * (1-C_hat)/Q0_hat, ceiling(Q0_hat)) } %>% ceiling
  bootstrap_population = c(T_star, M_obs_hat, M_unobs_hat)
  
  return(bootstrap_population)
  
}
