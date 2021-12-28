#!/bin/bash
tail -n +5 "$0" | sqlite3
exit $?

select "Hello, World!";
