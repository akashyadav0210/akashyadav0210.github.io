---
title: "Research"
layout: single_noauthor
permalink: /research/
author_profile: true
toc: false
custom_css: research
---

{% include base_path %}

<p class="rp-lede">Building predictive models that know when they don't know.</p>

Fast models are useful because they discard information, and dangerous for the same reason. A reduced-order model runs in a fraction of the time of the simulation it replaces; a pretrained foundation model emulates physics it was never shown. Both return a confident number, and neither reports how much of that number is an artifact of the shortcut that made it fast.

My methodological work puts the uncertainty in the model's own structure rather than in a correction bolted onto its outputs, then calibrates it against the errors the model actually makes. See [Projects]({{ base_path }}/projects/) for the systems these methods were built for.

<figure class="rp-fig">
  <div class="rp-fig-scroll">
    <img src="{{ base_path }}/images/research/research-done.svg" alt="Three lines of completed work. Model uncertainty in computational mechanics, addressed with stochastic reduced-order models, giving model error you can propagate. Calibrating transformer-based scientific foundation models, addressed with inference-time stochastic attention, giving calibrated predictions with the backbone untouched. Hyperparameter optimization in stochastic models, addressed with Bayesian optimization under uncertainty, reaching the same answer in 40 times fewer runs.">
  </div>
</figure>

<div class="rp-entry" markdown="1">

### Model uncertainty in computational mechanics

The usual remedy for reduction error is to fit a correction to the model's outputs. That patches the symptom and leaves the cause in place: the error originates in the basis the model was projected onto.

I make that basis uncertain instead. It becomes a distribution over subspaces rather than one fixed choice: first parametrically through probabilistic PCA, then nonparametrically through the bootstrap, which drops the Gaussian assumption and works from the empirical distribution directly. The reduction error then propagates through to the prediction rather than disappearing into it, **including at locations and quantities never observed during training**.

<p class="rp-key">Applied to <a href="{{ base_path }}/projects/#space-structure">shock response of a space structure</a> · <a href="https://doi.org/10.1007/s00466-025-02701-6">Stochastic Subspace via Probabilistic PCA</a>, <em>Computational Mechanics</em> · <a href="https://github.com/UQUH/SS_PPCA">code</a><br><a href="https://doi.org/10.1061/AJRUA6.RUENG-1948">Nonparametric Stochastic Subspaces via the Bootstrap</a>, <em>ASCE-ASME J. Risk Uncertainty Eng. Syst.</em> · <a href="https://github.com/UQUH/SS_Bootstrap">code</a></p>

</div>

<div class="rp-entry" markdown="1">

### Calibrating transformer-based scientific foundation models

Foundation models are becoming general-purpose surrogates for weather, climate and mechanics, and they are deterministic point predictors. The groups adopting them usually cannot change that: the weights are vendor-supplied, export-controlled, or simply too expensive to retrain, and the standard remedies all assume access to the backbone.

I get calibrated uncertainty out of a model I am not allowed to touch, at inference time, with every pretrained weight left exactly as it was. It applies to fine-tuned backbones as well as pretrained ones, which is what scientific workflows actually run on. **A group can adopt someone else's foundation model and still know when to believe it**, without a training budget of their own.

<p class="rp-key">Applied to <a href="{{ base_path }}/projects/#foundation-models">calibrated weather forecasting</a> · <a href="https://arxiv.org/abs/2604.19530">Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention</a> (under review)</p>

</div>

<div class="rp-entry" markdown="1">

### Hyperparameter optimization in stochastic models

None of the above is usable if calibrating it costs more than the simulation it replaces. Stochastic models carry hyperparameters that must be tuned, every evaluation of them is itself random, and the standard fix is to average that randomness away by sampling repeatedly, which is exactly the cost you were trying to avoid.

I treat the objective's own uncertainty as part of the objective rather than as noise to suppress. **The same parameter is reached with 40× fewer evaluations than scalar bounded optimization and 15× fewer than standard Gaussian-process Bayesian optimization.** That is the difference between a method that works in a paper and one that runs inside somebody's workflow.

<p class="rp-key">Applied to <a href="{{ base_path }}/projects/#space-structure">shock response of a space structure</a> · <a href="https://doi.org/10.1061/AJRUA6.RUENG-1854">Bayesian Optimization under Uncertainty for Training a Scale Parameter in Stochastic Models</a> · <a href="https://github.com/UQUH/SO-BO-scale">code</a></p>

</div>

<div class="rp-entry" markdown="1">

### Where this started

Structural health monitoring, where a damage signal and a seasonal temperature swing look alike in the data. A monitoring system that cannot tell them apart will report a crack that is not there, or miss one that is, and it will do either with complete confidence. That is the problem I have been working on ever since, in progressively more general form.

</div>

[Projects]({{ base_path }}/projects/) · [Publications]({{ base_path }}/publications/) · [Code]({{ base_path }}/code/) · [Talks]({{ base_path }}/talks/)
