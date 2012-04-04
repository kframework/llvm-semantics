; ModuleID = '/home/david/src/c-semantics/tests/unitTests/passUnion.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.U = type { i8 }

@u = global %union.U { i8 5 }, align 1

define zeroext i8 @f(i8 %x.coerce) nounwind uwtable readnone {
entry:
  ret i8 %x.coerce
}

define i32 @main() nounwind uwtable readonly {
entry:
  %0 = load i8* getelementptr inbounds (%union.U* @u, i64 0, i32 0), align 1
  %conv = zext i8 %0 to i32
  ret i32 %conv
}
