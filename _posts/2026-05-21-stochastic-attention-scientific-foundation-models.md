---
title: "Stochastic Attention for Uncertainty-Aware Scientific Foundation Models"
date: 2026-05-21 09:30:00 -0500
permalink: /posts/2026/05/stochastic-attention-scientific-foundation-models/
tags:
  - stochastic-attention
  - scientific-foundation-models
  - uncertainty
  - calibration
  - forecasting
---

*Update, September 2026: this work has been accepted at NeurIPS 2026.*

Scientific foundation models are being handed jobs that used to belong to simulators. ClimaX produces atmospheric forecasts in seconds where numerical weather prediction needs hours on a supercomputer. TimesFM forecasts series it was never trained on. They are fast, reusable, and deterministic: you get one field, one trajectory, one number, and nothing at all about how much of it to believe.

That last part is the problem, because forecasts feed decisions and decisions usually turn on the tail.

## The retraining tax

The established ways of putting uncertainty into a deep model all reach for the weights. SWAG and Multi-SWAG need an ensemble of training trajectories. IVON replaces the optimizer. Contextual dropout adds a learned dropout module. Each of them works, and each of them assumes you are in a position to retrain the backbone.

On ClimaX that assumption costs between 14 hours and 12 days of GPU time. Most groups using a foundation model cannot pay it. The weights came from someone else, the training data may not be available, and the compute budget is what it is.

## Attention is already an average

Here is the observation the paper turns on. Softmax attention computes a weighted average of value vectors with weights that sum to one, which makes it an expectation: the output is the mean of the value vectors under a categorical distribution over positions.

An expectation can be estimated by sampling. Draw &nu; positions from that same categorical distribution, average the value vectors you land on, and you have an unbiased estimate of what deterministic attention computes exactly. Do this at every attention layer and every forward pass returns a slightly different answer.

<figure class="full">
  <img src="/images/projects/stochastic-attention-mechanism.png" alt="Two rows comparing attention mechanisms. The top row, deterministic attention, multiplies the full softmax weight row by the value matrix to give an expectation. The bottom row, stochastic attention, draws nu samples from the same weight row, marked as red dots on the sampled cells, and averages the corresponding value vectors.">
  <figcaption>The whole change, in one row. Deterministic attention (top) averages the value vectors against the entire softmax weight row. Stochastic attention (bottom) draws &nu; samples from that same row and averages those instead.</figcaption>
</figure>

Nothing has been retrained and nothing has been added to the architecture. The distribution being sampled is the one the trained model already produces and then averages away.

## One knob, tuned against the model's own errors

Sampling produces spread, but arbitrary spread is not useful. The sample size &nu; controls it: small &nu; gives a wide, noisy ensemble, and as &nu; grows the estimate tightens back toward the deterministic output. So &nu; is the only parameter, and it alone decides how uncertain the model claims to be.

We choose it by matching dispersion to error. &nu; is set so that the spread the sampling induces is as close as possible to the residual error the model actually makes, searched with Bayesian optimization under uncertainty. On ClimaX that search takes about three minutes.

## Does the uncertainty land in the right places

Calibration is usually reported as one aggregate number, which can hide a model that is uncertain by the right amount on average and uncertain in the wrong places. A sharper test is spatial. Take ClimaX at a 72-hour lead on 500 hPa geopotential, find where it is actually wrong across 17,376 forecasts, and compare that against where stochastic attention says it is unsure.

<figure class="full">
  <img src="/images/projects/spread-error-agreement.png" alt="Two global maps side by side on the same colour scale. The left map shows the actual error of the ClimaX forecast, the right the spread predicted by stochastic attention. Both are low through the tropics and high in the mid and high latitudes of both hemispheres, and the two patterns are nearly identical.">
  <figcaption>Actual error and predicted spread, cell by cell, over 17,376 forecasts. The correlation is 0.98.</figcaption>
</figure>

The two maps are the same map. Both are calm through the tropics and noisy in the mid and high latitudes of both hemispheres, and cell by cell the correlation is 0.98. The model is not uncertain in general. It is uncertain where it fails.

## The numbers

On ClimaX, against SWAG, Multi-SWAG, IVON, contextual dropout and hierarchical stochastic attention, with every baseline temperature-scaled and ours carrying no post-hoc calibration stage at all:

- calibration error (W&#8321;) of 0.047, against 0.102 for the nearest baseline before its own post-hoc fit
- 90% intervals 32% narrower than the next sharpest method
- accuracy within 1.3% of the best baseline
- three minutes of tuning, against 14 hours to 12 days of retraining

None of this is specific to weather. On TimesFM across eight ETT configurations it gives the lowest mean calibration error, 0.037 against 0.044, and the lowest worst case. On FT-Transformer across eight UCI datasets it is best on six, and wins or ties 39 of 40 paired comparisons.

## Why I find this interesting

Not the method, which is simple. What stays with me is that the uncertainty was already in there. A trained transformer carries a distribution at every attention layer and then averages it out of existence, and that averaging is the only reason the model looks deterministic at all. Sampling it does not so much add uncertainty as stop throwing it away.

It also makes this something a practitioner can use without asking anyone's permission. There is no retraining to negotiate and no architecture to modify. If you have the weights and can run a forward pass, you can run several.

Paper: [Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention](https://arxiv.org/abs/2604.19530), with Taiwo A. Adebiyi and Ruda Zhang. NeurIPS 2026.
