---
permalink: /
#title: "Academic Pages is a ready-to-fork GitHub Pages template for academic personal websites"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

Hello! I am a PhD Candidate in [Uncertainty Quantification Group](https://uq.uh.edu/) at the University of Houston, advised by [Ruda Zhang](https://www.cive.uh.edu/faculty/zhang-ruda). 

My research focuses on the development of **stochastic representations** (e.g., stochastic attention, probabilistic adaptation, and stochastic reduced-order modeling) to quantify and reduce **model uncertainty** in computational and machine learning models.

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
{% for item in site.data.news limit:5 %}
<p><strong>{{ item.date | date: "%B %d, %Y" }}</strong> – {{ item.text | markdownify | remove: "<p>" | remove: "</p>" }}</p>
{% endfor %}
<p><a href="/news/">More news</a></p>

Contact
---------
:email: ayadav4 'at' uh 'dot' edu

For collaboration opportunities, project discussions, or professional inquiries, feel free to reach out via email. 
You can also reach me via [LinkedIn](https://www.linkedin.com/in/akash-yadav-018535112/).
