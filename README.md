# ParetoFlow original paper with interactive companions

This repository contains the MyST article, appendix, original figures and tables, and reading supplements. It retains the wording and structure of Ye Yuan, Can (Sam) Chen, Christopher Pal and Xue Liu's paper, **ParetoFlow: Guided Flows in Multi-Objective Optimization**, pinned to [arXiv:2412.03718v2](https://arxiv.org/html/2412.03718v2), 20 February 2025, CC BY 4.0. It uses the unmodified standard `article-theme`. This is an attributed interactive edition, not the authors' official repository.

The interactive applications and experimental records are maintained independently in **[paretoflow-dash](https://github.com/mikuknightforever/paretoflow-dash)**. The article embeds Dash pages over HTTP; neither repository imports files from the other. They may be cloned to any directories and updated separately.

## Read locally

The Windows launch scripts require Node.js 20+, Bun and PowerShell. First-time startup downloads the pinned MyST CLI and the standard article theme. The scripts run MyST 1.10.1 with Bun and leave the theme unmodified.

In one terminal, clone and start the article:

```powershell
git clone https://github.com/mikuknightforever/paretoflow-myst.git
cd paretoflow-myst
./start.ps1 -Port 3003
```

In another terminal, clone and start the Dash companion (Python 3.10–3.12):

```powershell
git clone https://github.com/mikuknightforever/paretoflow-dash.git
cd paretoflow-dash
python -m pip install -r requirements.txt
./start.ps1
```

Open http://localhost:3003 to read the article. Dash uses http://localhost:8053. Keep both terminals running to use the embedded dashboards. The recorded data is included in the Dash repository; viewing does not require training, a GPU or PyTorch. An existing preview may use another article port.

This remains a local preview: repository pages do not run the dashboards. The iframe URLs currently point to `localhost:8053`.

## Build and validation

Run `./build.ps1 -SiteOnly` to build the four MyST pages or `./build.ps1` to export static HTML. Both use the standard MyST article theme. Dash tests and experiment validation belong to the [Dash repository](https://github.com/mikuknightforever/paretoflow-dash/blob/main/VALIDATION.md).

When upgrading an existing checkout that used the former citation-preview patch, stop its preview and rebuild from a clean `_build` directory to avoid reusing the modified theme cache. Each original bibliography entry remains a single labeled paragraph so its hover preview includes the full reference.

## Article structure

- `paper.md`: original abstract, Sections 1–7, author notes, footnotes and all 66 references. Four interactive companions explain the algorithm, guidance, neighbor selection and a recorded sampling decision. The detailed process follows Generate → Pool → Filter → Select → Archive after Section 3.2.
- `appendix.md`: original Appendix A.1–A.13, with the published tables and figures retained directly.
- `supplements.md`: recording protocol and numerical limits, followed by archive playback over time and supporting frontier, design and local-ablation views. It links to the detailed process in the main paper instead of embedding it again.
- `reading-guide.md`: optional added interpretation and technical notes. Mechanism links open the relevant interaction; published results link directly to the original tables.

The original paper and appendix retain all 12 numbered figures (13 original image files), 23 tables and Equations 1–16 plus the unnumbered displayed expression. Original figure/table numbers and equation enumerators are retained. Native MyST markup normalizes whitespace and link/footnote syntax; author footnote symbols follow the PDF. Original spelling, scientific claims and table values are not silently corrected.

Original prose blocks carry `source-begin` / `source-end` comments for fidelity checks. Original graphics are local files under `content/figures/` and retain their downloaded bytes. `source/` records the pinned source, conversion inventory and validation results; these files are not article chapters.

## Meaning of the companions

The method and process panels replay actual decisions from a separate reduced CPU experiment. The guidance and neighbor geometry panels use constructed explanatory examples. Local supporting views explore the same recorded experiment. They do not rerun the authors' full benchmark, train on interaction or perform live sampling. Original benchmark evidence is read in the paper's tables and figures; the article no longer embeds or links to the four panels that replot ranks, task results, published ablations or timings.

The added experiment's settings, limitations and provenance are described in `supplements.md` and the Dash project's manifest. The interface changes preserve the sampler's existing recorded decisions, checkpoints and sample data.

## Repository history

This repository was split from the `article/` directory of [paretoflow-interactive-paper at cbcb17f](https://github.com/mikuknightforever/paretoflow-interactive-paper/tree/cbcb17f673fca3f81bdf0c7062a3dcbbd0d8110c), preserving the article's relevant commit history. The original combined repository remains available as a historical snapshot.

After the split, all four pages built successfully from this repository root with a fresh theme download. All 13 original image hashes match the source manifest; SVG and source HTML files are exempt from checkout line-ending conversion to preserve their downloaded bytes.
