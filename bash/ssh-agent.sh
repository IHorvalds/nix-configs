#!/bin/bash

grep -Fl "BEGIN OPENSSH PRIVATE KEY" -r ~/.ssh/ | xargs ssh-add
