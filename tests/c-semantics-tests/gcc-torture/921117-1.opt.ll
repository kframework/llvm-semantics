; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921117-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [11 x i8], i32 }

@.str = private unnamed_addr constant [11 x i8] c"0123456789\00", align 1
@cell = common global %struct.s zeroinitializer, align 4

define i32 @check(i64 %p.coerce0, i64 %p.coerce1) nounwind uwtable readonly {
entry:
  %p = alloca { i64, i64 }, align 8
  %0 = getelementptr { i64, i64 }* %p, i64 0, i32 0
  store i64 %p.coerce0, i64* %0, align 8
  %1 = getelementptr { i64, i64 }* %p, i64 0, i32 1
  store i64 %p.coerce1, i64* %1, align 8
  %.mask = and i64 %p.coerce1, -4294967296
  %cmp = icmp eq i64 %.mask, 425201762304
  br i1 %cmp, label %cond.false, label %return

cond.false:                                       ; preds = %entry
  %arraydecay37 = bitcast { i64, i64 }* %p to i8*
  %call = call i32 @strcmp(i8* %arraydecay37, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0)) nounwind
  br label %return

return:                                           ; preds = %entry, %cond.false
  %retval.0 = phi i32 [ %call, %cond.false ], [ 1, %entry ]
  ret i32 %retval.0
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

define i32 @main() noreturn nounwind uwtable {
entry:
  %p.i = alloca { i64, i64 }, align 8
  store i32 99, i32* getelementptr inbounds (%struct.s* @cell, i64 0, i32 1), align 4, !tbaa !0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds (%struct.s* @cell, i64 0, i32 0, i64 0), i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i64 11, i32 1, i1 false)
  %0 = load i64* bitcast (i8* getelementptr inbounds (%struct.s* @cell, i64 0, i32 0, i64 8) to i64*), align 4
  %1 = bitcast { i64, i64 }* %p.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  %2 = getelementptr { i64, i64 }* %p.i, i64 0, i32 0
  store i64 3978425819141910832, i64* %2, align 8
  %3 = getelementptr { i64, i64 }* %p.i, i64 0, i32 1
  store i64 %0, i64* %3, align 8
  %.mask.i = and i64 %0, -4294967296
  %cmp.i = icmp eq i64 %.mask.i, 425201762304
  br i1 %cmp.i, label %check.exit, label %if.then

check.exit:                                       ; preds = %entry
  %call.i = call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  %tobool = icmp eq i32 %call.i, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry, %check.exit
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %check.exit
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
