---
permalink: /
#title: "Academic Pages is a ready-to-fork GitHub Pages template for academic personal websites"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

Hello! I am a Ph.D. candidate in the [Uncertainty Quantification Group](https://uq.uh.edu/) at the University of Houston, advised by [Dr. Ruda Zhang](https://www.cive.uh.edu/faculty/zhang-ruda).

My research develops trustworthy AI methods for scientific discovery, with a focus on uncertainty-aware scientific foundation models, stochastic inference, Bayesian optimization, and computational automation. I am particularly interested in agentic AI systems for science: coding-agent workflows, reusable research skills, and evaluation harnesses that accelerate simulation, calibration, and scientific machine learning experiments.

My earlier work focused on structural health monitoring, probabilistic damage detection under environmental variability, and model-form uncertainty in computational mechanics. That foundation continues to shape how I think about reliability, calibration, and uncertainty-aware decision-making in scientific AI.

Research Themes
===========

- **Agentic AI for Scientific Discovery:** coding-agent workflows, reusable skills, evaluation harnesses, and automated scientific experimentation.
- **Trustworthy Scientific Foundation Models:** stochastic attention and probabilistic adaptation for calibrated uncertainty in transformer-based scientific models.
- **Uncertainty Quantification and Model Error:** stochastic subspaces, reduced-order modeling, Bayesian calibration, and model-form uncertainty in computational mechanics.
- **Computational Science Automation:** reproducible pipelines for simulation, calibration, benchmarking, and uncertainty-aware model evaluation.

Education
===========

- **Ph.D. in Civil Engineering**, University of Houston, May 2027*  
  Thesis: *Quantifying and Reducing Model Uncertainty using Stochastic Representations*  

- **M.Tech (Research) in Civil Engineering**, Indian Institute of Science, Bangalore, June 2023  
  Thesis: *Structural Health Monitoring Accounting for Thermal Variability and Damage Using Approximate Bayesian Computation (ABC)*  

- **B.Tech in Civil Engineering**, Indian Institute of Technology, Roorkee, May 2018  
  Thesis: *Design of Hydro Power Project*  


News
======
{% for item in site.data.news limit:3 %}
<p><strong>{{ item.date | date: "%B %d, %Y" }}</strong> – {{ item.text | markdownify | remove: "<p>" | remove: "</p>" }}</p>
{% endfor %}
<p><a href="/news/">More news</a></p>

Contact
---------
:email: ayadav4 'at' uh 'dot' edu

I am interested in collaborations on trustworthy scientific AI, agentic AI for scientific discovery, uncertainty-aware foundation models, and computational science automation. Please feel free to reach out by email. 
You can also reach me via [LinkedIn](https://www.linkedin.com/in/akash-yadav-018535112/).
