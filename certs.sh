#!/bin/bash
# This will run on port 80 and run the cert checks, so run this before starting the server

certbot certonly --standalone --force-renewal -d hmdm.summitclassicalacademy.org
