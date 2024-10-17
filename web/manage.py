#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys
import pydevd_pycharm

try:
    pydevd_pycharm.settrace('192.168.1.102', port=17777, stdoutToServer=True, stderrToServer=True, suspend=False, trace_only_current_thread=False)
except:
    print("Unable to connect to the remote debugger. Continuing without debugging.")

def main():
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'reNgine.settings')
    # show rengine artwork
    f = open('art/reNgine.txt', 'r')
    file_contents = f.read()
    print (file_contents)
    f.close()
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()
