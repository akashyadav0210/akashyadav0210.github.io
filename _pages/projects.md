---
title: "Projects"
layout: single_noauthor
permalink: /projects/
author_profile: true
toc: false
custom_css: research
---

{% include base_path %}

<p class="rp-lede">The systems the methods were built for, and the decisions they have to support.</p>

<details class="rp-proj" id="foundation-models" open markdown="1">
<summary><span class="rp-proj-title">Calibrated forecasting with scientific foundation models</span><span class="rp-proj-sub">Frozen pretrained backbones · calibrated uncertainty in 3 minutes, not days of GPU time · NeurIPS 2026</span></summary>

<div class="rp-proj-body" markdown="1">

Pretrained transformers are being adopted as general-purpose surrogates for weather and climate. ClimaX is one of them: trained on atmospheric data, far faster than numerical weather prediction, and it returns a single deterministic field. A forecast with no credible spread cannot support a decision that turns on how bad the tail might be.

The standard remedies retrain the backbone, at 14 hours to 12 days of GPU time. Most groups using these models cannot do that. The weights come from someone else and the compute is not there.

We leave every weight untouched. Attention already computes an expectation over the softmax weights, so drawing a few samples from those same weights and averaging them turns a frozen backbone into an ensemble. One parameter sets the spread, and it is tuned so the spread matches the error the model actually makes.

<figure class="rp-fig">
  <img src="{{ base_path }}/images/projects/stochastic-attention-mechanism.png" alt="Two rows comparing attention mechanisms. Deterministic attention multiplies the full softmax weight row by the value matrix, giving an expectation. Stochastic attention draws nu samples from the same weights, marked as red dots on the sampled cells, and averages the corresponding value vectors.">
  <figcaption>Deterministic attention averages the value vectors against the whole softmax weight row. Stochastic attention draws a handful of samples from that same row instead. Nothing is retrained; the only new quantity is the number of samples.</figcaption>
</figure>

Whether it works is a question about geography, not just about averages. The model should be uncertain in the places where it is actually wrong.

<figure class="rp-fig">
  <img src="{{ base_path }}/images/projects/spread-error-agreement.png" alt="Two global maps side by side on the same colour scale. The left map shows the actual error of the ClimaX forecast, the right shows the spread predicted by stochastic attention. Both show low values across the tropics and high values in the mid and high latitudes of both hemispheres, and the two patterns are nearly identical.">
  <figcaption>Where ClimaX is wrong on 500&nbsp;hPa geopotential at a 72-hour lead, and where our method says it is uncertain, over 17,376 forecasts. The two fields are the same map: cell by cell, <em>r</em> = 0.98.</figcaption>
</figure>

<p class="rp-key">Sharpest intervals and lowest cost of the methods compared, with no post-hoc calibration step: 3 minutes of tuning against 14 hours to 12 days of retraining. Also evaluated on TimesFM and FT-Transformer. <a href="https://arxiv.org/abs/2604.19530">Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention</a>, NeurIPS 2026</p>

</div>
</details>

<details class="rp-proj" id="space-structure" markdown="1">
<summary><span class="rp-proj-title">Shock response of a space structure</span><span class="rp-proj-sub">42,486-DOF spacecraft component · 38 minutes → 0.2 seconds · calibrated intervals on shock response</span></summary>

<div class="rp-proj-body" markdown="1">

A component of a space structure takes an impulse load. A heavy central mass sits on rigid links above a cylindrical shell, and behind a shock-absorption block sits essential equipment. The question after the event is whether the acceleration that reached that equipment stayed within survivable limits, and it has to be answered from a handful of monitored points, close to real time.

<figure class="rp-fig">
  <img src="{{ base_path }}/images/projects/space-structure-system.png" alt="Left: the finite element model of the space structure component, showing the upper assembly, the cylindrical shell and the mounting pedestal. Right: the impulse force applied to the central mass, oscillating between plus and minus 2.5 times 10 to the 5 pound-force and decaying over roughly 75 milliseconds.">
  <figcaption>The component as modelled, and the shock it has to survive: the impulse decays over about 75&nbsp;ms while exciting the full frequency content of the structure.</figcaption>
</figure>

The high-fidelity finite element model that answers it has **42,486 degrees of freedom** and takes about **38 minutes** per run. A reduced-order model answers in **0.2 seconds**, roughly 11,000× faster. That speedup is the only reason monitoring at this cadence is possible, and it is also what makes the answer untrustworthy: reducing the model discards the information needed to judge the result.

We made the fast model report its own reliability. Stochastic subspaces put the reduction error back into the prediction as a calibrated interval on acceleration and velocity at the critical nodes, and at nodes the fitting never saw. Bayesian optimization under uncertainty makes the calibration affordable at this scale, so the whole thing stays cheaper than the simulation it replaces.

<figure class="rp-fig">
  <img src="{{ base_path }}/images/projects/space-structure-result.png" alt="Acceleration in X at a critical node over 75 milliseconds. The high-fidelity model is in black, the reduced-order model in dashed red, the stochastic reduced-order model mean in blue, and its 95 percent predictive interval as a shaded band. Three inset panels zoom into the early, middle and late response. The reduced model systematically understates the peaks, while the shaded interval covers the high-fidelity response.">
  <figcaption>Acceleration at a critical node. The reduced model (red) misses the peaks that decide whether the equipment survives; the interval (shaded) covers the high-fidelity response (black) instead of hiding the gap, at 0.2&nbsp;s per evaluation rather than 38&nbsp;minutes.</figcaption>
</figure>

<p class="rp-key">Model built in LS-DYNA; transient response integrated with Newmark-β. <a href="https://doi.org/10.1007/s00466-025-02701-6">SS-PPCA</a> · <a href="https://doi.org/10.1061/AJRUA6.RUENG-1948">SS-Bootstrap</a> · <a href="https://doi.org/10.1061/AJRUA6.RUENG-1854">BO under uncertainty</a></p>

</div>
</details>

<details class="rp-proj" id="shm" markdown="1">
<summary><span class="rp-proj-title">Damage detection on steel truss bridges</span><span class="rp-proj-sub">Damage vs. seasonal temperature · likelihood-free inference · M.Tech thesis, IISc</span></summary>

<div class="rp-proj-body" markdown="1">

A crack changes how a bridge vibrates. So does a twenty-degree change in air temperature, and it changes it by more. Any monitoring system that cannot separate the two will either raise alarms every summer or stay silent through real damage. The underlying inverse problem has no likelihood you can write down.

We used approximate Bayesian computation to infer damage state while treating thermal variation as part of the model rather than as noise to be filtered out, then extended it to the nonlinear response that damage itself introduces. This is where my interest in models that misreport their own confidence began.

<p class="rp-key">M.Tech (Research) thesis, Indian Institute of Science, with Dr. Ananth Ramaswamy. <a href="https://etd.iisc.ac.in/handle/2005/6115">Thesis</a> · <a href="https://github.com/akashyadav0210/ABC_SHM">code</a> · presented at ICCMS 2022, IIT Indore</p>

</div>
</details>

Methods behind these on the [Research]({{ base_path }}/research/) page · papers on [Publications]({{ base_path }}/publications/)

<script>
/* Open the targeted project when arriving via an anchor (e.g. /projects/#shm);
   without this a cross-page link lands on a collapsed section.
   Block comments only: compress_html strips newlines in production, which would
   make a // comment swallow the rest of the script. */
(function () {
  function openTarget() {
    var id = window.location.hash.slice(1);
    if (!id) { return; }
    var el = document.getElementById(id);
    if (el && el.tagName === 'DETAILS') {
      el.open = true;
      el.scrollIntoView();
    }
  }
  window.addEventListener('hashchange', openTarget);
  openTarget();
})();
</script>
