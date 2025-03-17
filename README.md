# bianca_workshops

<!-- markdownlint-disable MD013 --><!-- Badges cannot be split up over lines, hence will break 80 characters per line -->

[![Build pages](https://github.com/UPPMAX/bianca_workshops/actions/workflows/gh.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/bianca_workshops/actions/workflows/gh.yaml)
[![Check links](https://github.com/UPPMAX/bianca_workshops/actions/workflows/check_links.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/bianca_workshops/actions/workflows/check_links.yaml)
[![Check markdown](https://github.com/UPPMAX/bianca_workshops/actions/workflows/check_markdown.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/bianca_workshops/actions/workflows/check_markdown.yaml)
[![Check spelling](https://github.com/UPPMAX/bianca_workshops/actions/workflows/check_spelling.yaml/badge.svg?branch=main)](https://github.com/UPPMAX/bianca_workshops/actions/workflows/check_spelling.yaml)

<!-- markdownlint-enable MD013 -->

This repository contains the source code for the [Bianca workshop](https://uppmax.github.io/bianca_workshops/)

## Credits

The website is created using
[mkdocs-material](https://squidfunk.github.io/mkdocs-material).

## Files used by continuous integration scripts

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

Filename                              |Descriptions
--------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------
[mlc_config.json](mlc_config.json)    |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally
[.spellcheck.yml](.spellcheck.yml)    |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.wordlist.txt](.wordlist.txt)        |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.markdownlint.jsonc](.markdownlint.jsonc)|Configuration of the markdown linter, use `markdownlint "docs/**/*.md"` to do markdown linting locally. The name of this file is a default name.
[.markdownlintignore](.markdownlintignore)|Files ignored by the markdown linter, use `markdownlint "docs/**/*.md"` to do markdown linting locally. The name of this file is a default name.

<!-- markdownlint-enable MD013 -->
