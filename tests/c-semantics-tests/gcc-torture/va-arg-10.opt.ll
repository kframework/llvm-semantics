; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-10.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 16

define i32 @to_hex(i32 %a) nounwind uwtable {
entry:
  %cmp = icmp ugt i32 %a, 15
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %idxprom = zext i32 %a to i64
  %arrayidx = getelementptr inbounds [17 x i8]* @.str, i64 0, i64 %idxprom
  %0 = load i8* %arrayidx, align 1, !tbaa !0
  %conv = sext i8 %0 to i32
  ret i32 %conv
}

declare void @abort() noreturn

define void @fap(i32 %i, i8* nocapture %format, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %apc = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %apc, i64 0, i64 0
  %0 = bitcast [1 x %struct.__va_list_tag]* %apc to i8*
  %1 = bitcast %struct.__va_list_tag* %ap to i8*
  call void @llvm.va_copy(i8* %0, i8* %1)
  %call = call i64 @strlen(i8* %format) nounwind
  %sub = sub nsw i32 16, %i
  %conv = sext i32 %sub to i64
  %cmp = icmp eq i64 %call, %conv
  br i1 %cmp, label %while.cond, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

while.cond:                                       ; preds = %entry, %to_hex.exit
  %format.addr.0 = phi i8* [ %incdec.ptr, %to_hex.exit ], [ %format, %entry ]
  %2 = load i8* %format.addr.0, align 1, !tbaa !0
  %tobool = icmp eq i8 %2, 0
  br i1 %tobool, label %while.cond8, label %while.body

while.body:                                       ; preds = %while.cond
  %3 = va_arg %struct.__va_list_tag* %ap, i32
  %cmp.i = icmp ugt i32 %3, 15
  br i1 %cmp.i, label %if.then.i, label %to_hex.exit

if.then.i:                                        ; preds = %while.body
  call void @abort() noreturn nounwind
  unreachable

to_hex.exit:                                      ; preds = %while.body
  %incdec.ptr = getelementptr inbounds i8* %format.addr.0, i64 1
  %idxprom.i = zext i32 %3 to i64
  %arrayidx.i = getelementptr inbounds [17 x i8]* @.str, i64 0, i64 %idxprom.i
  %4 = load i8* %arrayidx.i, align 1, !tbaa !0
  %cmp4 = icmp eq i8 %2, %4
  br i1 %cmp4, label %while.cond, label %if.then6

if.then6:                                         ; preds = %to_hex.exit
  call void @abort() noreturn nounwind
  unreachable

while.cond8:                                      ; preds = %while.cond, %to_hex.exit25
  %formatc.0 = phi i8* [ %incdec.ptr11, %to_hex.exit25 ], [ %format, %while.cond ]
  %5 = load i8* %formatc.0, align 1, !tbaa !0
  %tobool9 = icmp eq i8 %5, 0
  br i1 %tobool9, label %while.end19, label %while.body10

while.body10:                                     ; preds = %while.cond8
  %6 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp.i20 = icmp ugt i32 %6, 15
  br i1 %cmp.i20, label %if.then.i21, label %to_hex.exit25

if.then.i21:                                      ; preds = %while.body10
  call void @abort() noreturn nounwind
  unreachable

to_hex.exit25:                                    ; preds = %while.body10
  %incdec.ptr11 = getelementptr inbounds i8* %formatc.0, i64 1
  %idxprom.i22 = zext i32 %6 to i64
  %arrayidx.i23 = getelementptr inbounds [17 x i8]* @.str, i64 0, i64 %idxprom.i22
  %7 = load i8* %arrayidx.i23, align 1, !tbaa !0
  %cmp15 = icmp eq i8 %5, %7
  br i1 %cmp15, label %while.cond8, label %if.then17

if.then17:                                        ; preds = %to_hex.exit25
  call void @abort() noreturn nounwind
  unreachable

while.end19:                                      ; preds = %while.cond8
  ret void
}

declare void @llvm.va_copy(i8*, i8*) nounwind

declare i64 @strlen(i8* nocapture) nounwind readonly

define void @f0(i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 0, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f1(i32 %a1, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 1, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f2(i32 %a1, i32 %a2, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 2, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f3(i32 %a1, i32 %a2, i32 %a3, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 3, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f4(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 4, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f5(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 5, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f6(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 6, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f7(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 7, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f8(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 8, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f9(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 9, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f10(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 10, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f11(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 11, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f12(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 12, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f13(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 13, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f14(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 14, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f15(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8, i32 %a9, i32 %a10, i32 %a11, i32 %a12, i32 %a13, i32 %a14, i32 %a15, i8* nocapture %format, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @fap(i32 15, i8* %format, %struct.__va_list_tag* %arraydecay)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i8*, ...)* @f0(i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 0), i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i8*, ...)* @f1(i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 1), i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i8*, ...)* @f2(i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 2), i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i8*, ...)* @f3(i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 3), i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i8*, ...)* @f4(i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 4), i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i8*, ...)* @f5(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 5), i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i8*, ...)* @f6(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 6), i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f7(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 7), i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f8(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 8), i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f9(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 9), i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f10(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 10), i32 10, i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f11(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 11), i32 11, i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f12(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 12), i32 12, i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f13(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 13), i32 13, i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f14(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 14), i32 14, i32 15)
  tail call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, ...)* @f15(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 15), i32 15)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
