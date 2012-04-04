; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/PR640.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@str = private unnamed_addr constant [6 x i8] c"ERROR\00"
@str2 = private unnamed_addr constant [10 x i8] c"All done.\00"

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %r.addr.i = alloca i32, align 4
  %0 = bitcast i32* %r.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  store i32 1, i32* %r.addr.i, align 4, !tbaa !0
  %call.i = call i32 (i8*, ...)* @test_stdarg_va(i8* %0, i32 1, i64 1981891429, i32 2, i32* %r.addr.i) nounwind
  %cmp.i = icmp eq i32 %call.i, 1
  br i1 %cmp.i, label %if.end.i, label %if.then

if.end.i:                                         ; preds = %entry
  %call5.i = call i32 (i8*, ...)* @test_stdarg_builtin_va(i8* %0, i32 1, i64 1981891433, i32 2, i32* %r.addr.i) nounwind
  %cmp6.i = icmp eq i32 %call5.i, 1
  br i1 %cmp6.i, label %test_stdarg.exit, label %if.then

test_stdarg.exit:                                 ; preds = %if.end.i
  %1 = load i32* %r.addr.i, align 4, !tbaa !0
  %and.i = and i32 %1, 1
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %cmp = icmp eq i32 %and.i, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %test_stdarg.exit, %if.end.i, %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str, i64 0, i64 0))
  br label %return

if.end:                                           ; preds = %test_stdarg.exit
  %puts3 = call i32 @puts(i8* getelementptr inbounds ([10 x i8]* @str2, i64 0, i64 0))
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.end ]
  ret i32 %retval.0
}

define internal i32 @test_stdarg_va(i8* %p1, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i8*
  call void @llvm.va_end(i8* %arraydecay1)
  %cmp = icmp eq i8* %3, %p1
  %cmp8 = icmp eq i32 %0, 1
  %or.cond = and i1 %cmp, %cmp8
  %cmp10 = icmp eq i64 %1, 1981891429
  %or.cond12 = and i1 %or.cond, %cmp10
  %cmp11 = icmp eq i32 %2, 2
  %cmp11. = and i1 %or.cond12, %cmp11
  %land.ext = zext i1 %cmp11. to i32
  ret i32 %land.ext
}

define internal i32 @test_stdarg_builtin_va(i8* %p1, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i8*
  call void @llvm.va_end(i8* %arraydecay1)
  %cmp = icmp eq i8* %3, %p1
  %cmp8 = icmp eq i32 %0, 1
  %or.cond = and i1 %cmp, %cmp8
  %cmp10 = icmp eq i64 %1, 1981891433
  %or.cond12 = and i1 %or.cond, %cmp10
  %cmp11 = icmp eq i32 %2, 2
  %cmp11. = and i1 %or.cond12, %cmp11
  %land.ext = zext i1 %cmp11. to i32
  ret i32 %land.ext
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
