; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030120-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define zeroext i16 @test1(i16 zeroext %w) nounwind uwtable readnone {
entry:
  %cmp3 = icmp eq i16 %w, 0
  %w.addr.0 = select i1 %cmp3, i16 2, i16 %w
  ret i16 %w.addr.0
}

define i64 @test2(i64 %w) nounwind uwtable readnone {
entry:
  %0 = icmp eq i64 %w, 0
  %.w = select i1 %0, i64 2, i64 %w
  ret i64 %.w
}

define i32 @test3(i16 zeroext %a) nounwind uwtable readnone {
entry:
  %and = and i16 %a, 1
  %tobool = icmp eq i16 %and, 0
  br i1 %tobool, label %if.else, label %return

if.else:                                          ; preds = %entry
  %not.tobool1 = icmp ne i16 %a, 0
  %. = zext i1 %not.tobool1 to i32
  br label %return

return:                                           ; preds = %if.else, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ %., %if.else ]
  ret i32 %retval.0
}

define i32 @main() noreturn nounwind uwtable {
if.end11:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
