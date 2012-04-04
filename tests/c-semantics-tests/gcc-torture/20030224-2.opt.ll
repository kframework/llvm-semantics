; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030224-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type <{ %struct.jint16_t, %struct.jint16_t, i32 }>
%struct.jint16_t = type <{ i16 }>

@node = common global %struct.node zeroinitializer, align 1
@node_p = global %struct.node* @node, align 8

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
