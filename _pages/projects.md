---
title: "Research"
layout: single_noauthor
permalink: /research/
author_profile: true
redirect_from:
  - /projects/
toc: false
custom_css: research
---

{% include base_path %}

<p class="rp-lede">Building predictive models that know when they don't know.</p>

<figure class="rp-fig">
  <div class="rp-fig-scroll">
    <img src="{{ base_path }}/images/research/research-done.svg" alt="Three completed lines of work. A reduced-order surrogate with one fixed basis becomes model error you can propagate, via a distribution over subspaces. A pretrained transformer with frozen weights yields calibrated forecasts with the backbone untouched, by resampling attention at inference. A stochastic model that is expensive to tune reaches the same answer in 40 times fewer runs, by making the noise part of the objective.">
  </div>
</figure>

<div class="rp-entry" markdown="1">

### Model error belongs in the model's structure

A reduced-order model projects a simulation onto a low-dimensional basis, and the error that introduces is usually handled by bolting a discrepancy term onto the outputs. But the error originates in the basis — so that is where I put the uncertainty. I replace the fixed basis with a *distribution over subspaces*: first parametrically, through probabilistic PCA; then nonparametrically, through the bootstrap, which drops the Gaussian assumption. Model-form error becomes something you can propagate rather than absorb.

<p class="rp-key"><a href="https://doi.org/10.1007/s00466-025-02701-6">Stochastic Subspace via Probabilistic PCA</a>, <em>Computational Mechanics</em> · <a href="https://github.com/UQUH/SS_PPCA">code</a> — <a href="https://doi.org/10.1061/AJRUA6.RUENG-1948">Nonparametric Stochastic Subspaces via the Bootstrap</a>, <em>ASCE-ASME J. Risk Uncertainty Eng. Syst.</em> · <a href="https://github.com/UQUH/SS_Bootstrap">code</a></p>

</div>

<div class="rp-entry" markdown="1">

### Calibrating a model I cannot retrain

Getting uncertainty out of a pretrained foundation model usually means retraining it or reaching into its gradients. Often neither is possible: the weights may be vendor-supplied or simply too expensive to touch. I resample each attention row of a frozen transformer as a normalized multinomial draw from itself, so repeated forward passes produce a calibrated predictive ensemble with every pretrained weight left untouched. It calibrates ClimaX; it does not calibrate TimesFM — and that asymmetry is a finding in its own right.

<p class="rp-key"><a href="https://arxiv.org/abs/2604.19530">Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention</a> (under review)</p>

</div>

<div class="rp-entry" markdown="1">

### Uncertainty has to change a decision

Quantified uncertainty matters only when it changes what you do next. Tuning a stochastic model is expensive precisely because every evaluation is noisy, and standard Bayesian optimization treats that noise as something to average away. I made it part of the objective instead, reaching the same parameter with 40× fewer evaluations than scalar bounded optimization and 15× fewer than standard GP-based Bayesian optimization.

<p class="rp-key"><a href="https://doi.org/10.1061/AJRUA6.RUENG-1854">Bayesian Optimization under Uncertainty for Training a Scale Parameter in Stochastic Models</a>, <em>ASCE-ASME J. Risk Uncertainty Eng. Syst.</em> · <a href="https://github.com/UQUH/SO-BO-scale">code</a></p>

</div>

<div class="rp-entry" markdown="1">

### Where this came from

Structural health monitoring, where a damage signal and a seasonal temperature swing look alike in the data. A monitoring system that cannot tell them apart is a model that does not know what it does not know — which is the problem I have been working on ever since.

</div>

Full list on [Publications]({{ base_path }}/publications/) · repositories on [Code]({{ base_path }}/code/) · [Talks]({{ base_path }}/talks/)
