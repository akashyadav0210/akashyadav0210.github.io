---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
---

{% include base_path %}

## Research Projects

### Overview
- **Uncertainty-aware Scientific Foundation Models** — Probabilistic LoRA for better-calibrated foundation models. [Read more](#uncertainty-quantification-in-scientific-foundation-models)
- **Correcting Model-form Uncertainty** — SROM corrections to reduce model error in safety-critical predictions. [Read more](#correcting-model-form-uncertainty)
- **Characterizing Model-form Uncertainty** — SS-PPCA and SS-Bootstrap for characterizing model error. [Read more](#characterizing-model-form-uncertainty)
- **Bayesian Optimization under Uncertainty** — Faster hyperparameter tuning under noisy evaluations. [Read more](#bayesian-optimization-under-uncertainty)
- **Uncertainty Quantification in PINNs** — GAN-augmented PINNs for robust generalization. [Read more](#uncertainty-quantification-in-pinns)
- **Structural Health Monitoring using ABC** — Probabilistic SHM under thermal variability. [Read more](#structural-health-monitoring-using-abc)

### Uncertainty Quantification in Scientific Foundation Models
**Duration:** Jun 2025 — Present  
**Mentor:** Dr. Ruda Zhang  
**Collaborator:** Taiwo Adebiyi  

**Problem:** Foundation models are typically fine-tuned deterministically, which limits uncertainty representation for scientific decision-making.  
**Approach:** Probabilistic Low-Rank Adaptation (LoRA) strategies and Bayesian deep learning methods.  
**Tools:** Python, PyTorch, LoRA.  
**Outcome:** A probabilistic, better-calibrated model compared to deterministic baselines.

### Correcting Model-form Uncertainty
**Duration:** Jun 2024 — Present  
**Mentor:** Dr. Ruda Zhang  

**Problem:** Structural discrepancies in computational models lead to unreliable predictions in safety-critical settings.  
**Approach:** Stochastic reduced-order modeling (SROM) corrections at reduced dimensionality to lower computational cost.  
**Outcome:** Improved predictive accuracy on benchmark computational mechanics problems.

### Characterizing Model-form Uncertainty
**Duration:** Aug 2023 — Mar 2025  
**Mentor:** Dr. Ruda Zhang  

**Problem:** High-dimensional structural simulations are biased under incorrect model assumptions.  
**Approach:** Stochastic Subspace via PPCA (SS-PPCA) and a bootstrap-based SS-Bootstrap method.  
**Outcome:** Improved accuracy; presented at WCCM/PANACM 2024 and CASML 2024; SS-PPCA published in Computational Mechanics (Springer).

### Bayesian Optimization under Uncertainty
**Duration:** Jul 2024 — Feb 2025  
**Mentor:** Dr. Ruda Zhang  

**Problem:** Noisy evaluations make hyperparameter optimization expensive.  
**Approach:** Bayesian optimization applied to scale parameters in SS-PPCA and SS-Bootstrap.  
**Outcome:** Reduced training data needs; up to 40x faster convergence vs. 1D Monte Carlo optimization.

### Uncertainty Quantification in PINNs
**Duration:** Oct 2024 — Dec 2024  
**Institution:** Rice University  

**Problem:** PINNs often fail to generalize under uncertain inputs and boundary conditions.  
**Approach:** GAN-augmented PINNs (inspired by Yang et al., 2019) to improve robustness.  
**Tools:** PyTorch, GANs, PINNs.  
**Outcome:** Improved robustness in uncertainty quantification tasks.

### Structural Health Monitoring using ABC
**Duration:** Jul 2021 — Jun 2023  
**Mentor:** Dr. Ananth Ramaswamy, IISc Bangalore  

**Problem:** Thermal variability and nonlinear damage signatures complicate bridge monitoring.  
**Approach:** Approximate Bayesian Computation (ABC) framework for SHM under varying temperature.  
**Outcome:** Robust probabilistic framework; presented at ICCMS 2022.
