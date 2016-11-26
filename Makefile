
# target: help — this help
help:
	@egrep "^# target:" [Mm]akefile

# target: make new string to translate
makemessages:
	pygettext hello_l10n/
	msginit --input=messages.pot --locale=en_US.UTF-8 --output=hello_l10n/locale/base/LC_MESSAGES/django.po
	rm messages.pot
	mkdir -p hello_l10n/locale/en/LC_MESSAGES/
	mkdir -p hello_l10n/locale/ru/LC_MESSAGES/
	cp hello_l10n/locale/base/LC_MESSAGES/django.po hello_l10n/locale/en/LC_MESSAGES/django.po
	cp hello_l10n/locale/base/LC_MESSAGES/django.po hello_l10n/locale/ru/LC_MESSAGES/django.po

# target: compile strings
compilemessages:
	msgfmt hello_l10n/locale/en/LC_MESSAGES/django.po -o hello_l10n/locale/en/LC_MESSAGES/django.mo
	msgfmt hello_l10n/locale/ru/LC_MESSAGES/django.po -o hello_l10n/locale/ru/LC_MESSAGES/django.mo
	msgfmt hello_l10n/locale/base/LC_MESSAGES/django.po -o hello_l10n/locale/base/LC_MESSAGES/django.mo

# target: clean pyc's
clean:
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -type d | xargs rm -fr
