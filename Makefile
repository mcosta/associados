
deps:
	@pip install -r deploy/requirements.txt
	@pip install -r deploy/requirements_test.txt

setup: deps
	@python manage.py syncdb

run:
	@python manage.py runserver 0.0.0.0:8000

clean:
	@find . -name "*.pyc" -delete

test: clean
	@python manage.py test --settings associados.settings_test --verbosity=2


help:
	@grep '^[^#[:space:]].*:' Makefile | awk -F ":" '{print $$1}'
