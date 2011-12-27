; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20011219-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @bar(i8* nocapture %x, i32 %y, i8* nocapture %z) nounwind uwtable readnone {
entry:
  ret void
}

define i64 @foo(i32 %x, i8* %y) nounwind uwtable readonly {
entry:
  switch i32 %x, label %sw.epilog [
    i32 10, label %sw.bb
    i32 11, label %sw.bb3
    i32 12, label %sw.bb6
    i32 13, label %sw.bb9
    i32 14, label %sw.bb12
  ]

sw.bb:                                            ; preds = %entry
  %0 = bitcast i8* %y to i64*
  %tmp2 = load i64* %0, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %1 = bitcast i8* %y to i64*
  %tmp5 = load i64* %1, align 8
  br label %sw.epilog

sw.bb6:                                           ; preds = %entry
  %2 = bitcast i8* %y to i64*
  %tmp8 = load i64* %2, align 8
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %3 = bitcast i8* %y to i64*
  %tmp11 = load i64* %3, align 8
  br label %sw.epilog

sw.bb12:                                          ; preds = %entry
  %4 = bitcast i8* %y to i64*
  %tmp14 = load i64* %4, align 8
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb12, %sw.bb9, %sw.bb6, %sw.bb3, %sw.bb
  %tmp151 = phi i64 [ %tmp14, %sw.bb12 ], [ %tmp11, %sw.bb9 ], [ %tmp8, %sw.bb6 ], [ %tmp5, %sw.bb3 ], [ %tmp2, %sw.bb ], [ undef, %entry ]
  ret i64 %tmp151
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
