; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001068.ll'
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
  %l_17 = alloca [4 x i32], align 16
  %tmp1 = volatile load i32* @g_9, align 4
  %cmp = icmp ugt i32 %tmp1, 1702921374
  br i1 %cmp, label %lor.end11, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp2 = volatile load i32* @g_9, align 4
  %phitmp = icmp eq i32 %tmp2, 0
  br label %lor.end11

lor.end11:                                        ; preds = %entry, %lor.rhs
  %0 = phi i1 [ false, %entry ], [ %phitmp, %lor.rhs ]
  %sub.i4 = sext i1 %0 to i32
  %conv21 = and i32 %sub.i4, 255
  %rem.i3 = urem i32 %conv21, -1
  %tobool23 = icmp eq i32 %rem.i3, 0
  br i1 %tobool23, label %return, label %for.end67

for.end67:                                        ; preds = %lor.end11
  %arrayidx = getelementptr [4 x i32]* %l_17, i64 0, i64 0
  store i32 5, i32* %arrayidx, align 16
  %arrayidx.1 = getelementptr [4 x i32]* %l_17, i64 0, i64 1
  store i32 5, i32* %arrayidx.1, align 4
  %arrayidx.2 = getelementptr [4 x i32]* %l_17, i64 0, i64 2
  %arrayidx.3 = getelementptr [4 x i32]* %l_17, i64 0, i64 3
  store i32 5, i32* %arrayidx.3, align 4
  store i32 4, i32* %arrayidx.2, align 8
  store i32 0, i32* @g_16, align 4
  %tmp68 = load i16* @g_12, align 2
  %conv69 = sext i16 %tmp68 to i64
  br label %return

return:                                           ; preds = %lor.end11, %for.end67
  %storemerge2 = phi i64 [ %conv69, %for.end67 ], [ 6, %lor.end11 ]
  ret i64 %storemerge2
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_17.i = alloca [4 x i32], align 16
  %0 = bitcast [4 x i32]* %l_17.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %tmp1.i = volatile load i32* @g_9, align 4
  %cmp.i = icmp ugt i32 %tmp1.i, 1702921374
  br i1 %cmp.i, label %lor.end11.i, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %entry
  %tmp2.i = volatile load i32* @g_9, align 4
  %phitmp.i = icmp eq i32 %tmp2.i, 0
  br label %lor.end11.i

lor.end11.i:                                      ; preds = %lor.rhs.i, %entry
  %1 = phi i1 [ false, %entry ], [ %phitmp.i, %lor.rhs.i ]
  %sub.i4.i = sext i1 %1 to i32
  %conv21.i = and i32 %sub.i4.i, 255
  %rem.i3.i = urem i32 %conv21.i, -1
  %tobool23.i = icmp eq i32 %rem.i3.i, 0
  br i1 %tobool23.i, label %func_1.exit, label %for.end67.i

for.end67.i:                                      ; preds = %lor.end11.i
  %arrayidx.i = getelementptr [4 x i32]* %l_17.i, i64 0, i64 0
  store i32 5, i32* %arrayidx.i, align 16
  %arrayidx.1.i = getelementptr [4 x i32]* %l_17.i, i64 0, i64 1
  store i32 5, i32* %arrayidx.1.i, align 4
  %arrayidx.2.i = getelementptr [4 x i32]* %l_17.i, i64 0, i64 2
  %arrayidx.3.i = getelementptr [4 x i32]* %l_17.i, i64 0, i64 3
  store i32 5, i32* %arrayidx.3.i, align 4
  store i32 4, i32* %arrayidx.2.i, align 8
  store i32 0, i32* @g_16, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %lor.end11.i, %for.end67.i
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i32* @g_9, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i16* @g_12, align 2
  %conv = sext i16 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %conv) nounwind
  %tmp4 = load i32* @g_16, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
