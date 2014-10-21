TinyOS development Tools Cookbook
======================

- This cookbook installs and setups TinyOS development tools.


Requirements
------------
Chef 10.0+.

- package - `apt`
- package - `git`


Platforms
---------
Tested on
- Debian jessie alpha 1 release


Attributes
----------
#### chef-tinyos::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef-tinyos']['main-dir']</tt></td>
    <td>String</td>
    <td>path to TinyOS main directory</td>
    <td><tt>/usr/src/tinyos-main</tt></td>
  </tr>
</table>


Usage
-----
#### chef-tinyos::default

Just include `chef-tinyos` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef-tinyos]"
  ]
}
```

License and Authors
-------------------
- Copyright (c) 2014, Shigemi ISHIDA
- This software is released under the BSD 3-clause license: See `LICENSE`.
