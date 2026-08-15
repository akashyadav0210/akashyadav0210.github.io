---
title: "Projects"
layout: single_noauthor
permalink: /projects/
author_profile: true
toc: false
custom_css: research
---

{% include base_path %}

<p class="rp-lede">The systems the methods were built for, and the decisions they have to support.</p>

<div class="rp-entry" markdown="1">

### Shock response of a space structure
{: #space-structure }

A component of a space structure takes an impulse load. A heavy central mass sits on rigid links above a cylindrical shell, and behind a shock-absorption block sits essential equipment. The question after the event is whether the acceleration that reached that equipment stayed within survivable limits — and it has to be answered from a handful of monitored points, close to real time.

The high-fidelity finite element model that answers it has **42,486 degrees of freedom** and takes about **38 minutes** per run. A reduced-order model answers in **0.2 seconds**, roughly 11,000× faster. That speedup is the only reason monitoring at this cadence is possible, and it is also what makes the answer untrustworthy: reducing the model discards exactly the information needed to judge the result.

I made the fast model report its own reliability. Stochastic subspaces put the reduction error back into the prediction as a calibrated interval — on acceleration and velocity at the critical nodes, and at locations and quantities never observed while fitting. Bayesian optimization under uncertainty makes the calibration affordable at this scale, so the whole thing stays cheaper than the simulation it replaces.

<p class="rp-key">Model built in LS-DYNA; transient response integrated with Newmark-β. <a href="https://doi.org/10.1007/s00466-025-02701-6">SS-PPCA</a> · <a href="https://doi.org/10.1061/AJRUA6.RUENG-1948">SS-Bootstrap</a> · <a href="https://doi.org/10.1061/AJRUA6.RUENG-1854">BO under uncertainty</a></p>

</div>

<div class="rp-entry" markdown="1">

### Calibrated forecasting with scientific foundation models
{: #foundation-models }

Pretrained foundation models are being adopted as general-purpose surrogates for weather and climate. ClimaX is one of them: a transformer trained on atmospheric data that produces forecasts far faster than numerical weather prediction, and produces them as single deterministic fields. A forecast without a credible spread cannot support a decision that depends on how bad the tail might be.

The groups using these models generally cannot retrain them. The weights come from someone else, the compute to fine-tune them is not available, and the target system may have no training data at all.

I calibrate them from the outside. Resampling attention at inference turns a frozen backbone into a predictive ensemble whose spread tracks the errors it actually makes, with every pretrained weight untouched — and it works for fine-tuned checkpoints as well as pretrained ones, which is what most scientific workflows are actually running.

<p class="rp-key">Evaluated on pretrained atmospheric and time-series backbones. <a href="https://arxiv.org/abs/2604.19530">Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention</a> (under review)</p>

</div>

<div class="rp-entry" markdown="1">

### Damage detection on steel truss bridges
{: #shm }

A crack changes how a bridge vibrates. So does a twenty-degree change in air temperature, and it changes it by more. Any monitoring system that cannot separate the two will either raise alarms every summer or stay silent through real damage — and the underlying inverse problem has no likelihood you can write down.

I used approximate Bayesian computation to infer damage state while treating thermal variation as part of the model rather than as noise to be filtered out, then extended it to the nonlinear response that damage itself introduces. This is where my interest in models that misreport their own confidence began.

<p class="rp-key">M.Tech (Research) thesis, Indian Institute of Science, with Dr. Ananth Ramaswamy. <a href="https://etd.iisc.ac.in/handle/2005/6115">Thesis</a> · <a href="https://github.com/akashyadav0210/ABC_SHM">code</a> · presented at ICCMS 2022, IIT Indore</p>

</div>

Methods behind these on the [Research]({{ base_path }}/research/) page · papers on [Publications]({{ base_path }}/publications/)
