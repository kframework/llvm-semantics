; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/renamings.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@global_param_1 = global i32 5, align 4
@global_local_1 = global i32 5, align 4
@global_local_2 = global i32 5, align 4
@str4 = internal constant [8 x i8] c"SUCCESS\00"

define i32 @f1(i32 %global_param_1) nounwind uwtable readnone {
entry:
  ret i32 %global_param_1
}

define i32 @f2(i32 %global_param_2) nounwind uwtable readnone {
entry:
  ret i32 %global_param_2
}

define i32 @g1() nounwind uwtable readnone {
entry:
  ret i32 7
}

define i32 @g2() nounwind uwtable readnone {
entry:
  ret i32 7
}

define i32 @main() nounwind uwtable {
if.end26:
  %puts8 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str4, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
