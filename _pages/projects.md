---
title: "Research"
layout: single_noauthor
permalink: /research/
author_profile: true
redirect_from:
  - /projects/
toc: true
toc_sticky: true
toc_label: "On this page"
toc_icon: "flask"
custom_css: research
---

{% include base_path %}

<p class="rp-lede">Building predictive models that know when they don't know — and what to do about it.</p>

## The question

Engineering and scientific decisions are increasingly taken on the output of models nobody can fully check: reduced-order surrogates, digital twins, and pretrained foundation models that forecast weather and emulate whole families of PDEs. Almost without exception these models are deterministic point predictors — and a point prediction cannot be argued with, deferred to, or acted on responsibly. Before a learned model is allowed to inform a consequential decision, its uncertainty has to be *checked*, not merely reported. The 2023 National Academies study of digital twins names verification, validation and uncertainty quantification as exactly that gate, and a 2025 DOE-commissioned National Academies study reaches the same conclusion for foundation models.

My work rests on one commitment: **uncertainty belongs in the structure of a model, not in a discrepancy term appended to its outputs — and it must be calibrated against observed error before the model is allowed to support a decision.** I have applied that commitment at two scales: to the reduced basis of a simulation surrogate, and to the attention of a pretrained transformer I did not train and could not retrain. What I want to build next is the layer that makes it dependable enough to spend.

<p class="rp-read"><strong>Linked claims are published or under review. Unlinked ones are open questions I am working on.</strong></p>

## What I have built

<div class="rp-entry" markdown="1">

### Calibrating a model I am not allowed to retrain
{: #frozen-model }

<p class="rp-decision">The decision this unblocks: whether a scientific workflow can be built on a given pretrained model at all — by a group with no budget, no gradients, and no training data for the target system.</p>

The scientist who wants to use a pretrained foundation model usually cannot retrain it. The weights may be vendor-supplied, export-controlled, or simply too expensive to touch, and training data for the target system may not exist. Existing ways of making a pretrained model report uncertainty assume gradient access to the backbone. Mine does not. I resample each attention row of a frozen transformer as a normalized multinomial draw from itself, so that repeated forward passes produce a calibrated predictive ensemble with every pretrained weight left untouched. On ClimaX, a pretrained weather backbone, this yields calibrated forecasts. On TimesFM it does not — and that asymmetry, not the success, is the more interesting result.

<p class="rp-opens"><strong>What it leaves open.</strong> Which backbones admit this and why, and whether calibration established offline survives deployment. Those are <a href="#t1-trust">T1</a> and <a href="#t2-vigilance">T2</a>.</p>

<p class="rp-key"><strong>Key work:</strong> <a href="https://arxiv.org/abs/2604.19530">Calibrating Scientific Foundation Models with Inference-Time Stochastic Attention</a> (under review)</p>

</div>

<div class="rp-entry" markdown="1">

### Model error belongs in the model's structure
{: #model-error }

<p class="rp-decision">The decision this unblocks: how much of a surrogate's prediction is basis artifact rather than physics — and therefore whether its confident answer can be believed.</p>

A reduced-order model replaces a high-fidelity simulation with a projection onto a low-dimensional basis, and the error that introduces is conventionally handled by appending a discrepancy term to the outputs. That location is convenient and unfaithful: the error originates in the basis. I replaced the fixed basis with a *distribution over subspaces* — first parametrically, through probabilistic PCA; then nonparametrically, through the bootstrap, which drops the Gaussian assumption and works from the empirical data distribution directly. Model-form error becomes something that can be propagated rather than absorbed. This is where the commitment above came from: the reduced basis is where I learned that structure is the right place to put uncertainty, and the frozen transformer is the same idea at a scale I do not control. Ongoing work extends this from characterizing the error to correcting it inside the reduced space.

<p class="rp-opens"><strong>What it leaves open.</strong> The resulting error distribution is derived <em>externally</em> to any learned model. That is what could let it score a foundation model's claimed uncertainty as right or wrong, rather than merely self-consistent — see <a href="#t1-trust">T1</a>.</p>

<p class="rp-key"><strong>Key work:</strong> <a href="https://doi.org/10.1007/s00466-025-02701-6">Stochastic Subspace via Probabilistic Principal Component Analysis for Characterizing Model Error</a> · <a href="https://github.com/UQUH/SS_PPCA">code</a> — <a href="https://doi.org/10.1061/AJRUA6.RUENG-1948">Nonparametric Stochastic Subspaces via the Bootstrap Method for Characterizing Model Error</a> · <a href="https://github.com/UQUH/SS_Bootstrap">code</a></p>

</div>

<div class="rp-entry" markdown="1">

### Uncertainty has to change what you do next
{: #decision-layer }

<p class="rp-decision">The decision this unblocks: where to spend the next expensive evaluation, when every evaluation is itself a random quantity rather than a number.</p>

Quantified uncertainty matters only when it changes a decision. A stochastic model carries hyperparameters — the scale of a subspace distribution, the dispersion of a predictive ensemble — and tuning them is expensive precisely because each evaluation is noisy. Standard Bayesian optimization treats that noise as observation error to be averaged away. I built an acquisition rule that treats the objective's own uncertainty as part of the objective, reaching the same parameter with 40× fewer evaluations than scalar bounded optimization and 15× fewer than standard GP-based Bayesian optimization. This is the decision layer of the program in miniature, at a scale small enough that I could already test it.

<p class="rp-opens"><strong>What it leaves open.</strong> The same rule, with the uncertainty supplied by a foundation model rather than by a model I built and could rebuild — see <a href="#t3-discovery">T3</a>.</p>

<p class="rp-key"><strong>Key work:</strong> <a href="https://doi.org/10.1061/AJRUA6.RUENG-1854">Bayesian Optimization under Uncertainty for Training a Scale Parameter in Stochastic Models</a> · <a href="https://github.com/UQUH/SO-BO-scale">code</a></p>

</div>

## The failure that set the agenda

The same intervention that calibrates ClimaX does not calibrate TimesFM.

Retrospective explanations exist. Some time-series backbones are already close to calibrated and largely insensitive to whichever distributional head is attached to them; architectures differ in how much genuine predictive structure their attention carries. Weight-spectrum diagnostics can already predict, without any data, how well a trained model will perform, and a recent eigenspectrum rule predicts which architectures support uncertainty discrimination at all. None of them predicts the quantity I actually need: the **sign and size of a model's response to a specific intervention**, read off the frozen weights before a forward pass. Until something does, choosing a pretrained model for a scientific workflow is a bet you settle after the allocation is spent.

That asymmetry is what I want to spend a postdoc on.

## What I want to build next

<div class="rp-fence" markdown="1">
**What follows has no papers behind it yet.** Everything above is published or under review and carries links; nothing below carries a link, because nothing below is done. These are the three thrusts of my research proposal, and each one names the completed work it stands on.
</div>

<figure class="rp-fig">
  <div class="rp-fig-scroll">
    <img src="{{ base_path }}/images/research/research-arc.svg" alt="One arc: a frozen scientific foundation model feeds T1 Trust, then T2 Vigilance, then T3 Discovery, with new high-fidelity evidence re-entering the loop at the start.">
  </div>
  <figcaption>One arc, and the return path is the point. Calibrated uncertainty on a frozen model is where this program starts, not where it stops: making that uncertainty dependable (T1, T2) is what licenses spending it (T3) — and a model that knows where it is wrong tells you where the next expensive computation, or the next piece of physics, should go.</figcaption>
</figure>

<div class="rp-thrusts" markdown="1">

<div markdown="1">

### T1 · Trust — which frozen models can be made honest?
{: #t1-trust }

<p class="rp-decision">Decide, from the weights alone, before a forward pass, whether a pretrained model's uncertainty will be worth acting on.</p>

I am after a functional of a frozen model's weights whose sign predicts whether injected stochasticity will produce uncertainty that *tracks error*. The population of public checkpoints cannot answer this: output mechanism travels with backbone identity, so a gain measured across releases largely records whether a release happened to ship spread at all. The year-one instrument is therefore a **controlled backbone zoo** — factorial over architecture, pretraining objective, and output head, on a fixed corpus at moderate scale. That is a facility artifact rather than a laptop experiment, and it is the main reason I want to do this somewhere with a computing campaign behind it. The endpoint is not a diagnostic but a repair: a minimal intervention that *confers* calibratability on a model that lacks it.

<p class="rp-builds"><strong>Builds on</strong> <a href="#frozen-model">the frozen-model result</a>, and on <a href="#model-error">stochastic subspaces</a>, which supply the externally derived error distribution to score a claimed uncertainty against.</p>

</div>

<div markdown="1">

### T2 · Vigilance — has it left the regime where that answer held?
{: #t2-vigilance }

<p class="rp-decision">Decide whether today's prediction is admissible at all — online, while the model runs, with no access to truth.</p>

Calibration established offline is a claim about a distribution the model has already seen. A surrogate inside a live workflow leaves that regime without announcing it and keeps returning confident answers, so detection has to work without ground truth and survive being checked at every single step — test repeatedly against a fixed threshold and the false-alarm rate is no longer the one you claimed. The sequential-testing layer for this is established; the contribution is the **score**: a map from a physical surrogate's residuals to a bounded statistic that is predictable from the past alone and holds its conditional mean in-regime. TimesFM becomes the negative control — a monitor built this way should give lead time on ClimaX and visibly refuse to fire on TimesFM. The endpoint is abstention: a surrogate that declines to answer.

<p class="rp-builds"><strong>Builds on</strong> <a href="#model-error">the residual structure of the subspace work</a>, and on the ClimaX/TimesFM asymmetry as a falsification test.</p>

</div>

<div markdown="1">

### T3 · Discovery — spending uncertainty on science
{: #t3-discovery }

<p class="rp-decision">Decide where the next expensive simulation or experiment should go — and where our physics is wrong.</p>

This is where calibrated uncertainty stops being a safety feature and becomes an instrument. Two uses, one cheap and one ambitious. The cheap one: let a frozen model's own calibrated uncertainty allocate high-fidelity computation, measured against the residual heuristics that surrogate-driven workflows use today. The ambitious one: a well-calibrated model that is *confidently* wrong is not merely failing — it is pointing at something. The test is constructive. Remove a known term from the governing equations, apply a model pretrained on the intact physics, and ask whether the confident-error map recovers where the term went. The endpoint is an escalation rule: a model that requests the computation or experiment which most reduces its own certified error. That is the smallest honest version of an autonomous scientific loop.

<p class="rp-builds"><strong>Builds on</strong> <a href="#decision-layer">the acquisition machinery</a>, posed at simulation scale with the uncertainty coming from a model I did not build.</p>

</div>

</div>

## Methods and standards

This program runs on probabilistic dimension reduction and subspace geometry, projection-based model reduction for nonlinear mechanics, Gaussian-process Bayesian optimization and value of information, conformal and distribution-free calibration, sequential testing with e-processes and betting supermartingales, and the internals of transformer attention.

Two standards I hold myself to. All guarantee claims in this work are scoped to finite-sample, distribution-free, or first-order tools — not asymptotic theory. And every diagnostic is reported as a difference against a pre-registered null with a bootstrap confidence interval, never as a raw correlation. Where I expect a method to lose — drift slow enough that a sequential test cannot see it, a departure the bounding transformation saturates — I say so and measure it.

I run experiments through coding-agent-assisted harnesses so that variants differ only where I intend them to. That is infrastructure for reproducible comparison, not a research theme.

## Where this leads

The endpoint I am building toward is a **reliability layer for computational science**: surrogates and foundation models that carry statistically valid uncertainty, detect their own invalid extrapolation, and escalate to high-fidelity simulation or experiment only when the expected value of that information justifies its cost.

Adjacent directions I am actively thinking about: operator-learning surrogates with certified error, optimal experimental design under model misspecification, anytime-valid monitoring for digital twins, and how uncertainty composes when workflows chain models — weather into hydrology into risk.

I came to this from structural health monitoring, where a damage signal and a seasonal temperature swing look alike in the data. A monitoring system that cannot tell them apart is a model that does not know what it does not know.

I expect to finish my Ph.D. in May 2027 and am looking for a postdoctoral position where this layer can be built against real high-fidelity data and a real computing campaign — [email me](mailto:ayadav4@uh.edu).

Papers and code: [Publications]({{ base_path }}/publications/) · [Code]({{ base_path }}/code/) · [Talks]({{ base_path }}/talks/)
