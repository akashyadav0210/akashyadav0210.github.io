---
layout: archive
title: "Code"
permalink: /code/
author_profile: true
---

{% include base_path %}

## Open-Source Code

This page collects selected open-source research code accompanying my work in uncertainty quantification, model calibration, and model-form uncertainty. These repositories are primarily research codebases intended to support reproducible experiments, methodological comparisons, and follow-up work in computational science and scientific machine learning.

Most of the current repositories are hosted under the [UQUH GitHub organization](https://github.com/UQUH). They are best viewed as research implementations rather than general-purpose software packages, but each repository is organized so that readers can reproduce the main experiments and adapt the methods to related problems.

## Selected Repositories

- [Open-Source Code](#open-source-code)
- [Selected Repositories](#selected-repositories)
- [SS-PPCA: Stochastic Subspace via Probabilistic Principal Component Analysis](#ss-ppca-stochastic-subspace-via-probabilistic-principal-component-analysis)
- [SO-BO-scale: Bayesian Optimization under Uncertainty](#so-bo-scale-bayesian-optimization-under-uncertainty)
- [SS-Bootstrap: Stochastic Subspace via Bootstrap](#ss-bootstrap-stochastic-subspace-via-bootstrap)
- [Notes](#notes)

## SS-PPCA: Stochastic Subspace via Probabilistic Principal Component Analysis

[Repository](https://github.com/UQUH/SS_PPCA) | [Paper](https://link.springer.com/article/10.1007/s00466-025-02701-6)

SS-PPCA is a research implementation of a stochastic subspace methodology for characterizing model-form error in high-dimensional computational models. The core idea is to build a probabilistic representation of reduced subspaces so that structured model discrepancy can be characterized more efficiently.

- **Use it when:** you want a structured probabilistic method for characterizing model-form uncertainty in high-dimensional simulation outputs.
- **Where it fits:** computational mechanics and related simulation settings where deterministic reduced-order models miss systematic discrepancy.
- **Environment:** MATLAB `R2023b` or later, with the Statistics and Machine Learning Toolbox and the Optimization Toolbox.
- **What it includes:** example problems for parametric linear static settings and higher-dimensional model-error characterization, with results written automatically to a `results/` directory.

## SO-BO-scale: Bayesian Optimization under Uncertainty

[Repository](https://github.com/UQUH/SO-BO-scale) | [Paper](https://arxiv.org/abs/2510.06439)

SO-BO-scale implements a Bayesian optimization framework for tuning a scale parameter in stochastic models under noisy evaluations. The repository is designed around calibration problems where direct trial-and-error tuning is expensive, unstable, or difficult to reproduce.

- **Use it when:** you need to calibrate a stochastic model with noisy objective evaluations and want a more systematic alternative to manual search or Monte Carlo-heavy tuning.
- **Where it fits:** uncertainty-aware model calibration, especially for stochastic subspace models and related scientific modeling workflows.
- **Environment:** MATLAB `R2023b` or later plus Python packages including `numpy`, `scipy`, `matplotlib`.
- **What it includes:** three example problems, the proposed BO implementation, GP-based and Monte Carlo baselines, state-of-the-art noisy-BO baselines, and a robustness study across seeds.

## SS-Bootstrap: Stochastic Subspace via Bootstrap

[Repository](https://github.com/UQUH/SS_Bootstrap) | [Preprint](https://arxiv.org/abs/2512.15624)

SS-Bootstrap is a nonparametric stochastic subspace implementation for model-error characterization. Instead of relying on a parametric subspace model, it uses the empirical data distribution directly, making it a useful complement to SS-PPCA.

- **Use it when:** you want a nonparametric alternative for characterizing model-form error and prefer to work directly with the empirical distribution.
- **Where it fits:** stochastic reduced-order modeling and model-discrepancy analysis when parametric assumptions are undesirable or too restrictive.
- **Environment:** MATLAB `R2023b` or later, with the Statistics and Machine Learning Toolbox and the Optimization Toolbox.
- **What it includes:** an example benchmark problem, scripts for running the method end to end, and automatic saving of generated results and figures.

## Notes

- These repositories are tied closely to the corresponding papers, so the best starting point is usually the README together with the paper or preprint.
- As the software portfolio grows, I plan to add more reusable research infrastructure and uncertainty-aware scientific AI tooling here.

For related papers and talks, see [Publications]({{ base_path }}/publications/) and [Talks]({{ base_path }}/talks/).
