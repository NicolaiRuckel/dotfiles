#!/bin/bash

PICTURES=$(xdg-user-dir PICTURES)
scrot "$PICTURES/screenshots/screenshot-%Y-%m-%d-%T.png"
