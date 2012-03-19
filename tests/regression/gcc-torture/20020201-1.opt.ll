; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020201-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@cx = global i8 7, align 1
@sx = global i16 14, align 2
@ix = global i32 21, align 4
@lx = global i64 28, align 8
@Lx = global i64 35, align 8

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp = load i8* @cx, align 1
  %tmp.off = add i8 %tmp, -6
  %0 = icmp ugt i8 %tmp.off, 5
  br i1 %0, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = urem i8 %tmp, 6
  %cmp10 = icmp eq i8 %1, 1
  br i1 %cmp10, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end
  %tmp14 = load i16* @sx, align 2
  %tmp14.off = add i16 %tmp14, -12
  %2 = icmp ugt i16 %tmp14.off, 5
  br i1 %2, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end13
  tail call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.end13
  %3 = urem i16 %tmp14, 6
  %cmp30 = icmp eq i16 %3, 2
  br i1 %cmp30, label %if.end33, label %if.then32

if.then32:                                        ; preds = %if.end23
  tail call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.end23
  %tmp34 = load i32* @ix, align 4
  %tmp34.off = add i32 %tmp34, -18
  %4 = icmp ugt i32 %tmp34.off, 5
  br i1 %4, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end33
  tail call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end33
  %rem42 = urem i32 %tmp34, 6
  %cmp44 = icmp eq i32 %rem42, 3
  br i1 %cmp44, label %if.end47, label %if.then46

if.then46:                                        ; preds = %if.end40
  tail call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %if.end40
  %tmp48 = load i64* @lx, align 8
  %tmp48.off = add i64 %tmp48, -24
  %5 = icmp ugt i64 %tmp48.off, 5
  br i1 %5, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.end47
  tail call void @abort() noreturn nounwind
  unreachable

if.end54:                                         ; preds = %if.end47
  %rem56 = urem i64 %tmp48, 6
  %cmp58 = icmp eq i64 %rem56, 4
  br i1 %cmp58, label %if.end61, label %if.then60

if.then60:                                        ; preds = %if.end54
  tail call void @abort() noreturn nounwind
  unreachable

if.end61:                                         ; preds = %if.end54
  %tmp62 = load i64* @Lx, align 8
  %tmp62.off = add i64 %tmp62, -30
  %6 = icmp ugt i64 %tmp62.off, 5
  br i1 %6, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end61
  tail call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end61
  %rem70 = urem i64 %tmp62, 6
  %cmp72 = icmp eq i64 %rem70, 5
  br i1 %cmp72, label %if.end75, label %if.then74

if.then74:                                        ; preds = %if.end68
  tail call void @abort() noreturn nounwind
  unreachable

if.end75:                                         ; preds = %if.end68
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
