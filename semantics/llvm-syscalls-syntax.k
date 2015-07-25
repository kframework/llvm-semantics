// Copyright (c) 2013-2015 K Team. All Rights Reserved.

module LLVM-SYSCALLS-SYNTAX

    syntax KLabel ::= syscallHandler(K) [function]

    syntax KLabel ::= "'sys-write"
    rule syscallHandler(4) => 'sys-write

    syntax KLabel ::= "'sys-getpid"
    rule syscallHandler(20) => 'sys-getpid

    syntax KLabel ::= "'sys-brk"
    rule syscallHandler(45) => 'sys-brk

    syntax KLabel ::= "'sys-ioctl"
    rule syscallHandler(54) => 'sys-ioctl

    syntax KLabel ::= "'sys-rt-sigprocmask"
    rule syscallHandler(175) => 'sys-rt-sigprocmask

    syntax KLabel ::= "'sys-gettid"
    rule syscallHandler(224) => 'sys-gettid

    syntax KLabel ::= "'sys-exit-group"
    rule syscallHandler(248) => 'sys-exit-group

    syntax KLabel ::= "'sys-tgkill"
    rule syscallHandler(268) => 'sys-tgkill

endmodule
