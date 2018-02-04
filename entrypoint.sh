#!/bin/bash

export PATH="/esp-open-sdk/xtensa-lx106-elf/bin:$PATH"
export SDK_PATH=/esp-open-rtos

exec "$@"