import sys
import os
import pexpect
import time

from pexpect import pxssh
import getpass

from level import Level

DEBUG = True
vm_ip = "127.0.0.1"
vm_port = "4242"

levels = (
    Level(name="level00"),
    Level(name="level01"),

    Level(name="level02"),
    Level(name="level03"),
    Level(name="level04"),
    Level(name="level05"),
    Level(name="level06"),
    Level(name="level07"),
    Level(name="level08")
)

def send_source_to_vm(level, flag):
    p = pexpect.spawn("scp -P {port} ./{current_level}/source{ext} {next_level}@{ip}:/tmp/ft_{current_level}{ext}".format(
        port=vm_port,
        ip=vm_ip,
        current_level=levels[level],
        next_level=levels[level + 1],
        ext=levels[level].ext
    ))
    if DEBUG:
        p.logfile = sys.stdout.buffer
    p.expect(["password:", pexpect.EOF])
    p.sendline(levels[level].flag)
    p.expect("100%")

def compile_source(level_index, level):
    try:
        next_level = levels[level_index + 1]
        s = pxssh.pxssh()
        if DEBUG:
            s.logfile = sys.stdout.buffer
        s.login(
            server=vm_ip,
            username=next_level.name,
            password=level.flag,
            port=vm_port
        )
        s.sendline('{compiler} -m32 -fno-stack-protector -Wno-format-security -z execstack -o /tmp/ft_{current_level} /tmp/ft_{current_level}{ext}'.format(
            compiler=level.compiler,
            current_level=level.name,
            ext=level.ext
        ))
        s.prompt()
        s.sendline('chmod +wx ~')
        s.prompt()
        s.sendline('chmod u+s /tmp/ft_{current_level}'.format(
            current_level=level.name,
        ))
        s.prompt()
        s.sendline('mv /tmp/ft_{current_level} /home/users/{next_level}/'.format(
            current_level=level.name,
            next_level=next_level.name,
        ))
        s.prompt()
        s.logout()
    except pxssh.ExceptionPxssh as e:
        print(e)


for level_index, level in enumerate(levels):
    print("Processing " + level.name)
    if level.flag:
        send_source_to_vm(level_index, level)
        compile_source(level_index, level)
    else:
        print("No flag found !")
print("FINISHED")
