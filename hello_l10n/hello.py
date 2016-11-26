# coding: utf-8

try:
    from django.utils.translation import ugettext as _
except ImportError:
    # fallback on python localization
    import gettext
    import os

    BASE_DIR = os.path.dirname(__file__)
    LOCALE_DIR = os.path.join(BASE_DIR, 'locale')

    t = gettext.translation('django', LOCALE_DIR, fallback=True)
    _ = t.ugettext


MESSAGE = _('Hello l10n!')


if __name__ == '__main__':
    print(MESSAGE)
