---
layout: archive
title: "Research"
permalink: /projects/
author_profile: true
---

{% include base_path %}

## <ins>Research Projects</ins>

My research develops trustworthy and uncertainty-aware methods for scientific machine learning, computational mechanics, and research automation. Across these projects, the common goal is to make scientific models more reliable, better calibrated, and easier to evaluate and deploy in practice.

## Agentic SciML experiment harness

Scientific machine learning experiments often involve repetitive setup, evaluation, and debugging steps that slow down iteration. I am interested in coding-agent-assisted workflows that make this process more systematic, reproducible, and scalable.

1. I am developing an agentic workflow for scientific ML experimentation.
   * The goal is to automate experiment setup, code generation, testing, evaluation, calibration diagnostics, and result summarization.
   * A central idea is to use reusable instructions and skills so that common research tasks can be executed consistently across projects.
2. This direction is motivated by the need for reproducible and scalable scientific workflows.
   * In practice, much of research iteration is spent on orchestration rather than modeling.
   * Agentic workflows can reduce that overhead and make it easier to compare methods, run benchmarks, and analyze failure modes.

## Uncertainty-aware scientific foundation models

Scientific foundation models are emerging as reusable learning systems for weather and climate, time-series forecasting, computational mechanics, and civil infrastructure. Their predictive accuracy is promising, but high-stakes engineering use requires calibrated uncertainty, not just strong point predictions.

1. In [Paper](https://arxiv.org/abs/2604.19530), we develop inference-time stochastic attention for scientific foundation models.
   * The key idea is to introduce structured stochasticity in attention so that variability in learned dependencies acts as a proxy for model-form uncertainty.
   * Because the method is post hoc, it can produce uncertainty-aware predictions without retraining the pretrained backbone or changing the overall adaptation workflow.
2. This work is aimed at trustworthy scientific AI for real engineering use.
   * The broader goal is to support forecasting, inverse problems, digital twins, and monitoring while retaining calibrated uncertainty.
   * It connects my earlier work on stochastic representations and model-form uncertainty with emerging foundation-style scientific models.

## Bayesian optimization under uncertainty

Uncertainty-aware models are only useful in practice if they can also be calibrated efficiently. This project develops automated optimization workflows for noisy objectives arising in stochastic models.

1. In [Paper](https://arxiv.org/abs/2510.06439), we develop Bayesian optimization under uncertainty for training a scale parameter in stochastic models.
   * The method is designed for noisy objectives arising in models such as SS-PPCA and SS-Bootstrap.
   * It reduces tuning cost and improves reproducibility by replacing expensive trial-and-error search with a structured probabilistic optimization framework.
   * Related materials: [Code](https://github.com/UQUH/SO-BO-scale), [EMI/PMC 2024](https://www.emi-conference.org/).
2. More broadly, this direction supports automated calibration pipelines for scientific models.
   * The aim is to make uncertainty-aware model selection and parameter tuning more systematic across computational science workflows.

<p align="center">
  <img src="/images/pub/BO_evolution.jpg" width="520" alt="Bayesian optimization under uncertainty figure" />
</p>

## Stochastic subspaces for model error

Computational models often suffer from model-form uncertainty due to structural mismatch between the model and the physical system. This thread of my work develops probabilistic representations for characterizing and correcting that discrepancy.

1. In [Paper](https://link.springer.com/article/10.1007/s00466-025-02701-6), we propose *Stochastic Subspace via Probabilistic Principal Component Analysis (SS-PPCA)* for characterizing model-form uncertainty.
   * SS-PPCA builds a parametric stochastic subspace representation for high-dimensional simulation outputs.
   * It provides a principled way to represent structured model discrepancy and improve predictive reliability.
   * Related materials: [Code](https://github.com/UQUH/SS_PPCA), [WCCM/PANACM talk](https://www.wccm2024.org/).

2. In [Preprint](https://arxiv.org/abs/2512.15624), we develop *Nonparametric Stochastic Subspaces via the Bootstrap (SS-Bootstrap)*.
   * SS-Bootstrap uses the empirical data distribution directly and complements the parametric SS-PPCA framework.
   * Related materials: [Code](https://github.com/UQUH/SS_Bootstrap), [CASML poster](https://casml.cc/wp-content/uploads/2024/12/AkashYadav_Poster_StochasticSubspace.pdf).

3. In ongoing work presented at [USNCCM 2025](https://usnccm18.usacm.org/home), I develop stochastic reduced-order modeling strategies for model-error characterization and correction.
   * The key idea is to correct model discrepancy in a reduced space, lowering computational cost while preserving predictive fidelity.
   * This work targets computational mechanics settings where both accuracy and efficiency are critical.

<p align="center">
  <img src="/images/pub/Prediction_disp.png" width="520" alt="Stochastic subspace and model-form uncertainty figure" />
</p>

For publication-specific details, see [Publications]({{ base_path }}/publications/) and [Talks]({{ base_path }}/talks/).
