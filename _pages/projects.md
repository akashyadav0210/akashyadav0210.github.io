---
title: "Projects"
layout: single_noauthor
permalink: /projects/
author_profile: true
toc: false
custom_css: research
---

{% include base_path %}

<p class="rp-lede">Where our methods have been applied, and the projects we are working on now.</p>

<details class="rp-proj" id="foundation-models" open markdown="1">
<summary><span class="rp-proj-title">Calibrated forecasting with scientific foundation models</span><span class="rp-proj-sub">Frozen pretrained backbones · calibrated uncertainty in 3 minutes, not days of GPU time · NeurIPS 2026</span></summary>

<div class="rp-proj-body" markdown="1">

<figure class="rp-fig rp-video">
  <video src="{{ base_path }}/images/projects/sa-neurips2026.mp4" poster="{{ base_path }}/images/projects/sa-neurips2026-poster.jpg" width="1080" height="1200" autoplay loop muted playsinline controls aria-label="A 40-second animation. It compares a map of where a ClimaX weather forecast is wrong with a map of where stochastic attention says it is uncertain, and the two match. It then shows a frozen transformer returning one forecast, explains attention as a weighted average of values, replaces that average with a few random draws so each pass gives a new forecast, and ends with the one-time cost: 3 minutes for stochastic attention against 14 hours to 12 days for methods that retrain the network.">
    <a href="{{ base_path }}/images/projects/sa-neurips2026.mp4">Watch the 40-second explainer</a>
  </video>
  <figcaption>The idea in 40 seconds. Sampling the attention weights of a frozen ClimaX turns one forecast into an ensemble, and the ensemble spreads out where the forecast is wrong.</figcaption>
</figure>

Pretrained transformers such as ClimaX are increasingly used as fast surrogates for weather and climate. They return a single deterministic forecast, with no indication of how far it can be trusted.

Existing ways of adding uncertainty retrain the model, which on ClimaX takes 14 hours to 12 days of GPU time. We instead make the attention layers stochastic at inference time, so the frozen model produces an ensemble without any change to its weights. A single parameter sets the spread, and we tune it in about 3 minutes so that the spread matches the model's actual errors.

A useful uncertainty estimate should be large where the model is wrong and small where it is right. On ClimaX the two patterns closely match.

<figure class="rp-fig">
  <img src="{{ base_path }}/images/projects/spread-error-agreement.png" alt="Two global maps side by side on the same colour scale. The left map shows the actual error of the ClimaX forecast, the right shows the spread predicted by stochastic attention. Both show low values across the tropics and high values in the mid and high latitudes of both hemispheres, and the two patterns are nearly identical.">
  <figcaption>Actual error of ClimaX (left) and the uncertainty predicted by our method (right), for 500&nbsp;hPa geopotential at a 72-hour lead over 17,376 forecasts. Across grid cells, the correlation is 0.98.</figcaption>
</figure>

We have also tested the method on TimesFM for time-series forecasting and on FT-Transformer for tabular regression.

<p class="rp-key"><strong>Methods:</strong> <a href="{{ base_path }}/research/#uncertainty-calibration-for-scientific-foundation-models">stochastic attention</a> · <a href="{{ base_path }}/research/#efficient-calibration-of-stochastic-models">Bayesian optimization under uncertainty</a><br><strong>Papers:</strong> <a href="https://arxiv.org/abs/2604.19530">Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention</a> · <a href="https://doi.org/10.1061/AJRUA6.RUENG-1854">Bayesian Optimization under Uncertainty for Training a Scale Parameter in Stochastic Models</a><br><strong>Code:</strong> coming soon<br><strong>Collaborators:</strong> Taiwo A. Adebiyi, Ruda Zhang</p>

</div>
</details>

<details class="rp-proj" id="co2-storage" markdown="1">
<summary><span class="rp-proj-title">Monitoring underground CO₂ storage</span><span class="rp-proj-sub">Ongoing · UH Chevron Energy Graduate Fellowship, 2026–2027</span></summary>

<div class="rp-proj-body" markdown="1">

Carbon storage puts CO₂ deep underground and is meant to keep it there for good. Regulators require years of monitoring afterwards, to track where the plume has moved and how far the pressure has spread. The measurements are sparse (a few wells and the occasional survey), so most of the picture has to come from models.

Reservoir simulators are too slow to rerun every time new data comes in. AI surrogates are fast, but they were built to predict, and they say nothing about how far a prediction can be trusted. We are building fast models for this setting that also report how uncertain they are.

The project has just started. We are working on open benchmarks first, and will shape the problem with input from engineers at Chevron.

<p class="rp-key"><strong>Collaborators:</strong> Ruda Zhang<br><strong>Announcement:</strong> <a href="https://uq.uh.edu/blog/akash-wins-chevron-fellowship">UQ group blog</a></p>

</div>
</details>

<details class="rp-proj" id="ic-shm" markdown="1">
<summary><span class="rp-proj-title">Damage diagnosis from inspection photos</span><span class="rp-proj-sub">A vision-language model and two classifiers that vote · IC-SHM 2026 competition · team of three, UH and IISc</span></summary>

<div class="rp-proj-body" markdown="1">

After an inspection, someone has to write down what damage each photo shows and what it looks like: a crack running left to right, or spalled concrete with the rebar showing. The 4th International Competition for Structural Health Monitoring (IC-SHM 2026) asked teams to automate that from about 1,200 annotated photos.

We fine-tuned a vision-language model (Qwen3-VL-8B) to name the damage and describe it, and had two simple image classifiers vote with it on the damage types, since the three tend to make different mistakes.

<figure class="rp-fig">
  <img src="{{ base_path }}/images/projects/icshm-committee.png" alt="Flowchart of the system. The image goes to the fine-tuned vision-language model, which answers the first official question with a category sentence and the second with a description. Categories from both answers become the language model's vote. The image also goes to a frozen SigLIP2 embedding, from which a nearest-neighbour classifier and a logistic regression each cast a vote. A per-label majority of the three votes gives the damage categories, and the model's own generated sentence gives the description.">
  <figcaption>How the three experts combine. The language model answers the competition's two questions (q<sub>1</sub>: which damage is visible; q<sub>2</sub>: what it looks like) and writes the description. On each damage type it votes with two classifiers that work on frozen image features, and a type is kept when at least two of the three report it.</figcaption>
</figure>

On one photo of honeycombed concrete, the language model saw corrosion, exposed rebar and spalling. Both classifiers saw honeycomb, and the vote went with them.

What interested me most was what fine-tuning actually changed. Before it, the model often named damage in its own words instead of the task's categories. A small adapter fixed that, yet a nearest-neighbour classifier on an image encoder we never retrained recognised the damage types about as well. Fine-tuning mostly taught the model how the annotators talk.

On our validation split the committee reached a micro-F1 of 0.98; the organisers hold back the test labels.

<p class="rp-key"><strong>Report:</strong> An Expert Committee for Multi-Type Structural Damage Diagnosis (submitted September 2026)<br><strong>Collaborators:</strong> Pranjal Chechani, Varsha Puklath (IISc)</p>

</div>
</details>

<details class="rp-proj" id="space-structure" markdown="1">
<summary><span class="rp-proj-title">Shock response of a space structure</span><span class="rp-proj-sub">42,486-DOF spacecraft component · 38 minutes → 0.2 seconds · calibrated intervals on shock response</span></summary>

<div class="rp-proj-body" markdown="1">

We study a component of a space structure subjected to an impulse load. A heavy central mass sits on rigid links above a cylindrical shell, with sensitive equipment behind a shock-absorbing block. After the event, we need to know whether the acceleration reaching that equipment stayed within safe limits, using only a few monitored points and in close to real time.

<figure class="rp-fig">
  <img src="{{ base_path }}/images/projects/space-structure-system.png" alt="Left: the finite element model of the space structure component, showing the upper assembly, the cylindrical shell and the mounting pedestal. Right: the impulse force applied to the central mass, oscillating between plus and minus 2.5 times 10 to the 5 pound-force and decaying over roughly 75 milliseconds.">
  <figcaption>Finite element model of the component (left) and the impulse load applied to the central mass, which decays over about 75&nbsp;ms (right).</figcaption>
</figure>

The high-fidelity finite element model, built in LS-DYNA, has **42,486 degrees of freedom** and takes about **38 minutes** per run. A reduced-order model gives an answer in **0.2 seconds**, roughly 11,000× faster, which makes near real-time monitoring possible. The reduction, however, introduces errors that the reduced model does not report.

Using stochastic subspaces, the reduced model also gives a calibrated prediction interval on acceleration and velocity at the critical nodes, including nodes not used in training. Bayesian optimization under uncertainty keeps the calibration affordable, so the approach remains much cheaper than running the full simulation.

<figure class="rp-fig">
  <img src="{{ base_path }}/images/projects/space-structure-result.png" alt="Acceleration in X at a critical node over 75 milliseconds. The high-fidelity model is in black, the reduced-order model in dashed red, the stochastic reduced-order model mean in blue, and its 95 percent predictive interval as a shaded band. Three inset panels zoom into the early, middle and late response. The reduced model systematically understates the peaks, while the shaded interval covers the high-fidelity response.">
  <figcaption>Acceleration at a critical node. The reduced model (red) underestimates the peaks, while the 95% prediction interval of the stochastic reduced model (shaded) covers the high-fidelity response (black).</figcaption>
</figure>

<p class="rp-key"><strong>Methods:</strong> <a href="{{ base_path }}/research/#model-uncertainty-in-computational-mechanics">stochastic subspaces</a> · <a href="{{ base_path }}/research/#efficient-calibration-of-stochastic-models">Bayesian optimization under uncertainty</a><br><strong>Papers:</strong> <a href="https://doi.org/10.1007/s00466-025-02701-6">Stochastic Subspace via Probabilistic PCA</a> · <a href="https://doi.org/10.1061/AJRUA6.RUENG-1948">Nonparametric Stochastic Subspaces via the Bootstrap</a> · <a href="https://doi.org/10.1061/AJRUA6.RUENG-1854">Bayesian Optimization under Uncertainty for Training a Scale Parameter in Stochastic Models</a><br><strong>Code:</strong> <a href="https://github.com/UQUH/SS_PPCA">SS-PPCA</a> · <a href="https://github.com/UQUH/SS_Bootstrap">SS-Bootstrap</a> · <a href="https://github.com/UQUH/SO-BO-scale">SO-BO-scale</a><br><strong>Collaborators:</strong> Ruda Zhang</p>

</div>
</details>

<details class="rp-proj" id="shm" markdown="1">
<summary><span class="rp-proj-title">Damage detection on steel truss bridges</span><span class="rp-proj-sub">Damage vs. seasonal temperature · likelihood-free inference · M.Tech thesis, IISc</span></summary>

<div class="rp-proj-body" markdown="1">

Both damage and temperature change how a bridge vibrates, and the effect of temperature can be larger than that of damage. A monitoring system has to separate the two, or it will raise false alarms or miss real damage. The likelihood for this inverse problem is not available in closed form.

We used approximate Bayesian computation to infer the damage state, modelling the effect of temperature directly instead of filtering it out as noise, and then extended the method to the nonlinear response caused by damage.

<p class="rp-key"><strong>Thesis:</strong> <a href="https://etd.iisc.ac.in/handle/2005/6115">M.Tech (Research) thesis</a>, Indian Institute of Science<br><strong>Paper:</strong> <a href="https://doi.org/10.1007/978-981-96-9416-7_13">Structural Health Monitoring of Steel Truss Bridges Subjected to Environmental Variability</a><br><strong>Code:</strong> <a href="https://github.com/akashyadav0210/ABC_SHM">ABC_SHM</a><br><strong>Collaborators:</strong> Ananth Ramaswamy</p>

</div>
</details>

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
