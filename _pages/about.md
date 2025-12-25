---
permalink: /
#title: "Academic Pages is a ready-to-fork GitHub Pages template for academic personal websites"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

Hello! I am a PhD Candidate in [Uncertainty Quantification Group](https://uq.uh.edu/) at the University of Houston, advised by [Ruda Zhang](https://www.cive.uh.edu/faculty/zhang-ruda). 

My research centers on **model-form uncertainty**, developing probabilistic methods that improve the reliability of computational models in engineering and science. More recently, I have been working on **uncertainty-aware scientific foundation models**, aiming to make large-scale scientific models both accurate and trustworthy.  

Education
===========

- **Ph.D. in Civil Engineering**, University of Houston, May 2027*  
  CGPA: 4.0/4.0  
  Thesis: *Quantifying and Reducing Model-Form Uncertainty using Stochastic Subspaces*  

- **M.Tech (Research) in Civil Engineering**, Indian Institute of Science (IISc), Bangalore, June 2023  
  CGPA: 8.3/10  
  Thesis: *Structural Health Monitoring Accounting for Thermal Variability and Damage Using Approximate Bayesian Computation (ABC)*  

- **B.Tech in Civil Engineering**, Indian Institute of Technology (IIT), Roorkee, May 2018  
  CGPA: 8.75/10 (First Division with Distinction)  
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
