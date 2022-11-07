#!/bin/env bash

set -e
set -x

lvim +LvimUpdate +q
lvim +LvimSyncCorePlugins +q
lvim +TSUpdate +q
lvim +PackerCompile +q
lvim +LvimCacheReset +q
