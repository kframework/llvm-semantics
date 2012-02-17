; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001068.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
entry:
  %retval = alloca i64, align 8
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
  %tmp = load i32* %l_8, align 4
  %tmp1 = volatile load i32* @g_9, align 4
  %cmp = icmp ule i32 %tmp, %tmp1
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp2 = volatile load i32* @g_9, align 4
  %tobool = icmp ne i32 %tmp2, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %conv = trunc i32 %lor.ext to i8
  %tmp3 = load i64* %l_10, align 8
  %conv4 = trunc i64 %tmp3 to i8
  %call = call signext i8 @safe_mod_func_int8_t_s_s(i8 signext %conv, i8 signext %conv4)
  %tmp5 = load i32* %l_8, align 4
  %tobool6 = icmp ne i32 %tmp5, 0
  br i1 %tobool6, label %lor.end11, label %lor.rhs7

lor.rhs7:                                         ; preds = %lor.end
  %tmp8 = load i16* @g_12, align 2
  %conv9 = sext i16 %tmp8 to i32
  %neg = xor i32 %conv9, -1
  %tobool10 = icmp ne i32 %neg, 0
  br label %lor.end11

lor.end11:                                        ; preds = %lor.rhs7, %lor.end
  %1 = phi i1 [ true, %lor.end ], [ %tobool10, %lor.rhs7 ]
  %lor.ext12 = zext i1 %1 to i32
  %conv13 = trunc i32 %lor.ext12 to i8
  %call14 = call signext i8 @safe_unary_minus_func_int8_t_s(i8 signext %conv13)
  %conv15 = sext i8 %call14 to i32
  %tmp16 = load i32* %l_8, align 4
  %cmp17 = icmp ugt i32 %conv15, %tmp16
  %conv18 = zext i1 %cmp17 to i32
  %conv19 = trunc i32 %conv18 to i8
  %call20 = call zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %call, i8 zeroext %conv19)
  %conv21 = zext i8 %call20 to i32
  %call22 = call i32 @safe_mod_func_uint32_t_u_u(i32 %conv21, i32 -1)
  %tobool23 = icmp ne i32 %call22, 0
  br i1 %tobool23, label %if.then, label %if.else

if.then:                                          ; preds = %lor.end11
  store i32* %l_23, i32** %l_24, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %tmp27 = load i32* %i, align 4
  %cmp28 = icmp slt i32 %tmp27, 4
  br i1 %cmp28, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp30 = load i32* %i, align 4
  %idxprom = sext i32 %tmp30 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %l_17, i32 0, i64 %idxprom
  store i32 5, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp31 = load i32* %i, align 4
  %inc = add nsw i32 %tmp31, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call32 = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext 4, i32 -1)
  %conv33 = sext i8 %call32 to i32
  %arrayidx34 = getelementptr inbounds [4 x i32]* %l_17, i32 0, i64 2
  store i32 %conv33, i32* %arrayidx34, align 4
  store i32 0, i32* @g_16, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc62, %for.end
  %tmp36 = load i32* @g_16, align 4
  %cmp37 = icmp ne i32 %tmp36, 0
  br i1 %cmp37, label %for.body39, label %for.end67

for.body39:                                       ; preds = %for.cond35
  store i32 1, i32* %l_22, align 4
  %tmp41 = load i32* %l_22, align 4
  %conv42 = trunc i32 %tmp41 to i8
  %call43 = call zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %conv42, i8 zeroext 113)
  %conv44 = zext i8 %call43 to i32
  %tmp45 = load i32* %l_23, align 4
  %or = or i32 %tmp45, %conv44
  store i32 %or, i32* %l_23, align 4
  %tmp46 = load i32** %l_24, align 8
  %cmp47 = icmp eq i32* null, %tmp46
  %conv48 = zext i1 %cmp47 to i32
  %tmp49 = load i32** %l_24, align 8
  %tmp50 = load i32* %tmp49
  %xor = xor i32 %tmp50, %conv48
  store i32 %xor, i32* %tmp49
  %tmp51 = load i64* %l_10, align 8
  %tobool52 = icmp ne i64 %tmp51, 0
  br i1 %tobool52, label %if.then53, label %if.end

if.then53:                                        ; preds = %for.body39
  br label %lbl_25

if.end:                                           ; preds = %for.body39
  br label %lbl_25

lbl_25:                                           ; preds = %if.end, %if.then53
  %tmp54 = load i32* %l_8, align 4
  %tobool55 = icmp ne i32 %tmp54, 0
  br i1 %tobool55, label %if.then56, label %if.end57

if.then56:                                        ; preds = %lbl_25
  br label %for.inc62

if.end57:                                         ; preds = %lbl_25
  %tmp58 = load i64* %l_10, align 8
  %tobool59 = icmp ne i64 %tmp58, 0
  br i1 %tobool59, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end57
  br label %for.end67

if.end61:                                         ; preds = %if.end57
  br label %for.inc62

for.inc62:                                        ; preds = %if.end61, %if.then56
  %tmp63 = load i32* @g_16, align 4
  %conv64 = trunc i32 %tmp63 to i16
  %call65 = call signext i16 @safe_sub_func_int16_t_s_s(i16 signext %conv64, i16 signext 2)
  %conv66 = sext i16 %call65 to i32
  store i32 %conv66, i32* @g_16, align 4
  br label %for.cond35

for.end67:                                        ; preds = %if.then60, %for.cond35
  %tmp68 = load i16* @g_12, align 2
  %conv69 = sext i16 %tmp68 to i64
  store i64 %conv69, i64* %retval
  br label %return

if.else:                                          ; preds = %lor.end11
  store i32 6, i32* %l_26, align 4
  %tmp71 = load i32* %l_26, align 4
  %conv72 = sext i32 %tmp71 to i64
  store i64 %conv72, i64* %retval
  br label %return

return:                                           ; preds = %if.else, %for.end67
  %2 = load i64* %retval
  ret i64 %2
}

define internal i32 @safe_mod_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui2.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %ui1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i32* %ui1.addr, align 4
  %tmp3 = load i32* %ui2.addr, align 4
  %rem = urem i32 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp1, %cond.true ], [ %rem, %cond.false ]
  ret i32 %cond
}

define internal zeroext i8 @safe_sub_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui1.addr, align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* %ui2.addr, align 1
  %conv2 = zext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
}

define internal signext i8 @safe_mod_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si2.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i8* %si1.addr, align 1
  %conv3 = sext i8 %tmp2 to i32
  %cmp4 = icmp eq i32 %conv3, -128
  br i1 %cmp4, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %tmp6 = load i8* %si2.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv7, -1
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %tmp10 = load i8* %si1.addr, align 1
  %conv11 = sext i8 %tmp10 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %tmp12 = load i8* %si1.addr, align 1
  %conv13 = sext i8 %tmp12 to i32
  %tmp14 = load i8* %si2.addr, align 1
  %conv15 = sext i8 %tmp14 to i32
  %rem = srem i32 %conv13, %conv15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv11, %cond.true ], [ %rem, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define internal signext i8 @safe_unary_minus_func_int8_t_s(i8 signext %si) nounwind uwtable {
entry:
  %si.addr = alloca i8, align 1
  store i8 %si, i8* %si.addr, align 1
  %tmp = load i8* %si.addr, align 1
  %conv = sext i8 %tmp to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i8
  ret i8 %conv1
}

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i8* %left.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %right.addr, align 4
  %cmp3 = icmp uge i32 %tmp2, 32
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i8* %left.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %tmp8 = load i32* %right.addr, align 4
  %shr = ashr i32 127, %tmp8
  %cmp9 = icmp sgt i32 %conv7, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp11 = load i8* %left.addr, align 1
  %conv12 = sext i8 %tmp11 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp13 = load i8* %left.addr, align 1
  %conv14 = sext i8 %tmp13 to i32
  %tmp15 = load i32* %right.addr, align 4
  %shl = shl i32 %conv14, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv12, %cond.true ], [ %shl, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define internal zeroext i8 @safe_mod_func_uint8_t_u_u(i8 zeroext %ui1, i8 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i8, align 1
  %ui2.addr = alloca i8, align 1
  store i8 %ui1, i8* %ui1.addr, align 1
  store i8 %ui2, i8* %ui2.addr, align 1
  %tmp = load i8* %ui2.addr, align 1
  %conv = zext i8 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i8* %ui1.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i8* %ui1.addr, align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i8* %ui2.addr, align 1
  %conv7 = zext i8 %tmp6 to i32
  %rem = srem i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %rem, %cond.false ]
  %conv8 = trunc i32 %cond to i8
  ret i8 %conv8
}

define internal signext i16 @safe_sub_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i16
  ret i16 %conv3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %o = alloca i32, align 4
  %p = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = volatile load i32* @g_9, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i16* @g_12, align 2
  %conv = sext i16 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %tmp4 = load i32* @g_16, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
