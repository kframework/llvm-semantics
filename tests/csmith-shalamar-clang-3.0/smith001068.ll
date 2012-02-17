; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001068.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = constant i32 129285222, align 4
@g_12 = global i16 15877, align 2
@g_16 = global i32 -1880295534, align 4
@g_15 = global [9 x [7 x [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]]]] [[7 x [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]]] [[1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]]], [7 x [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]]] [[1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]]], [7 x [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]]] [[1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]]], [7 x [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]]] [[1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]]], [7 x [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]]] [[1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]]], [7 x [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]]] [[1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]]], [7 x [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]]] [[1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]]], [7 x [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]]] [[1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]]], [7 x [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]]] [[1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32*]]]]]] [[1 x [1 x [1 x [1 x [1 x i32*]]]]] [[1 x [1 x [1 x [1 x i32*]]]] [[1 x [1 x [1 x i32*]]] [[1 x [1 x i32*]] [[1 x i32*] [i32* @g_16]]]]]]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_16 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
  %1 = alloca i64, align 8
  %l_8 = alloca i32, align 4
  %l_10 = alloca i64, align 8
  %l_23 = alloca i32, align 4
  %l_17 = alloca [4 x i32], align 16
  %l_24 = alloca i32*, align 8
  %i = alloca i32, align 4
  %l_22 = alloca i32, align 4
  %l_26 = alloca i32, align 4
  store i32 1702921375, i32* %l_8, align 4
  store i64 0, i64* %l_10, align 8
  store i32 139385858, i32* %l_23, align 4
  %2 = load i32* %l_8, align 4
  %3 = load volatile i32* @g_9, align 4
  %4 = icmp ule i32 %2, %3
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load volatile i32* @g_9, align 4
  %7 = icmp ne i32 %6, 0
  br label %8

; <label>:8                                       ; preds = %5, %0
  %9 = phi i1 [ true, %0 ], [ %7, %5 ]
  %10 = zext i1 %9 to i32
  %11 = trunc i32 %10 to i8
  %12 = load i64* %l_10, align 8
  %13 = trunc i64 %12 to i8
  %14 = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %11, i8 signext %13)
  %15 = load i32* %l_8, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %22, label %17

; <label>:17                                      ; preds = %8
  %18 = load i16* @g_12, align 2
  %19 = sext i16 %18 to i32
  %20 = xor i32 %19, -1
  %21 = icmp ne i32 %20, 0
  br label %22

; <label>:22                                      ; preds = %17, %8
  %23 = phi i1 [ true, %8 ], [ %21, %17 ]
  %24 = zext i1 %23 to i32
  %25 = trunc i32 %24 to i8
  %26 = call signext i8 @safe_unary_minus_func_int8_t_s(i8 signext %25)
  %27 = sext i8 %26 to i32
  %28 = load i32* %l_8, align 4
  %29 = icmp ugt i32 %27, %28
  %30 = zext i1 %29 to i32
  %31 = trunc i32 %30 to i8
  %32 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %14, i8 zeroext %31)
  %33 = zext i8 %32 to i32
  %34 = call i32 @safe_mod_func_uint32_t_u_u(i32 %33, i32 -1)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %88

; <label>:36                                      ; preds = %22
  store i32* %l_23, i32** %l_24, align 8
  store i32 0, i32* %i, align 4
  br label %37

; <label>:37                                      ; preds = %44, %36
  %38 = load i32* %i, align 4
  %39 = icmp slt i32 %38, 4
  br i1 %39, label %40, label %47

; <label>:40                                      ; preds = %37
  %41 = load i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [4 x i32]* %l_17, i32 0, i64 %42
  store i32 5, i32* %43, align 4
  br label %44

; <label>:44                                      ; preds = %40
  %45 = load i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %37

; <label>:47                                      ; preds = %37
  %48 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext 4, i32 -1)
  %49 = sext i8 %48 to i32
  %50 = getelementptr inbounds [4 x i32]* %l_17, i32 0, i64 2
  store i32 %49, i32* %50, align 4
  store i32 0, i32* @g_16, align 4
  br label %51

; <label>:51                                      ; preds = %80, %47
  %52 = load i32* @g_16, align 4
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %85

; <label>:54                                      ; preds = %51
  store i32 1, i32* %l_22, align 4
  %55 = load i32* %l_22, align 4
  %56 = trunc i32 %55 to i8
  %57 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %56, i8 zeroext 113)
  %58 = zext i8 %57 to i32
  %59 = load i32* %l_23, align 4
  %60 = or i32 %59, %58
  store i32 %60, i32* %l_23, align 4
  %61 = load i32** %l_24, align 8
  %62 = icmp eq i32* null, %61
  %63 = zext i1 %62 to i32
  %64 = load i32** %l_24, align 8
  %65 = load i32* %64
  %66 = xor i32 %65, %63
  store i32 %66, i32* %64
  %67 = load i64* %l_10, align 8
  %68 = icmp ne i64 %67, 0
  br i1 %68, label %69, label %70

; <label>:69                                      ; preds = %54
  br label %71

; <label>:70                                      ; preds = %54
  br label %71

; <label>:71                                      ; preds = %70, %69
  %72 = load i32* %l_8, align 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %71
  br label %80

; <label>:75                                      ; preds = %71
  %76 = load i64* %l_10, align 8
  %77 = icmp ne i64 %76, 0
  br i1 %77, label %78, label %79

; <label>:78                                      ; preds = %75
  br label %85

; <label>:79                                      ; preds = %75
  br label %80

; <label>:80                                      ; preds = %79, %74
  %81 = load i32* @g_16, align 4
  %82 = trunc i32 %81 to i16
  %83 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %82, i16 signext 2)
  %84 = sext i16 %83 to i32
  store i32 %84, i32* @g_16, align 4
  br label %51

; <label>:85                                      ; preds = %78, %51
  %86 = load i16* @g_12, align 2
  %87 = sext i16 %86 to i64
  store i64 %87, i64* %1
  br label %91

; <label>:88                                      ; preds = %22
  store i32 6, i32* %l_26, align 4
  %89 = load i32* %l_26, align 4
  %90 = sext i32 %89 to i64
  store i64 %90, i64* %1
  br label %91

; <label>:91                                      ; preds = %88, %85
  %92 = load i64* %1
  ret i64 %92
}

define internal i32 @safe_mod_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %ui1, i32* %1, align 4
  store i32 %ui2, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  %9 = load i32* %2, align 4
  %10 = urem i32 %8, %9
  br label %11

; <label>:11                                      ; preds = %7, %5
  %12 = phi i32 [ %6, %5 ], [ %10, %7 ]
  ret i32 %12
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  ret i8 %8
}

define internal signext i8 @safe_mod_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %si1, i8* %1, align 1
  store i8 %si2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, -128
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %6
  %11 = load i8* %2, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10, %0
  %15 = load i8* %1, align 1
  %16 = sext i8 %15 to i32
  br label %23

; <label>:17                                      ; preds = %10, %6
  %18 = load i8* %1, align 1
  %19 = sext i8 %18 to i32
  %20 = load i8* %2, align 1
  %21 = sext i8 %20 to i32
  %22 = srem i32 %19, %21
  br label %23

; <label>:23                                      ; preds = %17, %14
  %24 = phi i32 [ %16, %14 ], [ %22, %17 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define internal signext i8 @safe_unary_minus_func_int8_t_s(i8 signext %si) nounwind uwtable {
  %1 = alloca i8, align 1
  store i8 %si, i8* %1, align 1
  %2 = load i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %left, i8* %1, align 1
  store i32 %right, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp uge i32 %7, 32
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %6
  %10 = load i8* %1, align 1
  %11 = sext i8 %10 to i32
  %12 = load i32* %2, align 4
  %13 = ashr i32 127, %12
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %9, %6, %0
  %16 = load i8* %1, align 1
  %17 = sext i8 %16 to i32
  br label %23

; <label>:18                                      ; preds = %9
  %19 = load i8* %1, align 1
  %20 = sext i8 %19 to i32
  %21 = load i32* %2, align 4
  %22 = shl i32 %20, %21
  br label %23

; <label>:23                                      ; preds = %18, %15
  %24 = phi i32 [ %17, %15 ], [ %22, %18 ]
  %25 = trunc i32 %24 to i8
  ret i8 %25
}

define internal zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %ui1, i8* %1, align 1
  store i8 %ui2, i8* %2, align 1
  %3 = load i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i8* %1, align 1
  %11 = zext i8 %10 to i32
  %12 = load i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = srem i32 %11, %13
  br label %15

; <label>:15                                      ; preds = %9, %6
  %16 = phi i32 [ %8, %6 ], [ %14, %9 ]
  %17 = trunc i32 %16 to i8
  ret i8 %17
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %si1, i16* %1, align 2
  store i16 %si2, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 %4, %6
  %8 = trunc i32 %7 to i16
  ret i16 %8
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %o = alloca i32, align 4
  %p = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @func_1()
  %5 = load volatile i32* @g_9, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i16* @g_12, align 2
  %8 = sext i16 %7 to i32
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %10 = load i32* @g_16, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %10)
  %12 = load i32* %1
  ret i32 %12
}

declare i32 @printf(i8*, ...)
