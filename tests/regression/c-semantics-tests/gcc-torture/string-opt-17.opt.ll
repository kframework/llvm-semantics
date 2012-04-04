; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/string-opt-17.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"foobarbaz\00", align 1
@check2.r = internal unnamed_addr global i64 5, align 8
@.str1 = private unnamed_addr constant [3 x i8] c"az\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"baz\00", align 1

define i64 @test1(i8* %s, i64 %i) nounwind uwtable {
entry:
  %inc = add i64 %i, 1
  %add.ptr = getelementptr inbounds [10 x i8]* @.str, i64 0, i64 %i
  %call = tail call i8* @strcpy(i8* %s, i8* %add.ptr) nounwind
  ret i64 %inc
}

declare i8* @strcpy(i8*, i8* nocapture) nounwind

define i64 @check2() nounwind uwtable {
entry:
  %0 = load i64* @check2.r, align 8, !tbaa !0
  %cmp = icmp eq i64 %0, 5
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  store i64 6, i64* @check2.r, align 8, !tbaa !0
  ret i64 6
}

declare void @abort() noreturn

define void @test2(i8* %s) nounwind uwtable {
entry:
  %0 = load i64* @check2.r, align 8, !tbaa !0
  %cmp.i = icmp eq i64 %0, 5
  br i1 %cmp.i, label %check2.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

check2.exit:                                      ; preds = %entry
  store i64 6, i64* @check2.r, align 8, !tbaa !0
  %1 = bitcast i8* %s to i32*
  store i32 8020322, i32* %1, align 1
  ret void
}

define i32 @main() noreturn nounwind uwtable {
lor.lhs.false:
  %buf = alloca [10 x i8], align 4
  %arraydecay = getelementptr inbounds [10 x i8]* %buf, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %arraydecay, i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 7), i64 3, i32 1, i1 false)
  %call2 = call i32 @memcmp(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i64 3) nounwind
  %tobool = icmp eq i32 %call2, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %0 = load i64* @check2.r, align 8, !tbaa !0
  %cmp.i.i = icmp eq i64 %0, 5
  br i1 %cmp.i.i, label %test2.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

test2.exit:                                       ; preds = %if.end
  store i64 6, i64* @check2.r, align 8, !tbaa !0
  %1 = bitcast [10 x i8]* %buf to i32*
  store i32 8020322, i32* %1, align 4
  %call5 = call i32 @memcmp(i8* %arraydecay, i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i64 4) nounwind
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %test2.exit
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %test2.exit
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) nounwind readonly

declare void @exit(i32) noreturn

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
