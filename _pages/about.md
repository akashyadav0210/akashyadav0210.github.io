---
permalink: /
#title: "Academic Pages is a ready-to-fork GitHub Pages template for academic personal websites"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

Hello! I am a Ph.D. candidate in the [Uncertainty Quantification Group](https://uq.uh.edu/) at the University of Houston, advised by [Dr. Ruda Zhang](https://www.cive.uh.edu/faculty/zhang-ruda).

**I expect to complete my Ph.D. in May 2027 and am seeking postdoctoral positions or research-oriented industry roles in trustworthy scientific AI and uncertainty quantification, starting Summer/Fall 2027.** I am happy to talk with prospective hosts, collaborators and teams. Reach me by [email](mailto:ayadav4@uh.edu) or on [LinkedIn](https://www.linkedin.com/in/akash-yadav-018535112/).

My research builds predictive models that know when they don't know. Engineering decisions increasingly rest on models nobody can fully check: fast surrogates standing in for simulations too expensive to run, and pretrained foundation models emulating physics. They return a confident number whether or not they are still in a regime where they work. I make those models report how far they should be trusted, across model uncertainty in computational mechanics, calibration of scientific foundation models, and the optimization that makes both practical.

I came to this from structural health monitoring, where a damage signal and a seasonal temperature swing look alike in the data. A monitoring system that cannot tell them apart reports a crack that is not there, and does it with complete confidence.

See [Research](/research/) for the methods, [Projects](/projects/) for the systems they were built for, and [Publications](/publications/) for the papers.

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

I am interested in collaborations on calibrated uncertainty for scientific foundation models, model-form uncertainty in computational mechanics, and decision-making under uncertainty. Please feel free to reach out by email. 
You can also reach me via [LinkedIn](https://www.linkedin.com/in/akash-yadav-018535112/).
