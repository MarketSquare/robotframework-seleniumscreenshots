#!/bin/sh
LIBDOC="python -m robot.libdoc -F REST"

$LIBDOC --name="SeleniumScreenshots" SeleniumScreenshots keywords.html

jupyter nbconvert --to html --TemplateExporter.exclude_input_prompt=True --TemplateExporter.exclude_output_prompt=True --TemplateExporter.template_file=nbconvert.tpl Introduction\ to\ SeleniumScreenshots.ipynb

jupyter nbconvert --to script Introduction\ to\ SeleniumScreenshots.ipynb

