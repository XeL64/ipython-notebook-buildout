#!/bin/bash
    #pythonexc='/opt/python/Python-2.7.6/python'
    #pythonexc='/opt/python/Python-2.7.10/python'
    #pythonexc='/opt/python/Python-3.4.3/python'
    #pythonexc='/opt/python/Python-2.7.10-build/bin/python'
    pythonexc='/opt/python/Python-3.5.0-build/bin/python3'
# cleanup all previous bootstrap & buildout
rm -fr bootstrap.py bootstrap-buildout.py bin develop-eggs eggs .installed.cfg parts buildout.log
# downloads url bootstrap.py :
# http://downloads.buildout.org/2.1/bootstrap.py
#wget http://downloads.buildout.org/2.1/bootstrap.py
wget https://bootstrap.pypa.io/bootstrap-buildout.py
# Start bootstrap
#${pythonexc} bootstrap.py -v 2.1.1 -c buildout.cfg
${pythonexc} bootstrap-buildout.py -c buildout.cfg
# Start buildout
./bin/buildout -Nvc buildout-dev.cfg $@ 2>&1 | tee buildout.log
