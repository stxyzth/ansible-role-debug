# ansible-role-debug

Installs epdb. A simple and handy role when debugging on remote
machines. Include the role, set a brake point, and debug it on remote.

See [Tips on Using Debuggers With
Ansible](http://michaeldehaan.net/post/35403909347/tips-on-using-debuggers-with-ansible).

In short:

* Add the role
* Create a break point in where you want to debug (`epdb.serve()`)
* Run `ansible-play` with `--forks 1`
* When the play stop, `ssh(1)` to the host
* Run `python -c "import epdb; epdb.connect()"`

To inspect generated python script, run `ansible-play` with
`ANSIBLE_KEEP_REMOTE_FILES` environment variable set. See [Debugging
AnsibleModule-based
modules](http://docs.ansible.com/ansible/developing_modules.html#debugging-ansiblemodule-based-modules).

# Requirements

`ansible` must be installed on the target when `debug_dump` is `true`

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| debug\_pip\_package | | {{ \_\_debug\_pip\_package }} |
| debug\_python\_version | | {{ \_\_debug\_python\_version }} |
| debug\_dump | set true to dump `ansible` variables to file | false |
| debug\_dump\_dir | path to directory to dump variables | /var/log |
| debug\_dump\_file | path to the dumped file | {{ debug\_dump\_dir }}/ansible\_variables |

## Debian

| Variable | Default |
|----------|---------|
| \_\_debug\_pip\_package | python-pip |

## FreeBSD

| Variable | Default |
|----------|---------|
| \_\_debug\_pip\_package | py{{ \_\_debug\_python\_version }}-pip |
| \_\_debug\_python\_version | 27 |

## OpenBSD

| Variable | Default |
|----------|---------|
| \_\_debug\_pip\_package | py-pip |
| \_\_debug\_python\_version | 2.7 |

[//]: # ( comment out when RedHat is supported )
[//]: # (## RedHat)
[//]: # (| Variable | Default |)
[//]: # (|----------|---------|)
[//]: # (| \_\_debug\_pip\_package | python-pip |)
[//]: # (| \_\_debug\_python\_version | "" |)

# Dependencies

None

# Example Playbook


# License

Copyright (c) 2016 Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

# Author Information

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

This README was created by [ansible-role-init](https://gist.github.com/trombik/d01e280f02c78618429e334d8e4995c0)
