; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001134.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i8, i32, i8, i16, i32, i32 }

@g_2 = global i32 -387616869, align 4
@g_5 = global %struct.S0 { i8 -97, i32 37671261, i8 7, i16 1, i32 0, i32 -804944457 }, align 4
@func_1.l_6 = internal unnamed_addr constant %struct.S0 { i8 6, i32 -5, i8 78, i16 -7, i32 -1, i32 1415504527 }, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_5.f0 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5.f1 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5.f2 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5.f3 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5.f4 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5.f5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S0* sret %agg.result) nounwind uwtable {
entry:
  %l_6 = alloca %struct.S0, align 4
  %tmp = bitcast %struct.S0* %l_6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds (%struct.S0* @func_1.l_6, i32 0, i32 0), i64 20, i32 4, i1 false)
  store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* @g_2, align 4
  %cmp = icmp sge i32 %tmp1, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = bitcast %struct.S0* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 0), i64 20, i32 4, i1 false)
  br label %return

for.inc:                                          ; No predecessors!
  %tmp3 = load i32* @g_2, align 4
  %call = call i32 @safe_sub_func_uint32_t_u_u(i32 %tmp3, i32 1)
  store i32 %call, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = bitcast %struct.S0* %agg.result to i8*
  %tmp5 = bitcast %struct.S0* %l_6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* %tmp5, i64 20, i32 4, i1 false)
  br label %return

return:                                           ; preds = %for.end, %for.body
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %sub = sub i32 %tmp, %tmp1
  ret i32 %sub
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %tmp = alloca %struct.S0, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  call void @func_1(%struct.S0* sret %tmp)
  %tmp1 = load i32* @g_2, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp1)
  %tmp2 = load i8* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 0), align 1
  %conv = zext i8 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  %tmp4 = load i32* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i8* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 2), align 1
  %conv7 = zext i8 %tmp6 to i32
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %conv7)
  %tmp9 = load i16* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 3), align 2
  %conv10 = sext i16 %tmp9 to i32
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %conv10)
  %tmp12 = load i32* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 4), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 5), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp14)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
