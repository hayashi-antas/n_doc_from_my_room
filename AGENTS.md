# AGENTS.md

## Scope

This file applies to the workspace under `/Users/hayashiakira/workspace/nittetsu`.

## Handoff Note

- `AGENTS.md` stores the standing rules for this workspace.


## Slit Dam Screen Design Update Rules

- When updating slit dam screen design documents, compare the current UI in `nittetsu-lpweb` against the design document in `nittetsu-lpweb-docs`.
- Work carefully and incrementally. Prefer updating one screen at a time.
- Check both Slit Dam A and Slit Dam B in the actual application.
- If A and B differ meaningfully, reflect both in the design document.
- If the difference is minor, it is acceptable to document the richer screen and note what the other side does not have.

## Image Update Workflow

- Take fresh screenshots from the actual application before updating a screen design image.
- Use the local draw.io desktop app to place the screenshot and add numbered markers.
- Keep numbered markers editable in draw.io after the work is complete.
- Export the display image from draw.io as `.drawio.svg`.
- Use the exported `.drawio.svg` in Markdown image references.
- Keep the source `.drawio` file alongside the exported image so the numbering and positions can be adjusted later.
- The numbering on the image must follow the numbering scheme used by the corresponding table.
- Update the corresponding table to match the current UI while keeping the existing table column structure unless explicitly instructed otherwise.

## Numbering Convention Learned From Existing Images

- Match the image markers to the `No` column in the corresponding table exactly.
- Use a plain number such as `1` only when the table has a top-level row for the whole block or panel. Do not add `1` if the existing table starts directly from `a1`.
- Use letter prefixes such as `a`, `b`, `c` for distinct logical groups inside the image. A new letter usually starts at a new section heading, boxed area, or clearly separated cluster.
- Assign letter groups in broad visual order, usually from left to right and then from top to bottom.
- Within the same letter group, assign numbers in the visual order of the actual layout.
- If items are stacked vertically, number them from top to bottom.
- If multiple items appear on the same row, number them from left to right.
- If a group has multiple columns or sub-clusters, follow the visible layout of the original style rather than forcing a semantic label-input pairing rule.
- A single-section image may use only one letter series such as `a1`, `a2`, `a3`, while a larger block image may use `1` for the outer block and `a1`, `b1`, `c1` for inner groups.
- Preserve the existing numbering family when updating an existing screen unless the UI structure changed enough that the table must also change.
- Place each marker beside the specific label, control, or section heading named by the table row.

## Documentation Style

- Do not add process notes such as how the image was edited, how it is displayed, or that draw.io was used, unless explicitly requested.
- Keep the document focused on the screen image and the specification table.
- Avoid adding explanatory memo sections that describe the update process.

## Specification Table Format

- When writing or updating a screen specification table, keep the existing HTML table structure used in the document.
- Use this header order exactly:
  - `No`
  - `ラベル`
  - `コントロール`
  - `表示桁数`
  - `文字揃え`
  - `初期値`
  - `説明`
- Use this wrapper structure:
  - `<table>`
  - `<caption>画面名</caption>`
  - `<thead>` with the 7 headers above
  - `<tbody style="font-size: smaller;">`
- `No` must match the marker shown on the image exactly.
- `ラベル` should name the exact heading, label, unit, button text, or representative input item pointed to by the marker.
- `コントロール` should use the existing vocabulary seen in the document such as `text`, `number`, `select`, `button`, `checkbox`.
- `表示桁数` should contain the display format when relevant, such as `0`, `0.0`, `0.00`, `0.0000`; otherwise use `-`.
- `文字揃え` should use `左`, `中央`, or `右`.
- `初期値` should contain the actual initial display value when one is shown; otherwise use `-`.
- `説明` should briefly clarify what the marker represents, for example `セクション見出し`, `項目ラベル`, `入力欄`, `単位表示`, `列見出し`, `各行の名称`.
- If one visible row has separate label, input, and unit markers, add separate table rows for each marker instead of collapsing them into one row.

## Branch / Repository Context

- `nittetsu-lpweb` work should be based on `origin/phase-slitdam-ab`.
- `nittetsu-lpweb-docs` work should be based on an `origin/issue/248-*` branch.

## Recommended Setup Before Updating Docs

- Open both repositories side by side:
  - `/Users/akira_hayashi/Workspace/nittetsu/nittetsu-lpweb`
  - `/Users/akira_hayashi/Workspace/nittetsu/nittetsu-lpweb-docs`
- Start work from the correct base branches for each repository.
- Start `nittetsu-lpweb` with Docker before checking the UI.
- Prefer `docker compose up --build` from `nittetsu-lpweb` when the app container needs to be rebuilt.
- Confirm the app is reachable in the browser at `http://localhost:3000`.
- Use the actual application UI as the source of truth, not the old document image.

## One-Section Update Loop

- Update the slit dam design document one section at a time.
- After each section, stop and report back for review before moving on, unless the user explicitly asks to continue automatically.
- For each section, follow this order:
  1. Confirm the target section in `nittetsu-lpweb-docs/画面設計書/スリットダム/スリットダム画面設計書.md`.
  2. Confirm the current actual UI in `nittetsu-lpweb`.
  3. Check both A and B if the screen exists on both sides.
  4. Decide whether the section is still implemented.
  5. Take a fresh screenshot.
  6. Create or update the `.drawio`.
  7. Export `.drawio.svg`.
  8. Update the Markdown image reference if needed.
  9. Update the corresponding table.
  10. Report the completed section for review.

## Screen Existence / Removal Rules

- Do not invent screens that do not exist in the current application.
- If a documented section has no current UI and no current route or entry point, remove that section from the document rather than leaving placeholder text.
- If a feature exists only as a download action and has no settings/input screen, do not create a fake input screen in the document.
- If the user says a category is out of scope, skip it even if the old document still contains it.

## A / B Comparison Rules

- Check both Slit Dam A and Slit Dam B in the actual application whenever possible.
- If A and B are meaningfully different, document both or document the richer side and clearly note what the other side lacks.
- If one side is temporarily broken but the code/view structure is clearly the same as the other side, it is acceptable to use the working side as the screenshot source for that section.
- If one side is broken and equivalence cannot be confirmed from code, stop and ask the user for a decision.

## Screenshot / Asset Rules

- Save the fresh screenshot as a `.png` in `nittetsu-lpweb-docs/画面設計書/images`.
- Use the screen name already established by the document unless there is a strong reason to rename it.
- Keep these three files together for each updated section:
  - `*.png`
  - `*.drawio`
  - `*.drawio.svg`
- The exported display file must be `.drawio.svg`.
- The `.drawio.svg` must include embedded draw.io data so it can be reopened and edited later.
- Verify that the numbering is still editable after export by confirming the exported `.drawio.svg` contains embedded diagram data and/or reopens in draw.io.

## Marker Placement Quality Rules

- Place markers close to the specific target they describe.
- Do not place markers directly on top of important text if a nearby blank area is available.
- Do not place markers so far away that the association becomes ambiguous.
- Prefer the visual style learned from the existing document:
  - section titles near the title text
  - column headers near the header text
  - labels near the label text
  - values near the displayed value
  - buttons near the button
- For dense result tables, it is acceptable to use one marker for a row label, one for the variable, one for the unit, and one marker per representative result column value.

## Current Slit Dam Document Scope

- The current work is for the slit dam document only.
- `材料表` related settings screens are currently out of scope for this document update.
- If the user explicitly says a section such as `材料表` is not needed, skip that section and continue with slit dam-specific screens.

## Current Working Practice

- Prefer Playwright or equivalent browser automation to capture current screens consistently.
- If needed, create temporary sample data in the development database so result/detail screens can actually be opened.
- Use the actual rendered screen, not controller assumptions alone, when deciding what the document should show.
- When a result screen has changed from a single-item layout to a comparison table, rebuild both the image numbering and the table structure to match the current layout.
