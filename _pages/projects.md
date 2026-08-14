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

Engineering and scientific decisions increasingly rest on models nobody can fully check: reduced-order surrogates standing in for simulations that are too expensive to run, and pretrained foundation models emulating physics across whole problem families. Almost all of them return a confident number whether or not they are in a regime where they still work — and a confident number is the hardest kind of wrong to catch.

I work on making such models report how far they should be trusted, and on making that report reliable enough to act on. Three problems, one commitment: put the uncertainty in the model's own structure, then calibrate it against the errors the model actually makes.

<figure class="rp-fig">
  <div class="rp-fig-scroll">
    <img src="{{ base_path }}/images/research/research-done.svg" alt="Three lines of completed work. Model uncertainty in computational mechanics, addressed with stochastic reduced-order models, giving model error you can propagate. Calibrating transformer-based scientific foundation models, addressed with inference-time stochastic attention, giving calibrated predictions with the backbone untouched. Hyperparameter optimization in stochastic models, addressed with Bayesian optimization under uncertainty, reaching the same answer in 40 times fewer runs.">
  </div>
</figure>

<div class="rp-entry" markdown="1">

### Model uncertainty in computational mechanics

A reduced-order model is fast because it throws information away. Standard practice reports the prediction but not what was discarded, so the surrogate is least trustworthy exactly when it looks most confident — and the usual remedy, fitting a correction to the outputs, patches the symptom while leaving the cause in place.

I make the model's own structure uncertain instead: the reduced basis becomes a distribution over subspaces rather than one fixed choice. The error introduced by reducing the model then propagates through to the prediction rather than disappearing into it. **An engineer gets a predictive interval that accounts for the modeling decision, not just the measurement noise** — which is the interval that matters when the decision is whether a structure is safe.

<p class="rp-key"><a href="https://doi.org/10.1007/s00466-025-02701-6">Stochastic Subspace via Probabilistic PCA</a>, <em>Computational Mechanics</em> · <a href="https://github.com/UQUH/SS_PPCA">code</a> — <a href="https://doi.org/10.1061/AJRUA6.RUENG-1948">Nonparametric Stochastic Subspaces via the Bootstrap</a>, <em>ASCE-ASME J. Risk Uncertainty Eng. Syst.</em> · <a href="https://github.com/UQUH/SS_Bootstrap">code</a></p>

</div>

<div class="rp-entry" markdown="1">

### Calibrating transformer-based scientific foundation models

Foundation models are becoming general-purpose surrogates for weather, climate and mechanics, and they are deterministic point predictors. The groups adopting them usually cannot change that: the weights are vendor-supplied, export-controlled, or simply too expensive to retrain, and the standard fixes all assume you can reach into the backbone.

I get calibrated uncertainty out of a model I am not allowed to touch, at inference time, with every pretrained weight left exactly as it was — for fine-tuned backbones as well as pretrained ones, which is what scientific workflows actually run on. **A group can adopt someone else's foundation model and still know when to believe it**, without a training budget of their own.

<p class="rp-key"><a href="https://arxiv.org/abs/2604.19530">Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention</a> (under review)</p>

</div>

<div class="rp-entry" markdown="1">

### Hyperparameter optimization in stochastic models

Uncertainty-aware models have a practical problem: they must be tuned, and tuning them is what makes people abandon them. Every evaluation of a stochastic model is itself random, so the usual approach is to average that randomness away by sampling repeatedly — and the cost of doing so is what puts these methods out of reach for realistic problems.

I treat the objective's own uncertainty as part of the objective rather than as noise to be suppressed. **The same parameter is reached with 40× fewer evaluations than scalar bounded optimization and 15× fewer than standard Gaussian-process Bayesian optimization** — the difference between a method that works in a paper and one that runs inside somebody's workflow.

<p class="rp-key"><a href="https://doi.org/10.1061/AJRUA6.RUENG-1854">Bayesian Optimization under Uncertainty for Training a Scale Parameter in Stochastic Models</a> · <a href="https://github.com/UQUH/SO-BO-scale">code</a></p>

</div>

<div class="rp-entry" markdown="1">

### Where this started

Structural health monitoring, where a damage signal and a seasonal temperature swing look alike in the data. A monitoring system that cannot tell them apart will report a crack that is not there, or miss one that is — and it will do either with complete confidence. That is the problem I have been working on ever since, in progressively more general form.

</div>

Full list on [Publications]({{ base_path }}/publications/) · repositories on [Code]({{ base_path }}/code/) · [Talks]({{ base_path }}/talks/)
