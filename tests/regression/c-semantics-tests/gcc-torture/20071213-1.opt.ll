; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071213-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @h(i32 %x, %struct.__va_list_tag* nocapture %ap) nounwind uwtable {
entry:
  switch i32 %x, label %sw.default [
    i32 1, label %sw.bb
    i32 5, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* %ap, i32
  %cmp = icmp eq i32 %0, 3
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %sw.bb
  %1 = va_arg %struct.__va_list_tag* %ap, i32
  %cmp1 = icmp eq i32 %1, 4
  br i1 %cmp1, label %return, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %sw.bb
  tail call void @abort() noreturn nounwind
  unreachable

sw.bb2:                                           ; preds = %entry
  %2 = va_arg %struct.__va_list_tag* %ap, i32
  %cmp3 = icmp eq i32 %2, 9
  br i1 %cmp3, label %lor.lhs.false4, label %if.then6

lor.lhs.false4:                                   ; preds = %sw.bb2
  %3 = va_arg %struct.__va_list_tag* %ap, i32
  %cmp5 = icmp eq i32 %3, 10
  br i1 %cmp5, label %return, label %if.then6

if.then6:                                         ; preds = %lor.lhs.false4, %sw.bb2
  tail call void @abort() noreturn nounwind
  unreachable

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %lor.lhs.false, %lor.lhs.false4
  ret void
}

declare void @abort() noreturn nounwind

define void @f1(i32 %i, i64 %j, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  switch i32 %i, label %sw.default.i [
    i32 1, label %sw.bb.i
    i32 5, label %sw.bb2.i
  ]

sw.bb.i:                                          ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp.i = icmp eq i32 %0, 3
  br i1 %cmp.i, label %lor.lhs.false.i, label %if.then.i

lor.lhs.false.i:                                  ; preds = %sw.bb.i
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp1.i = icmp eq i32 %1, 4
  br i1 %cmp1.i, label %h.exit, label %if.then.i

if.then.i:                                        ; preds = %lor.lhs.false.i, %sw.bb.i
  call void @abort() noreturn nounwind
  unreachable

sw.bb2.i:                                         ; preds = %entry
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp3.i = icmp eq i32 %2, 9
  br i1 %cmp3.i, label %lor.lhs.false4.i, label %if.then6.i

lor.lhs.false4.i:                                 ; preds = %sw.bb2.i
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp5.i = icmp eq i32 %3, 10
  br i1 %cmp5.i, label %h.exit, label %if.then6.i

if.then6.i:                                       ; preds = %lor.lhs.false4.i, %sw.bb2.i
  call void @abort() noreturn nounwind
  unreachable

sw.default.i:                                     ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

h.exit:                                           ; preds = %lor.lhs.false.i, %lor.lhs.false4.i
  %cmp = icmp eq i32 %i, 1
  %cmp3 = icmp eq i64 %j, 2
  %or.cond = and i1 %cmp, %cmp3
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %h.exit
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %h.exit
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, i32 %j, i32 %k, i64 %l, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  switch i32 %i, label %sw.default.i [
    i32 1, label %sw.bb.i
    i32 5, label %sw.bb2.i
  ]

sw.bb.i:                                          ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp.i = icmp eq i32 %0, 3
  br i1 %cmp.i, label %lor.lhs.false.i, label %if.then.i

lor.lhs.false.i:                                  ; preds = %sw.bb.i
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp1.i = icmp eq i32 %1, 4
  br i1 %cmp1.i, label %h.exit, label %if.then.i

if.then.i:                                        ; preds = %lor.lhs.false.i, %sw.bb.i
  call void @abort() noreturn nounwind
  unreachable

sw.bb2.i:                                         ; preds = %entry
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp3.i = icmp eq i32 %2, 9
  br i1 %cmp3.i, label %lor.lhs.false4.i, label %if.then6.i

lor.lhs.false4.i:                                 ; preds = %sw.bb2.i
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp5.i = icmp eq i32 %3, 10
  br i1 %cmp5.i, label %h.exit, label %if.then6.i

if.then6.i:                                       ; preds = %lor.lhs.false4.i, %sw.bb2.i
  call void @abort() noreturn nounwind
  unreachable

sw.default.i:                                     ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

h.exit:                                           ; preds = %lor.lhs.false.i, %lor.lhs.false4.i
  %cmp = icmp eq i32 %i, 5
  %cmp3 = icmp eq i32 %j, 6
  %or.cond = and i1 %cmp, %cmp3
  %cmp5 = icmp eq i32 %k, 7
  %or.cond10 = and i1 %or.cond, %cmp5
  %cmp7 = icmp eq i64 %l, 8
  %or.cond11 = and i1 %or.cond10, %cmp7
  br i1 %or.cond11, label %if.end, label %if.then

if.then:                                          ; preds = %h.exit
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %h.exit
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void (i32, i64, ...)* @f1(i32 1, i64 2, i32 3, i32 4)
  tail call void (i32, i32, i32, i64, ...)* @f2(i32 5, i32 6, i32 7, i64 8, i32 9, i32 10)
  ret i32 0
}
