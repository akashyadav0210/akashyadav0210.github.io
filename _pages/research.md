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

My research focuses on **uncertainty in computational and scientific machine-learning models**. Fast surrogates, such as reduced-order models and scientific foundation models, make otherwise expensive predictions practical, but the approximations that make them efficient can also introduce model-form error.

I develop methods to **represent, propagate, and calibrate this uncertainty**, with an emphasis on approaches that remain computationally practical.

<figure class="rp-fig">
  <div class="rp-fig-scroll">
    <img src="{{ base_path }}/images/research/research-done.svg" alt="Three lines of completed work. Uncertainty calibration for scientific foundation models, addressed with inference-time stochastic attention, giving calibrated predictions with the backbone untouched. Model uncertainty in computational mechanics, addressed with stochastic reduced-order models, giving model error you can propagate. Efficient calibration of stochastic models, addressed with Bayesian optimization under uncertainty, reaching the same answer in 40 times fewer runs.">
  </div>
</figure>

<div class="rp-entry" markdown="1">

### Uncertainty calibration for scientific foundation models

Scientific foundation models are increasingly used as fast surrogates for weather, climate, and other physical systems, but many provide deterministic predictions without calibrated predictive uncertainty. Retraining or modifying these large pretrained models is often impractical.

We develop **inference-time stochastic methods** that estimate and calibrate uncertainty while keeping the pretrained backbone unchanged. This enables uncertainty quantification for both pretrained and fine-tuned models without requiring an additional training cycle.

<p class="rp-key"><strong>Application:</strong> <a href="{{ base_path }}/projects/#foundation-models">calibrated weather forecasting</a><br><strong>Paper:</strong> <a href="https://arxiv.org/abs/2604.19530">Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention</a></p>

</div>

<div class="rp-entry" markdown="1">

### Model uncertainty in computational mechanics

Reduced-order models accelerate high-fidelity simulations by projecting them onto a low-dimensional subspace. This reduction introduces approximation error that is typically ignored or corrected only at the model output.

We instead make the **reduced basis itself uncertain**, representing it as a distribution over subspaces. We first developed this parametrically using probabilistic PCA and then nonparametrically using the bootstrap, allowing uncertainty in the reduced representation to propagate naturally to model predictions.

<p class="rp-key"><strong>Applications:</strong> <a href="{{ base_path }}/projects/#space-structure">shock response of a space structure</a><br><strong>Papers:</strong> <a href="https://doi.org/10.1007/s00466-025-02701-6">Stochastic Subspace via Probabilistic PCA</a> · <a href="https://doi.org/10.1061/AJRUA6.RUENG-1948">Nonparametric Stochastic Subspaces via the Bootstrap</a><br><strong>Code:</strong> <a href="https://github.com/UQUH/SS_PPCA">probabilistic PCA</a> · <a href="https://github.com/UQUH/SS_Bootstrap">bootstrap</a></p>

</div>

<div class="rp-entry" markdown="1">

### Efficient calibration of stochastic models

Introducing stochasticity creates another computational challenge: its hyperparameters must be calibrated, while each objective evaluation may itself be noisy.

We develop **Bayesian optimization methods that explicitly account for uncertainty in the objective**, rather than suppressing it through repeated sampling. In our stochastic reduced-order modeling application, this approach reaches the same calibrated parameter with **40× fewer evaluations than scalar bounded optimization and 15× fewer than standard Gaussian-process Bayesian optimization**.

<p class="rp-key"><strong>Application:</strong> <a href="{{ base_path }}/projects/#space-structure">shock response of a space structure</a><br><strong>Paper:</strong> <a href="https://doi.org/10.1061/AJRUA6.RUENG-1854">Bayesian Optimization under Uncertainty for Training a Scale Parameter in Stochastic Models</a><br><strong>Code:</strong> <a href="https://github.com/UQUH/SO-BO-scale">GitHub</a></p>

</div>

---

[Projects]({{ base_path }}/projects/) · [Publications]({{ base_path }}/publications/) · [Code]({{ base_path }}/code/) · [Talks]({{ base_path }}/talks/)
