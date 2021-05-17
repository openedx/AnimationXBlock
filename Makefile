.PHONY : requirements upgrade

PIP_COMPILE_OPTS = -v

PIP_COMPILE = pip-compile --upgrade $(PIP_COMPILE_OPTS)

upgrade: export CUSTOM_COMPILE_COMMAND=make upgrade
upgrade: ## update the requirements/*.txt files with the latest packages satisfying requirements/*.in
	pip install -q -r requirements/pip_tools.txt
	$(PIP_COMPILE) -o requirements/pip_tools.txt requirements/pip_tools.in
	$(PIP_COMPILE) -o requirements/base.txt requirements/base.in

requirements: ## install development environment requirements
	pip install -r requirements/base.txt
