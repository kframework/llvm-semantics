; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j041a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32 (i32)*, i32 (i32)* }

@x = common global %struct.s zeroinitializer, align 8
@pf = common global i32 (i32)** null, align 8

define i32 @g(i32 %v) nounwind uwtable {
entry:
  %v.addr = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  store i32 (i32)* @g, i32 (i32)** getelementptr inbounds (%struct.s* @x, i32 0, i32 1), align 8
  store i32 (i32)** getelementptr inbounds (%struct.s* @x, i32 0, i32 0), i32 (i32)*** @pf, align 8
  %0 = load i32 (i32)*** @pf, align 8
  %1 = bitcast i32 (i32)** %0 to i8*
  %add.ptr = getelementptr inbounds i8* %1, i64 8
  %2 = bitcast i8* %add.ptr to i32 (i32)**
  store i32 (i32)** %2, i32 (i32)*** @pf, align 8
  %3 = load i32 (i32)*** @pf, align 8
  %4 = load i32 (i32)** %3, align 8
  %call = call i32 %4(i32 2)
  ret i32 0
}
