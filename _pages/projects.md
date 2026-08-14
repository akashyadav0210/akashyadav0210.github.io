---
layout: archive
title: "Research"
permalink: /research/
author_profile: true
redirect_from:
  - /projects/
---

{% include base_path %}

## Research

My research develops trustworthy scientific AI for computational mechanics, civil infrastructure, and scientific machine learning. I focus on uncertainty-aware scientific foundation models, agentic AI for science, Bayesian optimization, and stochastic representations for model-form uncertainty.

The broader goal is to build scientific learning systems that are not only accurate, but also calibrated, reliable, and easier to evaluate in practice. I am particularly interested in methods that support reproducible experimentation and more reliable engineering and scientific decision-making under uncertainty.

## Current Themes

- [Trustworthy Scientific Foundation Models](#trustworthy-scientific-foundation-models)
- [Agentic AI for Scientific Discovery](#agentic-ai-for-scientific-discovery)
- [Bayesian Optimization and Automated Calibration](#bayesian-optimization-and-automated-calibration)
- [Model-Form Uncertainty in Computational Mechanics](#model-form-uncertainty-in-computational-mechanics)

## Trustworthy Scientific Foundation Models {#trustworthy-scientific-foundation-models}

Scientific foundation models are becoming reusable learning systems for weather and climate, time-series forecasting, computational mechanics, and civil infrastructure. Their predictive accuracy is promising, but high-stakes scientific and engineering use requires calibrated uncertainty rather than deterministic point predictions alone.

1. In [Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention](https://arxiv.org/abs/2604.19530), we develop a post hoc stochastic attention framework for uncertainty-aware scientific foundation models.
   - The main idea is to introduce structured stochasticity in attention, so that repeated stochastic inference produces calibrated predictive ensembles without retraining the pretrained backbone.
   - This provides a practical route to uncertainty-aware forecasting in settings where attention already captures structured dependencies in scientific data.
   - Related links: [Paper](https://arxiv.org/abs/2604.19530), [Publication entry]({{ base_path }}/publications/).
2. This direction aims to support trustworthy foundation-style models under distribution shift, sparse observations, and partially known physics.
   - The longer-term goal is reliable scientific AI for forecasting, inverse problems, digital twins, and infrastructure monitoring.


## Agentic AI for Scientific Discovery {#agentic-ai-for-scientific-discovery}

Scientific machine learning workflows often spend substantial effort on orchestration rather than modeling: experiment setup, testing, evaluation, debugging, calibration diagnostics, and result summarization. I am interested in agentic AI for science that makes these workflows more systematic, reusable, and reproducible.

1. I am developing coding-agent-assisted scientific ML workflows built around reusable instructions, skills, and experiment harnesses.
   - The aim is to automate recurring research tasks such as experiment setup, code generation, testing, evaluation, calibration checks, and result summarization.
   - This direction is especially useful in research settings where many experiments differ only in configuration, model variant, or evaluation protocol.
2. I view agentic AI for science as infrastructure for more reliable experimentation rather than a separate tool layer.
   - Better workflow automation makes it easier to compare methods fairly, track failure modes, and scale uncertainty-aware evaluation across projects.


## Bayesian Optimization and Automated Calibration {#bayesian-optimization-and-automated-calibration}

Uncertainty-aware models are only useful in practice if they can also be calibrated efficiently. This line of work develops Bayesian optimization methods for noisy objectives arising in stochastic scientific models, with the goal of reducing tuning cost and improving reproducibility.

1. In [Bayesian Optimization under Uncertainty for Training a Scale Parameter in Stochastic Models](https://arxiv.org/abs/2510.06439), we develop a probabilistic optimization framework for noisy calibration objectives.
   - The method is designed for stochastic models such as SS-PPCA and SS-Bootstrap, where direct trial-and-error tuning is expensive and unstable.
   - It improves the efficiency and reproducibility of parameter selection in uncertainty-aware scientific models.
   - Related links: [Paper](https://arxiv.org/abs/2510.06439), [Code](https://github.com/UQUH/SO-BO-scale), [EMI/PMC 2024](https://www.emi-conference.org/).
2. More broadly, this direction serves as an automated calibration backbone for trustworthy scientific AI.
   - I expect these ideas to remain central as uncertainty-aware foundation models become larger and more expensive to tune.


## Model-Form Uncertainty in Computational Mechanics {#model-form-uncertainty-in-computational-mechanics}

Computational models often suffer from model-form uncertainty because the governing assumptions, discretizations, or constitutive choices do not perfectly match the physical system. My work in this area develops structured probabilistic representations for characterizing and correcting model discrepancy in high-dimensional simulation settings.

1. In [Stochastic Subspace via Probabilistic Principal Component Analysis for Characterizing Model Error](https://link.springer.com/article/10.1007/s00466-025-02701-6), we propose SS-PPCA as a parametric stochastic subspace model for high-dimensional simulation outputs.
   - SS-PPCA provides a structured way to represent model discrepancy and improve predictive reliability.
   - Related links: [Paper](https://link.springer.com/article/10.1007/s00466-025-02701-6), [Code](https://github.com/UQUH/SS_PPCA), [WCCM/PANACM talk](https://www.wccm2024.org/).
2. In [Nonparametric Stochastic Subspaces via the Bootstrap for Characterizing Model Error](https://arxiv.org/abs/2512.15624), we develop SS-Bootstrap as a complementary nonparametric alternative.
   - SS-Bootstrap uses the empirical data distribution directly and expands the stochastic subspace framework beyond parametric assumptions.
   - Related links: [Preprint](https://arxiv.org/abs/2512.15624), [Code](https://github.com/UQUH/SS_Bootstrap), [CASML poster](https://casml.cc/wp-content/uploads/2024/12/AkashYadav_Poster_StochasticSubspace.pdf).
3. In ongoing work presented at [USNCCM 2025](https://usnccm18.usacm.org/home), I develop stochastic reduced-order modeling strategies for model-error characterization and correction.
   - The main idea is to correct discrepancy in a reduced space, lowering computational cost while preserving predictive fidelity.
   - This line of work provides the methodological foundation for my newer research on uncertainty-aware scientific foundation models.


## Earlier Related Work

- In structural health monitoring, I developed probabilistic methods for damage detection under environmental variability and nonlinear damage effects, including work presented at [ICCMS 2022](https://www.iccms.in/).
- In uncertainty quantification for PINNs, I explored GAN-augmented physics-informed neural networks to improve robustness under uncertain inputs and boundary conditions.
- My earlier application-driven work in monitoring and inverse problems shaped my current emphasis on reliability, calibration, and uncertainty-aware scientific decision support.

For publication-specific details, see [Publications]({{ base_path }}/publications/), [Talks]({{ base_path }}/talks/), and [Blog]({{ base_path }}/year-archive/).
