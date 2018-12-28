#!/bin/sh
LIBDOC="python -m robot.libdoc -F REST"

$LIBDOC --name="SeleniumScreenshots" SeleniumScreenshots docs/keywords.html

