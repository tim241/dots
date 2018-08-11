#!/usr/bin/env python2
from subprocess import check_output

def get_pass(account):
    return check_output("gpg -dq ~/.local/share/mutt/mail/" + account + ".gpg", shell=True).strip("\n")
