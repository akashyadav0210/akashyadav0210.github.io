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

A component of a space structure takes a shock. Essential equipment sits behind a shock-absorption block, and the question is whether the acceleration reaching it stayed within survivable limits. The high-fidelity finite element model that answers this has 42,486 degrees of freedom and takes about **38 minutes** per run. A reduced-order model answers in **0.2 seconds** — around 11,000× faster, and that speedup is the only reason near-real-time monitoring is possible at all.

It is also the problem. Reducing the model is what makes it fast, and reducing the model is what makes it wrong — in ways the model itself does not report. You are left with a fast, confident number and no way to know how far to trust it. That is the gap my work closes, for reduced-order models and, increasingly, for the pretrained foundation models now being used the same way.

<figure class="rp-fig">
  <div class="rp-fig-scroll">
    <img src="{{ base_path }}/images/research/research-done.svg" alt="Three lines of completed work. Model uncertainty in computational mechanics, addressed with stochastic reduced-order models, giving model error you can propagate. Calibrating transformer-based scientific foundation models, addressed with inference-time stochastic attention, giving calibrated predictions with the backbone untouched. Hyperparameter optimization in stochastic models, addressed with Bayesian optimization under uncertainty, reaching the same answer in 40 times fewer runs.">
  </div>
</figure>

<div class="rp-entry" markdown="1">

### Model uncertainty in computational mechanics

The usual remedy for reduction error is to fit a correction to the model's outputs. That patches the symptom and leaves the cause in place: the error originates in the basis the model was projected onto.

I make that basis uncertain instead — a distribution over subspaces rather than one fixed choice, first parametrically through probabilistic PCA, then nonparametrically through the bootstrap. The reduction error then propagates through to the prediction instead of disappearing into it. On the space structure this gives calibrated intervals on acceleration and velocity at the critical nodes, including at locations and quantities never observed during training. **The fast model still answers in 0.2 seconds, but it now says how far it can be trusted** — which is what the 38-minute model was really being consulted for.

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

None of the above is usable if calibrating it costs more than the simulation it replaces. The stochastic models above carry a hyperparameter that has to be tuned, every evaluation of it is itself random, and the standard fix is to average that randomness away by sampling repeatedly — on a 42,486-DOF problem that is exactly the cost you were trying to avoid.

I treat the objective's own uncertainty as part of the objective rather than as noise to suppress. **The same parameter is reached with 40× fewer evaluations than scalar bounded optimization and 15× fewer than standard Gaussian-process Bayesian optimization** — the difference between a method that works in a paper and one that runs inside somebody's workflow.

<p class="rp-key"><a href="https://doi.org/10.1061/AJRUA6.RUENG-1854">Bayesian Optimization under Uncertainty for Training a Scale Parameter in Stochastic Models</a> · <a href="https://github.com/UQUH/SO-BO-scale">code</a></p>

</div>

<div class="rp-entry" markdown="1">

### Where this started

Structural health monitoring, where a damage signal and a seasonal temperature swing look alike in the data. A monitoring system that cannot tell them apart will report a crack that is not there, or miss one that is — and it will do either with complete confidence. That is the problem I have been working on ever since, in progressively more general form.

</div>

Full list on [Publications]({{ base_path }}/publications/) · repositories on [Code]({{ base_path }}/code/) · [Talks]({{ base_path }}/talks/)
