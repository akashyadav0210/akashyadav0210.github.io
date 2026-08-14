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

My research builds predictive models that know when they don't know — and what to do about it. I work on uncertainty for reduced-order surrogates and for pretrained scientific foundation models, on the principle that uncertainty belongs in a model's structure rather than in a correction bolted onto its outputs, and that it has to be calibrated against observed error before anyone acts on it.

My earlier work was in structural health monitoring, where a damage signal and a seasonal temperature swing look alike in the data. That problem is what pushed me toward model-form uncertainty in computational mechanics, and from there to trustworthy scientific AI.

Research Themes
===========

- **Calibrating models I cannot retrain:** uncertainty for frozen, pretrained scientific foundation models, with no access to gradients or training data.
- **Model error in a model's structure:** stochastic subspaces and reduced-order modeling that treat the basis itself as uncertain.
- **Uncertainty that changes decisions:** Bayesian optimization under uncertainty, and where to spend the next expensive simulation or experiment.

The [Research](/research/) page sets out the full agenda and where I want to take it next; [Publications](/publications/) and the [Blog](/year-archive/) have the papers and technical writing.

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
