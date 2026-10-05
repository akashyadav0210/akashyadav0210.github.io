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

<figure style="display:block">
  <video src="/images/projects/sa-neurips2026.mp4" poster="/images/projects/sa-neurips2026-poster.jpg" width="1080" height="1200" autoplay loop muted playsinline controls style="display:block;width:100%;max-width:480px;height:auto;margin:0 auto;border-radius:3px;background:#fafafa" aria-label="A 40-second animation. It compares a map of where a ClimaX weather forecast is wrong with a map of where stochastic attention says it is uncertain, and the two match. It then shows a frozen transformer returning one forecast, explains attention as a weighted average of values, replaces that average with a few random draws so each pass gives a new forecast, and ends with the one-time cost: 3 minutes for stochastic attention against 14 hours to 12 days for methods that retrain the network.">
    <a href="/images/projects/sa-neurips2026.mp4">Watch the 40-second explainer</a>
  </video>
  <figcaption style="text-align:center;max-width:480px;margin:.6em auto 0">The 40-second version of this post.</figcaption>
</figure>

Scientific foundation models are increasingly used in place of expensive simulators. ClimaX produces atmospheric forecasts in seconds, where numerical weather prediction needs hours on a supercomputer, and TimesFM can forecast time series it was never trained on. These models are fast and reusable, but they are deterministic: they return a single forecast with no indication of how much to trust it.

This matters because decisions based on a forecast often depend on how likely an extreme outcome is.

## The cost of retraining

Established methods for adding uncertainty to a deep model all change how it is trained. SWAG and Multi-SWAG collect an ensemble along the training trajectory, IVON replaces the optimizer, and contextual dropout adds a learned dropout module. All of them require retraining the model.

On ClimaX, that takes between 14 hours and 12 days of GPU time. Many groups that use a foundation model cannot afford this, and some do not have access to the original training data.

## Attention is already an average

The key observation is simple. Softmax attention computes a weighted average of value vectors with weights that sum to one, which makes it an expectation: the output is the mean of the value vectors under a categorical distribution over positions.

An expectation can be estimated by sampling. Draw &nu; positions from that same categorical distribution, average the value vectors you land on, and you have an unbiased estimate of what deterministic attention computes exactly. Do this at every attention layer and every forward pass returns a slightly different answer.

<figure class="full">
  <img src="/images/projects/stochastic-attention-mechanism.png" alt="Two rows comparing attention mechanisms. The top row, deterministic attention, multiplies the full softmax weight row by the value matrix to give an expectation. The bottom row, stochastic attention, draws nu samples from the same weight row, marked as red dots on the sampled cells, and averages the corresponding value vectors.">
  <figcaption>Deterministic attention (top) averages the value vectors using the full softmax weights. Stochastic attention (bottom) draws &nu; samples from the same weights and averages those instead.</figcaption>
</figure>

No retraining is needed, and the architecture is unchanged. The distribution being sampled is the one the trained model already computes.

## Tuning the spread

Sampling produces spread, but arbitrary spread is not useful. The sample size &nu; controls it: small &nu; gives a wide, noisy ensemble, and as &nu; grows the estimate tightens back toward the deterministic output. &nu; is the only parameter, and it controls how uncertain the model is.

We choose it by matching dispersion to error. &nu; is set so that the spread the sampling induces is as close as possible to the residual error the model actually makes, searched with Bayesian optimization under uncertainty. On ClimaX that search takes about three minutes.

## Does the uncertainty land in the right places

Calibration is usually reported as a single number, which can hide a model that has the right amount of uncertainty on average but puts it in the wrong places. A stricter test is to compare maps. For ClimaX at a 72-hour lead on 500 hPa geopotential, we compared where the model is actually wrong across 17,376 forecasts with where stochastic attention says it is uncertain.

<figure class="full">
  <img src="/images/projects/spread-error-agreement.png" alt="Two global maps side by side on the same colour scale. The left map shows the actual error of the ClimaX forecast, the right the spread predicted by stochastic attention. Both are low through the tropics and high in the mid and high latitudes of both hemispheres, and the two patterns are nearly identical.">
  <figcaption>Actual error and predicted spread, cell by cell, over 17,376 forecasts. The correlation is 0.98.</figcaption>
</figure>

The two maps closely match. Both show low values in the tropics and high values in the mid and high latitudes of both hemispheres, and the correlation across grid cells is 0.98. The model is uncertain where it is actually wrong.

## The numbers

On ClimaX, against SWAG, Multi-SWAG, IVON, contextual dropout and hierarchical stochastic attention, with every baseline temperature-scaled and ours carrying no post-hoc calibration stage at all:

- calibration error (W&#8321;) of 0.047, against 0.102 for the nearest baseline before its own post-hoc fit
- 90% intervals 32% narrower than the next sharpest method
- accuracy within 1.3% of the best baseline
- three minutes of tuning, against 14 hours to 12 days of retraining

The method is not specific to weather. On TimesFM across eight ETT configurations it gives the lowest mean calibration error, 0.037 against 0.044, and the lowest worst case. On FT-Transformer across eight UCI datasets it is best on six, and wins or ties 39 of 40 paired comparisons.

## Why I find this interesting

The method itself is simple. What I find interesting is that the uncertainty is already inside the model. Every attention layer computes a distribution and then averages over it, which is why the output looks deterministic. Sampling from that distribution instead of averaging recovers the uncertainty.

It is also practical. It needs no retraining and no change to the architecture, only a few extra forward passes through a model you already have.

Paper: [Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention](https://arxiv.org/abs/2604.19530), with Taiwo A. Adebiyi and Ruda Zhang. NeurIPS 2026.

<script>
/* Skip autoplay for readers whose OS asks for reduced motion; the controls still play it.
   Block comments only: compress_html strips newlines in production. */
(function () {
  if (window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    var v = document.querySelectorAll('video[autoplay]');
    for (var i = 0; i < v.length; i++) { v[i].removeAttribute('autoplay'); v[i].pause(); }
  }
})();
</script>
