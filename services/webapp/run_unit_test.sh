#!/bin/bash

# Load Reyns env
source /env.sh

# Add extra libraries to Pythonpath
#export PYTHONPATH=$PYTHONPATH:/opt/your_library

# Set custom log Levels
export DJANGO_LOG_LEVEL=ERROR
export EDJANGO_LOG_LEVEL=DEBUG

# To Python3
export EDJANGO_PYTHON=python3

# Generate migrations, as we might get here before they
# are automatically generated by the service startup.
cd /opt/webapp/eDjango/ && fab makemigrations

# Run the tests
cd /opt/webapp/eDjango/ && $EDJANGO_PYTHON manage.py test $@
