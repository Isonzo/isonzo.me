---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
tags: []
summary:
image_dir: "{{ .Name | anchorize }}"
image:
draft: true
---

