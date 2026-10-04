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

<figure class="rp-fig rp-video">
  <video src="{{ base_path }}/images/projects/sa-neurips2026.mp4" poster="{{ base_path }}/images/projects/sa-neurips2026-poster.jpg" width="1080" height="1200" autoplay loop muted playsinline controls aria-label="A 40-second animation. It compares a map of where a ClimaX weather forecast is wrong with a map of where stochastic attention says it is uncertain, and the two match. It then shows a frozen transformer returning one forecast, explains attention as a weighted average of values, replaces that average with a few random draws so each pass gives a new forecast, and ends with the one-time cost: 3 minutes for stochastic attention against 14 hours to 12 days for methods that retrain the network.">
    <a href="{{ base_path }}/images/projects/sa-neurips2026.mp4">Watch the 40-second explainer</a>
  </video>
  <figcaption>The idea in 40 seconds. Sampling the attention weights of a frozen ClimaX turns one forecast into an ensemble, and the ensemble spreads out where the forecast is wrong.</figcaption>
</figure>

Pretrained transformers are being adopted as general-purpose surrogates for weather and climate. ClimaX is one of them: trained on atmospheric data, far faster than numerical weather prediction, and it returns a single deterministic field. A forecast with no credible spread cannot support a decision that turns on how bad the tail might be.

The standard remedies retrain the backbone, at 14 hours to 12 days of GPU time. Most groups using these models cannot do that. The weights come from someone else and the compute is not there.

We leave every weight untouched. Attention already computes an expectation over the softmax weights, so drawing a few samples from those same weights and averaging them turns a frozen backbone into an ensemble. One parameter sets the spread, and it is tuned so the spread matches the error the model actually makes.

Whether it works is a question about geography, not just about averages. The model should be uncertain in the places where it is actually wrong.

<figure class="rp-fig">
  <img src="{{ base_path }}/images/projects/spread-error-agreement.png" alt="Two global maps side by side on the same colour scale. The left map shows the actual error of the ClimaX forecast, the right shows the spread predicted by stochastic attention. Both show low values across the tropics and high values in the mid and high latitudes of both hemispheres, and the two patterns are nearly identical.">
  <figcaption>Where ClimaX is wrong on 500&nbsp;hPa geopotential at a 72-hour lead, and where our method says it is uncertain, over 17,376 forecasts. The two fields are the same map: cell by cell, <em>r</em> = 0.98.</figcaption>
</figure>

<p class="rp-key">Sharpest intervals and lowest cost of the methods compared, with no post-hoc calibration step: 3 minutes of tuning against 14 hours to 12 days of retraining. Also evaluated on TimesFM and FT-Transformer. <a href="https://arxiv.org/abs/2604.19530">Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention</a>, NeurIPS 2026</p>

</div>
</details>

<details class="rp-proj" id="co2-storage" markdown="1">
<summary><span class="rp-proj-title">Monitoring underground CO₂ storage</span><span class="rp-proj-sub">Ongoing · UH Chevron Energy Graduate Fellowship, 2026–2027</span></summary>

<div class="rp-proj-body" markdown="1">

Carbon storage puts CO₂ deep underground and is meant to keep it there for good. Regulators require years of monitoring afterwards, to track where the plume has moved and how far the pressure has spread. The measurements are sparse (a few wells and the occasional survey), so most of the picture has to come from models.

Reservoir simulators are too slow to rerun every time new data comes in. AI surrogates are fast, but they were built to predict, and they say nothing about how far a prediction can be trusted. We are building fast models for this setting that also report how uncertain they are.

The project has just started. We are working on open benchmarks first, and will shape the problem with input from engineers at Chevron.

<p class="rp-key">With Dr. Ruda Zhang · <a href="https://uq.uh.edu/blog/akash-wins-chevron-fellowship">UQ group announcement</a></p>

</div>
</details>

<details class="rp-proj" id="ic-shm" markdown="1">
<summary><span class="rp-proj-title">Damage diagnosis from inspection photos</span><span class="rp-proj-sub">A vision-language model and two classifiers that vote · IC-SHM 2026 competition · team of three, UH and IISc</span></summary>

<div class="rp-proj-body" markdown="1">

After an inspection, someone has to write down what damage each photo shows and what it looks like: a crack running left to right, or spalled concrete with the rebar showing. The 4th International Competition for Structural Health Monitoring (IC-SHM 2026) asked teams to automate that from about 1,200 annotated photos.

I led a team of three, with Pranjal Chechani and Varsha Puklath from IISc. We fine-tuned a vision-language model (Qwen3-VL-8B) to name the damage and describe it, and had two simple image classifiers vote with it on the damage types, since the three tend to make different mistakes. On one photo of honeycombed concrete, the language model saw corrosion, exposed rebar and spalling. Both classifiers saw honeycomb, and the vote went with them.

What interested me most was what fine-tuning actually changed. Before it, the model often named damage in its own words instead of the task's categories. A small adapter fixed that, yet a nearest-neighbour classifier on an image encoder we never retrained recognised the damage types about as well. Fine-tuning mostly taught the model how the annotators talk.

<p class="rp-key">Micro-F1 of 0.98 on our validation split; the organisers hold back the test labels. Report submitted September 2026.</p>

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
