---
permalink: /
#title: "Academic Pages is a ready-to-fork GitHub Pages template for academic personal websites"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

Hello! I am a Ph.D. candidate in the [Uncertainty Quantification Group](https://uq.uh.edu/) at the University of Houston, advised by [Dr. Ruda Zhang](https://www.cive.uh.edu/faculty/zhang-ruda).

My research is in AI for science, combining machine learning, uncertainty quantification and computational mechanics to build models that scientists and engineers can rely on. I am particularly interested in scientific foundation models, probabilistic machine learning and reduced-order modeling. **I expect to complete my Ph.D. in May 2027 and am looking for postdoctoral positions or research-oriented industry roles starting Summer/Fall 2027.** I am happy to talk with prospective hosts, collaborators and teams; reach me by [email](mailto:ayadav4@uh.edu) or on [LinkedIn](https://www.linkedin.com/in/akash-yadav-018535112/).

Education
===========

- **Ph.D. in Civil Engineering**, University of Houston, August 2023 – Present  
  Thesis: *Quantify and Reduce Model-error in Physics-based and Learned Models via Stochastic Representations*  

- **M.Tech (Research) in Civil Engineering**, Indian Institute of Science, Bangalore, October 2020 – June 2023  
  Thesis: *Structural Health Monitoring Accounting for Thermal Variability and Damage Using Approximate Bayesian Computation*  

- **B.Tech in Civil Engineering**, Indian Institute of Technology, Roorkee, July 2014 – May 2018


News
======
{% for item in site.data.news limit:3 %}
<p><strong>{{ item.date | date: "%B %d, %Y" }}</strong> – {{ item.text | markdownify | remove: "<p>" | remove: "</p>" }}</p>
{% endfor %}
<p><a href="/news/">More news</a></p>

Contact
---------
:email: ayadav4 'at' uh 'dot' edu

Please feel free to reach out by email about collaborations, or find me on [LinkedIn](https://www.linkedin.com/in/akash-yadav-018535112/).
