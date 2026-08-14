---
permalink: /
#title: "Academic Pages is a ready-to-fork GitHub Pages template for academic personal websites"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

Hello! I am a Ph.D. candidate in the [Uncertainty Quantification Group](https://uq.uh.edu/) at the University of Houston, advised by [Dr. Ruda Zhang](https://www.cive.uh.edu/faculty/zhang-ruda).

**I expect to complete my Ph.D. in May 2027 and am seeking postdoctoral positions in trustworthy scientific AI and uncertainty quantification, starting Summer/Fall 2027.** I am happy to talk with prospective hosts and collaborators — please [email me](mailto:ayadav4@uh.edu).

My research develops trustworthy scientific AI for engineering and computational science, with a focus on uncertainty-aware scientific foundation models, model calibration, Bayesian optimization, and scientific discovery automation. I build methods that make scientific models more reliable, better calibrated, and more useful for engineering and scientific decision-making.

My earlier work focused on structural health monitoring, probabilistic damage detection under environmental variability, and model-form uncertainty in computational mechanics. That foundation now informs my current direction in trustworthy scientific AI, including uncertainty-aware scientific foundation models and agentic scientific ML workflows.

Research Themes
===========

- **Trustworthy Scientific AI:** uncertainty-aware scientific foundation models, calibrated stochastic inference, and reliable decision-making.
- **Agentic AI for Scientific Discovery:** coding-agent workflows, reusable skills, evaluation harnesses, and scientific experimentation automation.
- **Uncertainty Quantification and Model Error:** stochastic subspaces, reduced-order modeling, Bayesian calibration, and computational mechanics.

More detail on papers and technical writing is available on the [Publications](/publications/) and [Blog](/year-archive/) pages.

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

I am interested in collaborations on trustworthy scientific AI, agentic AI for scientific discovery, and uncertainty-aware foundation models. Please feel free to reach out by email. 
You can also reach me via [LinkedIn](https://www.linkedin.com/in/akash-yadav-018535112/).
