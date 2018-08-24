<h1><b>An ethics checklist for data scientists</b></h1>


`deon` is a command-line tool that allows you to easily add an ethics checklist to your data science projects. We support creating a new, standalone checklist file or appending a checklist to an existing analysis in [many common formats](#supported-file-types).

---

**δέον** • (déon) [n.] (_Ancient Greek_) <small><a href="https://en.wiktionary.org/wiki/%CE%B4%CE%AD%CE%BF%CE%BD#Ancient_Greek" target="_blank" style="text-decoration: none; color: #6d6d6d">wikitionary</a></small>
 > Duty; that which is binding, needful, right, proper. 

--------

The conversation about ethics in data science, machine learning, and AI is increasingly important. The goal of `deon` is to push that conversation forward and provide concrete, actionable reminders to the developers that have influence over how data science gets done.

# Background and perspective

We have a particular perspective with this package that we will use to make decisions about contributions, issues, PRs, and other maintenance and support activities.

First and foremost, our goal is not to be arbitrators of what ethical concerns merit inclusion. We have a [process for changing the default checklist](#changing-the-checklist), but we believe that many domain-specific concerns are not included and teams will benefit from developing [custom checklists](#custom-checklists). Not every checklist item will be relevant. We encourage teams to remove items, sections, or mark items as `N/A` as the concerns of their projects dictate. 

Second, we built our initial list from a set of proposed items on [multiple checklists that we referenced](#checklist-citations). This checklist was heavily inspired by an article written by Mike Loukides, Hilary Mason, and DJ Patil and published by O'Reilly: ["Of Oaths and Checklists"](https://www.oreilly.com/ideas/of-oaths-and-checklists). We owe a great debt to the thinking that proceeded this, and we look forward to thoughtful engagement with the ongoing discussion about checklists for data science ethics.

Third, we believe in the power of examples to bring the principles of data ethics to bear on human experience. This repository includes a [list of real-world examples](http://deon.drivendata.org/examples/) connected with each item in the default checklist. We encourage you to contribute relevant use cases that you believe can benefit the community by their example. In addition, if you have a topic, idea, or comment that doesn't seem right for the documentation, please add it to the [wiki page](https://github.com/drivendataorg/deon/wiki) for this project!

Fourth, we can't define exhaustively every term that appears in the checklist. Some of these terms are open to interpretation or mean different things in different contexts. We recommend that when relevant, users create their own glossary for reference.

Fifth, we are working at a level of abstraction that cannot concretely recommend a specific action (e.g., "remove variable X from your model"). Nearly all of the items on the checklist are meant to provoke discussion among good-faith actors who take their ethical responsibilities seriously. Because of this, most of the items are framed as prompts to discuss or consider. Teams will want to document these discussions and decisions for posterity.

Sixth, we believe the primary benefit of a checklist is ensuring that we don't overlook important work. Sometimes it is difficult with pressing deadlines and a demand to multitask to make sure we do the hard work to think about the big picture. This package is meant to help ensure that those discussions happen, even in fast-moving environments. Ethics is hard, and we expect some of the conversations that arise from this checklist may also be hard.

Seventh, we want all the checklist items to be as simple as possible (but no simpler), and to be actionable.

Eighth, we want to avoid any items that strictly fall into the realm of statistical best practices. Instead, we want to highlight the areas where we need to pay particular attention above and beyond best practices.

# Using this tool

## Prerequisites

 - Python >3.6: Your project need not be Python 3, but you need Python 3 to execute this tool.

## Installation

```
$ pip install deon
```

## Simple usage

We recommend adding a checklist as the first step in your data science project. After creating your project folder, you could run:

```
$ deon -o ETHICS.md
```

This will create a markdown file called `ETHICS.md` that you can add directly to your project.

For simple one-off analyses, you can append the checklist to a Jupyter notebook or RMarkdown file using the `-o` flag to indicate the output file. `deon` will automatically append if that file already exists.

```
$ jupyter notebook my-analysis.ipynb

...

$ deon -o my-analysis.ipynb  # append cells to existing output file
```

This checklist can be used by individuals or teams to ensure that reviewing the ethical implications of their work is part of every project. The checklist is meant as a jumping-off point, and it should spark deeper and more thourough discussions rather than replace those discussions.


# Supported file types

Here are the currently supported file types. We will accept pull requests with new file types if there is a strong case for widespread use of that filetype.

{% for f, n in supported_formats.items() %}
- `{{ f }}`: {{ n }}{% endfor %}

# Command line options

```
{{ cli_options }}
```

# Default checklist

{{ default_checklist }}

# Custom checklists

This is not meant to be the only ethical checklist, but instead we try to capture reasonable defaults that are general enough to be widely useful. For your own projects with particular concerns, we recommend your own `checklist.yml` file that is maintained by your team and passed to this tool with the `-l` flag.

Custom checklists must follow the same schema as `checklist.yml`. There must be a top-level `title` which is a string, and `sections` which is a list. Each section in the list `sections` must have a `title`, a `section_id`, and then a list of `lines`. Each line must have a `line_id` and a `line` string which is the content. The format is as follows:

```
title: TITLE
sections: 
  - title: SECTION TITLE
    section_id: SECTION NUMBER
    lines:
        - line_id: LINE NUMBER
          line: LINE CONTENT
```

# Changing the checklist

Please see [the framing](#background-and-perspective) for an understanding of our perspective. Given this perspective, we will consider changes to the default checklist that fit with that perspective and follow this process.

Our goal is to have checklist items that are actionable as part of a review of data science work or as part of a plan. Please avoid suggesting items that are too vague (e.g., "do no harm") or too specific (e.g., "remove social security numbers from data"). 

**Note: This process is an experiment and is subject to change based on how well it works. Our goal is to avoid :flame: wars in the issue threads while still making a tool that will make adding an ethics checklist to a project easy.**

To request a change, please file an issue with a title that starts with one of: "CREATE, UPDATE, DELETE". There are FOUR requirements for an issue requesting a change to the checklist:

 - A justification for the change
 - At least 10 thumbs up from the community for the issue
 - A published example (academic or press article) of where neglecting the principle has lead to concrete harm (articles that discuss potential or hypothetical harm will not be considered sufficient)
 - A consideration of related items that already exist, and why this change is different from what exists

 A pull request to add an item should change:

  - [`checklist.yml`](https://github.com/drivendataorg/deon/blob/master/checklist.yml): contains the default checklist items
  - [`examples.yml`](https://github.com/drivendataorg/deon/blob/master/examples.yml): contains example of harms caused when the item was not considered

# Discussion and commentary

In addition to this documentation, the [wiki pages for the GitHub repository](https://github.com/drivendataorg/deon/wiki) are enabled. This is a good place for sharing of links and discussion of how the checklsits are used in practice.

If you have a topic, idea, or comment that doesn't seem right for the documentation, please add it to the wiki!

# References, reading, and more

 A robust discussion of data ethics is important for the profession. The goal of this tool is to make it easier to implement ethics review within technical projects. There are lots of great resources if you want to think about data ethics, and we encourage you to do so!

## Checklist citations

We're excited to see so many articles popping up on data ethics! The short list below includes articles that directly informed the checklist content as well as a few case studies and thought-provoking pieces on the big picture.

- [Of oaths and checklists](https://www.oreilly.com/ideas/of-oaths-and-checklists)
- How to build ethics into AI ([Part I](https://medium.com/salesforce-ux/how-to-build-ethics-into-ai-part-i-bf35494cce9) and [Part II](https://medium.com/salesforce-ux/how-to-build-ethics-into-ai-part-ii-a563f3372447))
- [An ethical checklist for data science](https://dssg.uchicago.edu/2015/09/18/an-ethical-checklist-for-data-science/)
- [How to recognize exclusion in AI](https://medium.com/microsoft-design/how-to-recognize-exclusion-in-ai-ec2d6d89f850)
- [Case studies in data ethics](https://www.oreilly.com/ideas/case-studies-in-data-ethics)
- [Technology is biased too. How do we fix it?](https://fivethirtyeight.com/features/technology-is-biased-too-how-do-we-fix-it/)
- [The dark secret at the heart of AI](https://www.technologyreview.com/s/604087/the-dark-secret-at-the-heart-of-ai/)

## Where things have gone wrong

To make the ideas contained in the checklist more concrete, we've compiled [examples](http://deon.drivendata.org/examples/) of times when things have gone wrong. They're paired these with the checklist questions to help illuminate where in process ethics discussions may have helped provide a course correction.