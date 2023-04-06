# Numerical Experiments for Social Learning with A Self-Interested Coordinator

## Reference:

https://ieeexplore.ieee.org/abstract/document/9992549

## Settings:

- The reader can find the basic social learning setting in the reference paper provided above. 
- During the BHW social learning framework, an agent may face a tie in which her posterior belief is indifferent to either action. In this case, we let the agent to take the action that reveals her private signal, which indeed maximizes the expected social welfare. 
- The NSII mechanism simulated in this repository is slightly different from that mentioned in the reference. In our upcoming journal version of this work, we show that it is sufficient for a self-interested coordinator to focus on summary-based mechanism. Correspondingly, we propose a new summary-based NSII.  Here the summary is defined as a belief $\eta_t$ on the sum of the messages received by the coordinator $n_t$. $n_t = \sum_{\tau=1}^{t-1} m_\tau$.
- The belief $\eta_t$ can induce the classical public belief $\pi_t \in \Delta(\mathcal{W})$.
- The NSII in this repository is sketched as follows:
  - When the belief $\eta_t$ induces a belief $\pi_t$ not in the information cascade phase, the NSII imitates the behavior of BHW.
  - When the belief $\eta_t$ induces a belief $\pi_t$ that should have been in the information cascade under BHW framework:
    - If $n_t+m_t \neq 0$, recommend the sign of $n_t+m_t$ as the action to take.
    - If $n_t + m_t = 0$, follow the "No Switch If Indifferent" rule, recommend the sign of $n_t$ as the action to take. 

## MATLAB Scripts

`SWnsii.m`: Compute the expected gross social welfare under the NSII mechanism.

`REVnsii.m`: Compute the expected revenue of the coordinator under the NSII mechanism.

`SWbhw.m`: Compute the expected gross social welfare under the original BHW setting. 

`Compare.m`: Plot figures that include the net and gross social welfare of BHW and NSII, and the NSII improvement percentage (Figure 1); the coordinator's profit, and the percentage of the coordinator's profit (Figure 2). All the percentages are compared to the BHW social welfare. 

## How to Run the Experiment?

Run `compare.m`.