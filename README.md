# vim-pnpm

Simple vim command bindings to quickly run [pnpm](https://pnpm.js.org) stuff from vim.

## Commands Available, mapping with their pnpm equivalent:

* PnpmAdd
* PnpmInstall
* PnpmUpdate
* PnpmRemove
* PnpmLink
* PnpmUnlink
* PnpmTest
* PnpmRun

## Installation

It's recommended to use a plugin manager to manage your vim plugins. A few examples:

### Vundle

```
Plugin 'rajasegar/vim-pnpm'
```

### Plug

```
Plug 'rajasegar/vim-pnpm'
```

### NeoBundle

```
NeoBundle 'rajasegar/vim-pnpm'
```

## Usage

Simply run one of the commands. By default it just delegates to pnpm.

You can overwrite g:pnpm_command to, for instance, support dispatch:

```
let g:pnpm_command = "Dispatch pnpm {cmd}"
```

## Contribute

* Fork
* Code
* Test
* Pull-request
